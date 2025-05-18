import 'AllCourses.dart';
import 'CoursePlaylist.dart';
import 'Filter.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController mail = TextEditingController();

  @override
  void dispose() {
    mail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text('Hello John!'),
              const Text(
                'Find your course',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  SizedBox(
                    height: 55,
                    width: 300,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            offset: const Offset(5.0, 5.0),
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                          )
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: mail,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            size: 30,
                            color: Colors.grey,
                          ),
                          hintText: "Search",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () async {
                        await Future.delayed(const Duration(milliseconds: 500));
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Filter()),
                        );
                      },
                      child: Container(
                        width: 60,
                        height: 55,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 241, 85, 54),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Icon(
                          Icons.filter_list,
                          color: Colors.white,
                          size: 33,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: 365,
                    height: 190,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 107, 140, 254),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Limited Time Offer',
                          style: TextStyle(color: Colors.white54, fontSize: 15),
                        ),
                        const Text(
                          '30% OFF',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 37,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'For all courses',
                          style: TextStyle(color: Colors.white54, fontSize: 16),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.all(10),
                          width: 130,
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 241, 85, 54),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: Text(
                              'Get offer Now',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: -20,
                    right: 5,
                    child: Image.asset(
                      'assets/images/alarm-clock.png',
                      width: 160,
                      height: 160,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Popular Courses',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () async {
                      await Future.delayed(const Duration(milliseconds: 500));
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AllCourses()),
                      );
                    },
                    child: Ink(
                      height: 18,
                      child: Text(
                        'See All',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue.shade700,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _courseCard(
                    imagePath: 'assets/images/ui_ux_design.png',
                    title: 'UX/UI Design',
                    duration: '5h 30 min',
                    rating: '4.9 (522 reviews)',
                    onTap: launch,
                  ),
                  _courseCard(
                    imagePath: 'assets/images/web-development.png',
                    title: 'Web Development',
                    duration: '5h 30 min',
                    rating: '4.9 (522 reviews)',
                    onTap: launch,
                    imageWidth: 140,
                    imageHeight: 140,
                    padding: const EdgeInsets.all(10),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CoursePlaylist()),
                      );
                    },
                    child: Container(
                      width: 170,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/development.png',
                            width: 100,
                            height: 120,
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Mobile Development',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          const Row(
                            children: [
                              Icon(Icons.access_time, color: Colors.grey, size: 20),
                              Text('5h 30 min', style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                          const SizedBox(height: 5),
                          const Row(
                            children: [
                              Icon(Icons.star, color: Colors.orange),
                              Text('4.9 (522 reviews)', style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                          const SizedBox(height: 6),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/python.png',
                          width: 140,
                          height: 140,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Python From A to Z',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        const Row(
                          children: [
                            Icon(Icons.access_time, color: Colors.grey, size: 20),
                            Text('5h 30 min', style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                        const SizedBox(height: 5),
                        const Row(
                          children: [
                            Icon(Icons.star, color: Colors.orange),
                            Text('4.9 (522 reviews)', style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _courseCard({
    required String imagePath,
    required String title,
    required String duration,
    required String rating,
    required VoidCallback onTap,
    double imageWidth = 170,
    double imageHeight = 170,
    EdgeInsetsGeometry? padding,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      padding: padding,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Column(
            children: [
              Image.asset(imagePath, width: imageWidth, height: imageHeight),
              const SizedBox(height: 5),
              Text(title, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(Icons.access_time, color: Colors.grey, size: 20),
                  Text(duration, style: const TextStyle(color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.orange),
                  Text(rating, style: const TextStyle(color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 6),
            ],
          ),
        ),
      ),
    );
  }

  void _showLoaderDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        content: Row(
          children: const [
            CircularProgressIndicator(),
            SizedBox(width: 10),
            Text('Wait for it...'),
          ],
        ),
      ),
    );
  }

  Future<void> launch() async {
    _showLoaderDialog(context);
    await Future.delayed(const Duration(seconds: 1));
    Navigator.pop(context); // tutup dialog
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CoursePlaylist()),
    );
  }
}
