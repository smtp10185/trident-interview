import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:trident_interview/database/database.dart';
import 'package:trident_interview/repository/app_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase db;
  late AppRepository repository;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    repository = AppRepository(db: db);
  });

  test('AddRandomCourse should add a random course', () async {
    final initialCoursesCount = (await db.select(db.courses).get()).length;
    await repository.addRandomCourse(1);
    final coursesAfterAddition = await db.select(db.courses).get();
    expect(coursesAfterAddition.length, initialCoursesCount + 1);
  });

  test('DeleteCourse should remove the course', () async {
    const course = CoursesCompanion(
      title: Value('Test Course'),
      description: Value('Description'),
      timing: Value('1200-1300'),
      instructorId: Value(1),
    );
    await db.into(db.courses).insert(course);

    final addedCourse = await db.select(db.courses).getSingle();

    await repository.deleteCourse(addedCourse);
    final coursesAfterDeletion = await db.select(db.courses).get();

    expect(coursesAfterDeletion, isEmpty);
  });

  tearDown(() async {
    await db.close();
  });
}
