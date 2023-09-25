part of 'database.dart';

@DataClassName('CourseRegistration')
class CourseRegistrations extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get courseId => integer().references(Courses, #id)();
  IntColumn get studentId => integer().references(Students, #id)();
}
