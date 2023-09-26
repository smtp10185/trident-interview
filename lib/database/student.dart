part of 'database.dart';

@DataClassName('Student')
class Students extends Table {
  IntColumn get studentId => integer().autoIncrement()();
  TextColumn get username => text().withLength(min: 4, max: 50)();
  TextColumn get password => text()();
  TextColumn get name => text().withLength(min: 1, max: 50)();
}
