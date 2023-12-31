import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class StudentDashboardPage extends StatelessWidget {
  const StudentDashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student Dashboard')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.go('/student-course-list');
              },
              child: const Text('Course List'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.go('/student-instructor-list');
              },
              child: const Text('Instructor List'),
            ),
          ],
        ),
      ),
    );
  }
}
