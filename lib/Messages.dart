import 'package:flutter/material.dart';

class Messages extends StatefulWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController!.addListener(() {
      setState(() {}); // Trigger rebuild when tab index changes
    });
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_tabController == null) {
      // Avoid building UI if controller is not yet ready
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Messages',
          style: TextStyle(color: Colors.black),
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(text: 'Notifications'),
            Tab(text: 'Learning Feedback'),
          ],
        ),
        actions: [
          if (_tabController!.index == 0)
            Container(
              margin: const EdgeInsets.only(right: 20),
              child: const Center(
                child: Text(
                  'Mark All as read',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
              ),
            )
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildNotificationsTab(),
          _buildFeedbackTab(),
        ],
      ),
    );
  }

  Widget _buildNotificationsTab() {
    final List<Map<String, String>> notifications = [
      {
        'name': 'Ralph Edwards',
        'time': '5 min ago',
        'message': 'Completed UI/UX Design course',
        'avatar': 'assets/avatar1.png'
      },
      {
        'name': 'Jane Cooper',
        'time': '1 hour ago',
        'message': 'Sent you a message',
        'avatar': 'assets/avatar2.png'
      },
      {
        'name': 'Devon Lane',
        'time': '3 hours ago',
        'message': 'Completed assignment',
        'avatar': 'assets/avatar3.png'
      },
      {
        'name': 'Courtney Henry',
        'time': '1 day ago',
        'message': 'Gave you feedback',
        'avatar': 'assets/avatar4.png'
      },
    ];

    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(notifications[index]['avatar']!),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    notifications[index]['name']!,
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    notifications[index]['time']!,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              subtitle: Text(
                notifications[index]['message']!,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Divider(height: 1, color: Colors.grey),
          ],
        );
      },
    );
  }

  Widget _buildFeedbackTab() {
    final Map<String, double> weeklyProgress = {
      'Week 1': 30,
      'Week 2': 60,
      'Week 3': 80,
      'Week 4': 95,
    };

    final List<String> skillsImproved = [
      'UI Design',
      'Prototyping',
      'Usability Testing',
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '📈 Monthly Learning Summary',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: weeklyProgress.length,
              itemBuilder: (context, index) {
                String week = weeklyProgress.keys.elementAt(index);
                double progress = weeklyProgress[week]!;
                return Container(
                  width: 90,
                  margin: const EdgeInsets.only(right: 16),
                  child: Column(
                    children: [
                      Text(week, style: const TextStyle(fontWeight: FontWeight.w500)),
                      const SizedBox(height: 8),
                      Expanded(
                        child: Container(
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade100,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: FractionallySizedBox(
                            alignment: Alignment.bottomCenter,
                            heightFactor: progress / 100,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text('${progress.toInt()}%'),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            '💡 Skills Improved',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: skillsImproved.map((skill) {
              return Chip(
                label: Text(skill),
                backgroundColor: Colors.green.shade100,
              );
            }).toList(),
          ),
          const SizedBox(height: 24),
          const Text(
            '🧑‍🏫 Instructor Feedback',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          const Card(
            elevation: 2,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Great job this month! 👏',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'You showed steady progress in prototyping and UI design. '
                    'Try to improve consistency in design components and continue '
                    'practicing usability testing for better user experience.',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            '📌 Next Steps for You',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          const Card(
            elevation: 2,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'In the next month, focus on learning more about design systems and accessibility. '
                'Participate in group design critiques to sharpen your review skills.',
              ),
            ),
          ),
          const SizedBox(height: 32),
          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                // Action for detailed report
              },
              icon: const Icon(Icons.insert_chart),
              label: const Text('View Full Monthly Report'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                backgroundColor: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
