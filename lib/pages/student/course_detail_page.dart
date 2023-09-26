import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trident_interview/database/database.dart';
import 'package:trident_interview/repository/app_repository.dart';
import 'package:trident_interview/repository/user/user_repository.dart';

class CourseDetailPage extends StatefulWidget {
  const CourseDetailPage({Key? key, required this.courseId}) : super(key: key);

  final int courseId;

  @override
  CourseDetailPageState createState() => CourseDetailPageState();
}

class CourseDetailPageState extends State<CourseDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<AppRepository, UserRepository>(
      builder: (context, appRepository, userRepository, child) {
        final studentId = userRepository.currentUser!.id;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Course Details'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Course Title',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                // Display other course details
                const Text('Other Course Info 1'),
                const Text('Other Course Info 2'),
                const Text('Other Course Info 3'),
                const Spacer(),
                StreamBuilder<bool>(
                  stream: appRepository.watchEnrollCourse(
                      studentId, widget.courseId),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasData && snapshot.data == true) {
                      return ElevatedButton(
                        onPressed: () async {
                          await appRepository.unenrollCourse(
                              studentId, widget.courseId);
                        },
                        child: const Text('Un Regis'),
                      );
                    } else {
                      return ElevatedButton(
                        onPressed: () async {
                          await appRepository.enrollCourse(
                              studentId, widget.courseId);
                        },
                        child: const Text('Regis'),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
