import 'dart:async';
import 'dart:math';

import 'package:drift/drift.dart';

part 'database.g.dart';

part 'instructor.dart';
part 'student.dart';
part 'course.dart';
part 'course_registration.dart';

@DriftDatabase(tables: [Instructors, Students, Courses, CourseRegistrations])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);

  final _random = Random();

  @override
  int get schemaVersion => 1;

  Future<int> addRandomCourse(int instructorId) async {
    final randomCourseCompanion = CoursesCompanion(
      title: Value(
          'Random Course ${_random.nextInt(1000)}'), // Generates a title like "Random Course 345"
      description: const Value(
          'This is a randomly generated course.'), // static description for demonstration
      timing: Value(
          '${_random.nextInt(24).toString().padLeft(2, '0')}00-${_random.nextInt(24).toString().padLeft(2, '0')}00'), // Generates a timing like "0500-1400"
      instructorId: Value(instructorId), // This should be provided as argument
    );
    return into(courses).insert(randomCourseCompanion);
  }

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

  // Get the list of students registered for a specific course
  /*
  Future<List<Student>> getStudentsForCourse(Course course) {
    final innerJoin = courseRegistrations.join(
      students,
      predicate: (registration, student) =>
          registration.studentId.equals(student.id),
    );
    final query = innerJoin.where(
        (registration, student) => registration.courseId.equals(course.id));
    return query.map((joined) => joined.readTable(students)).get();
  }*/

  // Create some dummy data
  onCreate() {}
}
