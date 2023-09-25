enum UserType { instructor, student }

class User {
  final int id;
  final String name;
  final UserType type;

  User({required this.id, required this.name, required this.type});
}
