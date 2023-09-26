import 'package:trident_interview/database/database.dart';
import 'package:trident_interview/repository/user/user.dart';
import 'dart:async';

class UserRepository {
  final AppDatabase db;
  final _userController = StreamController<User?>.broadcast();
  User? _currentUser;

  UserRepository({required this.db});

  Stream<User?> get user => _userController.stream;

  User? get currentUser => _currentUser;

  Future<void> loginAsInstructor(String username, String password) async {
    final instructor = await db.getInstructor(username, password);
    if (instructor != null) {
      _currentUser = User(
          id: instructor.instructorId,
          name: instructor.name,
          type: UserType.instructor);
      _userController.add(_currentUser);
    } else {
      _currentUser = null;
      _userController.add(null);
    }
  }

  Future<void> loginAsStudent(String username, String password) async {
    final student = await db.getStudent(username, password);
    if (student != null) {
      _currentUser = User(
          id: student.studentId, name: student.name, type: UserType.student);
      _userController.add(_currentUser);
    } else {
      _currentUser = null;
      _userController.add(null);
    }
  }

  Future<void> loginAsDummyInsturctor(String username, String password) async {
    _currentUser =
        User(id: 0, name: "Dummy Instructor", type: UserType.instructor);
    _userController.add(_currentUser);
  }

  Future<void> loginAsDummyStudent(String username, String password) async {
    _currentUser = User(id: 0, name: "Dummy Student", type: UserType.student);
    _userController.add(_currentUser);
  }

  void logout() {
    _currentUser = null;
    _userController.add(null);
  }

  void dispose() {
    _userController.close();
  }
}
