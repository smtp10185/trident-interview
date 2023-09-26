import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:trident_interview/database/database.dart';
import 'package:trident_interview/repository/app_repository.dart';

class CourseListPage extends StatelessWidget {
  const CourseListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appRepository = Provider.of<AppRepository>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Courses List'),
      ),
      body: StreamBuilder<List<Course>>(
        stream: appRepository.watchAllCourses(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No courses available.'));
          } else {
            final courses = snapshot.data!;
            return ListView.builder(
              itemCount: courses.length,
              itemBuilder: (context, index) {
                final course = courses[index];
                return ListTile(
                  title: Text(course.title),
                  onTap: () {
                    context.go('student-course-detail/${course.courseId}');
                    // Assuming Course has an id property
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
