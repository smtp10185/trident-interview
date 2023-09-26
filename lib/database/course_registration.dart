part of 'database.dart';

@DataClassName('CourseRegistration')
class CourseRegistrations extends Table {
  IntColumn get courseRegisId => integer().autoIncrement()();
  IntColumn get courseId => integer().references(Courses, #courseId)();
  IntColumn get studentId => integer().references(Students, #studentId)();
}
