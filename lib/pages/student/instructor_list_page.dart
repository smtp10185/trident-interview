import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:trident_interview/database/database.dart';
import 'package:trident_interview/repository/app_repository.dart';

class InstructorListPage extends StatelessWidget {
  const InstructorListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appRepository = Provider.of<AppRepository>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Instructors And Courses'),
      ),
      body: StreamBuilder<List<InstructorWithCoursesViewData>>(
        stream: appRepository.watchAllInstructorsWithCourses(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            final instructorsData = groupBy(snapshot.data!, (i) => i.name);

            return ListView.builder(
              itemCount: instructorsData.keys.length,
              itemBuilder: (context, index) {
                final instructorName = instructorsData.keys.elementAt(index);
                final courses = instructorsData[instructorName]!;

                return ExpansionTile(
                  title: Text(instructorName),
                  children: courses
                      .map((courseData) => ListTile(
                            title: Text(courseData.title!),
                            onTap: () {
                              context.go(
                                  'student-course-detail/${courseData.courseId}');
                            },
                          ))
                      .toList(),
                );
              },
            );
          } else {
            return const Center(child: Text('No instructors available.'));
          }
        },
      ),
    );
  }
}
