import 'dart:async';
import 'dart:math';

import 'package:drift/drift.dart';
import 'package:trident_interview/database/database.dart';

class AppRepository {
  final AppDatabase db;
  final _random = Random();

  AppRepository({required this.db});

  // 講師查詢名下的課程
  Stream<List<Course>> watchCoursesByInstructorId(int instructorId) {
    return (db.select(db.courses)
          ..where((course) => course.instructorId.equals(instructorId)))
        .watch();
  }

  // 講師增加課程
  Future<int> addCourse(CoursesCompanion course) async {
    return db.into(db.courses).insert(course);
  }

  // 講師隨便加課程
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
    return db.into(db.courses).insert(randomCourseCompanion);
  }

  // 講師更新課程
  Future<bool> updateCourse(Course course) async {
    return db.update(db.courses).replace(course);
  }

  // 講師刪除課程
  Future<int> deleteCourse(Course course) async {
    return db.delete(db.courses).delete(course);
  }

  // 講師查詢某課程的學生
  Stream<List<Student>> watchStudentsOfCourse(int courseId) {
    final query = db.select(db.students).join([
      innerJoin(db.courseRegistrations,
          db.students.id.equalsExp(db.courseRegistrations.studentId))
    ])
      ..where(db.courseRegistrations.courseId.equals(courseId));

    return query.map((row) => row.readTable(db.students)).watch();
  }

  // 學生查詢所有課程
  Stream<List<Course>> watchAllCourses() {
    return db.select(db.courses).watch();
  }

  // 學生查詢所有講師
  Stream<List<Instructor>> watchAllInstructors() {
    return db.select(db.instructors).watch();
  }

  // 學生選課
  Future<int> enrollCourse(
      CourseRegistrationsCompanion courseRegistration) async {
    return db.into(db.courseRegistrations).insert(courseRegistration);
  }

  // 學生退選
  Future<int> unenrollCourse(CourseRegistration courseRegistration) async {
    return db.delete(db.courseRegistrations).delete(courseRegistration);
  }
}
