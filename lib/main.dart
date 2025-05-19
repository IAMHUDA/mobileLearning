import 'Courses.dart';
import 'HomeScreen.dart';
import 'Messages.dart';
import 'Profile.dart';
import 'Search.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi SD Kelas 4',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'ComicSansMS',
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    const HomeScreen(),
    const Courses(),
    const Search(),
    const Messages(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        width: size.width,
        child: Stack(
          children: [
            CustomPaint(
              size: Size(size.width, 80),
              painter: BNBCustomerPainter(),
            ),
            SizedBox(
              width: size.width,
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildNavItem(Icons.home_outlined, Icons.home, 0),
                  buildNavItem(Icons.album_outlined, Icons.album, 1),
                  buildNavItem(Icons.search_outlined, Icons.search, 2),
                  buildNavItem(Icons.message_outlined, Icons.message, 3),
                  buildNavItem(Icons.person_outline, Icons.person, 4),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNavItem(IconData icon, IconData activeIcon, int index) {
    bool isSelected = selectedIndex == index;
    Color activeColor = Colors.blue;
    Color inactiveColor = Colors.grey;

    return IconButton(
      onPressed: () {
        setState(() {
          selectedIndex = index;
        });
      },
      icon: Icon(
        isSelected ? activeIcon : icon,
        color: isSelected ? activeColor : inactiveColor,
        size: 30,
      ),
    );
  }
}

class BNBCustomerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20);
    path.quadraticBezierTo(size.width * 0.05, 0, size.width * 0.2, 0);
    path.quadraticBezierTo(size.width * 0.5, 35, size.width * 0.8, 0);
    path.quadraticBezierTo(size.width * 0.95, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawShadow(path, Colors.black.withOpacity(0.15), 8, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
