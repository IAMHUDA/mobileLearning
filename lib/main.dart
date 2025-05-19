import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import 'CourseMaterial.dart'; // alias QuizMaterial
import 'Messages.dart';
import 'Profile.dart';

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
      home: const MainNavigationWrapper(),
    );
  }
}

class MainNavigationWrapper extends StatefulWidget {
  const MainNavigationWrapper({Key? key}) : super(key: key);

  @override
  State<MainNavigationWrapper> createState() => _MainNavigationWrapperState();
}

class _MainNavigationWrapperState extends State<MainNavigationWrapper> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    const HomeScreen(),
    QuizMaterial(), // pastikan ini didefinisikan di CourseMaterial.dart
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
        height: 70,
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Stack(
            children: [
              CustomPaint(
                size: Size(size.width, 70),
                painter: BNBCustomerPainter(),
              ),
              Center(
                heightFactor: 0.6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildNavItem(Icons.home_outlined, Icons.home, 0, 'Beranda'),
                    buildNavItem(Icons.assignment_outlined, Icons.assignment, 1, 'Tugas'),
                    buildNavItem(Icons.feedback_outlined, Icons.feedback, 2, 'Feedback'),
                    buildNavItem(Icons.person_outline, Icons.person, 3, 'Profil'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNavItem(IconData icon, IconData activeIcon, int index, String label) {
    bool isSelected = selectedIndex == index;
    Color activeColor = Colors.deepPurple;
    Color inactiveColor = Colors.grey.shade600;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isSelected ? activeIcon : icon,
            color: isSelected ? activeColor : inactiveColor,
            size: 28,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? activeColor : inactiveColor,
              fontSize: 12,
            ),
          )
        ],
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
