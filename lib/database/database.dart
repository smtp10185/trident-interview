import 'dart:async';

import 'package:drift/drift.dart';

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

// 通過View的方法 得到多條導師記錄和課程記錄
// 其中LeftOuterJoin導師會有重複
// 在Repository會在處理成正確的model
abstract class InstructorWithCoursesView extends View {
  Courses get courses;
  Instructors get instructors;

  @override
  Query as() => select([
        instructors.instructorId,
        instructors.name,
        courses.courseId,
        courses.title
      ]).from(instructors).join([
        leftOuterJoin(
            courses, courses.instructorId.equalsExp(instructors.instructorId)),
      ]);
}
