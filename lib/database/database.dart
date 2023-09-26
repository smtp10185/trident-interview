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

  // Instructor
  Future<List<Instructor>> getAllInstructors() => select(instructors).get();
  Stream<List<Instructor>> watchAllInstructors() => select(instructors).watch();
  Future<int> insertInstructor(Insertable<Instructor> instructor) =>
      into(instructors).insert(instructor);
  Future<bool> updateInstructor(Insertable<Instructor> instructor) =>
      update(instructors).replace(instructor);
  Future<int> deleteInstructor(Insertable<Instructor> instructor) =>
      delete(instructors).delete(instructor);

  // Student
  Future<List<Student>> getAllStudents() => select(students).get();
  Stream<List<Student>> watchAllStudents() => select(students).watch();
  Future<int> insertStudent(Insertable<Student> student) =>
      into(students).insert(student);
  Future<bool> updateStudent(Insertable<Student> student) =>
      update(students).replace(student);
  Future<int> deleteStudent(Insertable<Student> student) =>
      delete(students).delete(student);

  // Course
  Future<List<Course>> getAllCourses() => select(courses).get();
  Stream<List<Course>> watchAllCourses() => select(courses).watch();
  Future<int> insertCourse(Insertable<Course> course) =>
      into(courses).insert(course);
  Future<bool> updateCourse(Insertable<Course> course) =>
      update(courses).replace(course);
  Future<int> deleteCourse(Insertable<Course> course) =>
      delete(courses).delete(course);

  // CourseRegistration
  Future<List<CourseRegistration>> getAllCourseRegistrations() =>
      select(courseRegistrations).get();
  Stream<List<CourseRegistration>> watchAllCourseRegistrations() =>
      select(courseRegistrations).watch();
  Future<int> insertCourseRegistration(
          Insertable<CourseRegistration> registration) =>
      into(courseRegistrations).insert(registration);
  Future<bool> updateCourseRegistration(
          Insertable<CourseRegistration> registration) =>
      update(courseRegistrations).replace(registration);
  Future<int> deleteCourseRegistration(
          Insertable<CourseRegistration> registration) =>
      delete(courseRegistrations).delete(registration);

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
