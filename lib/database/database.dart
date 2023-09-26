import 'dart:async';
import 'dart:math';

import 'package:drift/drift.dart';
import 'package:path/path.dart';

part 'database.g.dart';

part 'instructor.dart';
part 'student.dart';
part 'course.dart';
part 'course_registration.dart';

@DriftDatabase(
    tables: [Instructors, Students, Courses, CourseRegistrations],
    views: [InstructorWithCoursesView])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;

  Future<Instructor?> getInstructor(String username, String password) {
    return (select(instructors)
          ..where((instructor) =>
              instructor.name.equals(username) &
              instructor.password.equals(password)))
        .getSingleOrNull();
  }

  Future<Student?> getStudent(String username, String password) {
    return (select(students)
          ..where((student) =>
              student.name.equals(username) &
              student.password.equals(password)))
        .getSingleOrNull();
  }

  onCreate() {}
}

class InstructorWithCoursesData {
  final Instructor instructor;
  final List<Course> courses;

  InstructorWithCoursesData({
    required this.instructor,
    required this.courses,
  });
}

abstract class InstructorWithCoursesView extends View {
  Courses get courses;
  Instructors get instructors;

  @override
  Query as() => select([instructors.name, courses.id, courses.title])
          .from(instructors)
          .join([
        leftOuterJoin(courses, courses.instructorId.equalsExp(instructors.id)),
      ]);
}
