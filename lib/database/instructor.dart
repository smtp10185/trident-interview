part of 'database.dart';

@DataClassName('Instructor')
class Instructors extends Table {
  IntColumn get instructorId => integer().autoIncrement()();
  TextColumn get username => text().withLength(min: 4, max: 50)();
  TextColumn get password => text()();
  TextColumn get name => text().withLength(min: 1, max: 50)();
}
