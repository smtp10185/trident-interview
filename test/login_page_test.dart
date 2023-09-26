import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:trident_interview/database/database.dart';
import 'package:trident_interview/pages/login_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trident_interview/repository/user/user.dart';
import 'package:trident_interview/repository/user/user_repository.dart';

// Widget測試一個
void main() {
  late MockUserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
  });

  testWidgets('Login page should function correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      Provider<UserRepository>.value(
        value: mockUserRepository,
        child: const MaterialApp(home: LoginPage()), // Wrap with MaterialApp
      ),
    );

    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.byType(ElevatedButton), findsOneWidget);

    await tester.enterText(
        find.widgetWithText(TextField, 'Username'), 'testuser');
    await tester.enterText(
        find.widgetWithText(TextField, 'Password'), 'password123');

    await tester.tap(find.byType(Radio).first);
    await tester.pump();

    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    verify(mockUserRepository.loginAsDummyInsturctor('0', '0')).called(1);
  });
}

class MockUserRepository extends Mock implements UserRepository {
  @override
  // TODO: implement currentUser
  User? get currentUser => throw UnimplementedError();

  @override
  // TODO: implement db
  AppDatabase get db => throw UnimplementedError();

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  Future<void> loginAsDummyInsturctor(String username, String password) {
    // TODO: implement loginAsDummyInsturctor
    throw UnimplementedError();
  }

  @override
  Future<void> loginAsDummyStudent(String username, String password) {
    // TODO: implement loginAsDummyStudent
    throw UnimplementedError();
  }

  @override
  Future<void> loginAsInstructor(String username, String password) {
    // TODO: implement loginAsInstructor
    throw UnimplementedError();
  }

  @override
  Future<void> loginAsStudent(String username, String password) {
    // TODO: implement loginAsStudent
    throw UnimplementedError();
  }

  @override
  void logout() {
    // TODO: implement logout
  }

  @override
  // TODO: implement user
  Stream<User?> get user => throw UnimplementedError();
}
