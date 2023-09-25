import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trident_interview/database/database.dart';
import 'package:trident_interview/repository/app_repository.dart';
import 'package:trident_interview/repository/user/user_repository.dart';

class CourseStudentsDialog extends StatelessWidget {
  final int courseId;

  const CourseStudentsDialog({super.key, required this.courseId});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppRepository>(
      builder: (context, appRepository, child) {
        return AlertDialog(
          title: Text('Students for Course ID: $courseId'),
          content: StreamBuilder<List<Student>>(
            stream: appRepository.watchStudentsOfCourse(courseId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Text('No students registered for this course.');
              } else {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final student = snapshot.data![index];
                    return ListTile(
                      title: Text(student.name),
                      // Add more details about the student if needed
                    );
                  },
                );
              }
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

class InstructorCourseList extends StatefulWidget {
  final Function(Course course) onCourseTap;

  const InstructorCourseList({Key? key, required this.onCourseTap})
      : super(key: key);

  @override
  InstructorCourseListState createState() => InstructorCourseListState();
}

class InstructorCourseListState extends State<InstructorCourseList> {
  @override
  Widget build(BuildContext context) {
    final courses = Provider.of<List<Course>>(context);

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: courses.length,
            itemBuilder: (context, index) {
              final course = courses[index];
              return ListTile(
                title: Text(course.title),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(course.description ?? 'No Description'),
                    Text(course.timing),
                  ],
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    Provider.of<AppRepository>(context, listen: false)
                        .deleteCourse(courses[index]);
                    setState(() {
                      courses.removeAt(index);
                    });
                  },
                ),
                onTap: () => widget.onCourseTap(course),
              );
            },
          ),
        ),
      ],
    );
  }
}

class InstructorDashboardPage extends StatelessWidget {
  const InstructorDashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appRepository = Provider.of<AppRepository>(context);
    final userRepository = Provider.of<UserRepository>(context);

    return StreamProvider<List<Course>>(
      initialData: [],
      create: (_) => appRepository
          .watchCoursesByInstructorId(userRepository.currentUser!.id),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Instructor Dashboard'),
          centerTitle: true,
        ),
        body: Consumer<List<Course>>(
          builder: (context, courses, _) {
            if (courses.isEmpty) {
              return const Center(child: Text('No courses available.'));
            }

            return InstructorCourseList(
              onCourseTap: (course) {
                showDialog(
                  context: context,
                  builder: (context) =>
                      CourseStudentsDialog(courseId: course.id),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            appRepository.addRandomCourse(userRepository.currentUser!.id);
          },
          tooltip: 'Add New Course',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
