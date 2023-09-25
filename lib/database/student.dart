part of 'database.dart';

@DataClassName('Student')
class Students extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get username => text().withLength(min: 4, max: 50)();
  TextColumn get password =>
      text()(); // Same here, hashing and salting needed in real-world apps
  TextColumn get name => text().withLength(min: 1, max: 50)();
}
