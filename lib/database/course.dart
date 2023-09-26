part of 'database.dart';

@DataClassName('Course')
class Courses extends Table {
  IntColumn get courseId => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 100)();
  TextColumn get description => text().nullable()();
  TextColumn get timing =>
      text().withLength(min: 1, max: 100)(); // In the format 0000-2359
  IntColumn get instructorId =>
      integer().references(Instructors, #instructorId)();
}
