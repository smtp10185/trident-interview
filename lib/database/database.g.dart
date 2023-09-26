// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $InstructorsTable extends Instructors
    with TableInfo<$InstructorsTable, Instructor> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InstructorsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 4, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, username, password, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'instructors';
  @override
  VerificationContext validateIntegrity(Insertable<Instructor> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Instructor map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Instructor(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $InstructorsTable createAlias(String alias) {
    return $InstructorsTable(attachedDatabase, alias);
  }
}

class Instructor extends DataClass implements Insertable<Instructor> {
  final int id;
  final String username;
  final String password;
  final String name;
  const Instructor(
      {required this.id,
      required this.username,
      required this.password,
      required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['username'] = Variable<String>(username);
    map['password'] = Variable<String>(password);
    map['name'] = Variable<String>(name);
    return map;
  }

  InstructorsCompanion toCompanion(bool nullToAbsent) {
    return InstructorsCompanion(
      id: Value(id),
      username: Value(username),
      password: Value(password),
      name: Value(name),
    );
  }

  factory Instructor.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Instructor(
      id: serializer.fromJson<int>(json['id']),
      username: serializer.fromJson<String>(json['username']),
      password: serializer.fromJson<String>(json['password']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'username': serializer.toJson<String>(username),
      'password': serializer.toJson<String>(password),
      'name': serializer.toJson<String>(name),
    };
  }

  Instructor copyWith(
          {int? id, String? username, String? password, String? name}) =>
      Instructor(
        id: id ?? this.id,
        username: username ?? this.username,
        password: password ?? this.password,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('Instructor(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, username, password, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Instructor &&
          other.id == this.id &&
          other.username == this.username &&
          other.password == this.password &&
          other.name == this.name);
}

class InstructorsCompanion extends UpdateCompanion<Instructor> {
  final Value<int> id;
  final Value<String> username;
  final Value<String> password;
  final Value<String> name;
  const InstructorsCompanion({
    this.id = const Value.absent(),
    this.username = const Value.absent(),
    this.password = const Value.absent(),
    this.name = const Value.absent(),
  });
  InstructorsCompanion.insert({
    this.id = const Value.absent(),
    required String username,
    required String password,
    required String name,
  })  : username = Value(username),
        password = Value(password),
        name = Value(name);
  static Insertable<Instructor> custom({
    Expression<int>? id,
    Expression<String>? username,
    Expression<String>? password,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (username != null) 'username': username,
      if (password != null) 'password': password,
      if (name != null) 'name': name,
    });
  }

  InstructorsCompanion copyWith(
      {Value<int>? id,
      Value<String>? username,
      Value<String>? password,
      Value<String>? name}) {
    return InstructorsCompanion(
      id: id ?? this.id,
      username: username ?? this.username,
      password: password ?? this.password,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InstructorsCompanion(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $StudentsTable extends Students with TableInfo<$StudentsTable, Student> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StudentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 4, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, username, password, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'students';
  @override
  VerificationContext validateIntegrity(Insertable<Student> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Student map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Student(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $StudentsTable createAlias(String alias) {
    return $StudentsTable(attachedDatabase, alias);
  }
}

class Student extends DataClass implements Insertable<Student> {
  final int id;
  final String username;
  final String password;
  final String name;
  const Student(
      {required this.id,
      required this.username,
      required this.password,
      required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['username'] = Variable<String>(username);
    map['password'] = Variable<String>(password);
    map['name'] = Variable<String>(name);
    return map;
  }

  StudentsCompanion toCompanion(bool nullToAbsent) {
    return StudentsCompanion(
      id: Value(id),
      username: Value(username),
      password: Value(password),
      name: Value(name),
    );
  }

  factory Student.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Student(
      id: serializer.fromJson<int>(json['id']),
      username: serializer.fromJson<String>(json['username']),
      password: serializer.fromJson<String>(json['password']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'username': serializer.toJson<String>(username),
      'password': serializer.toJson<String>(password),
      'name': serializer.toJson<String>(name),
    };
  }

  Student copyWith(
          {int? id, String? username, String? password, String? name}) =>
      Student(
        id: id ?? this.id,
        username: username ?? this.username,
        password: password ?? this.password,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('Student(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, username, password, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Student &&
          other.id == this.id &&
          other.username == this.username &&
          other.password == this.password &&
          other.name == this.name);
}

class StudentsCompanion extends UpdateCompanion<Student> {
  final Value<int> id;
  final Value<String> username;
  final Value<String> password;
  final Value<String> name;
  const StudentsCompanion({
    this.id = const Value.absent(),
    this.username = const Value.absent(),
    this.password = const Value.absent(),
    this.name = const Value.absent(),
  });
  StudentsCompanion.insert({
    this.id = const Value.absent(),
    required String username,
    required String password,
    required String name,
  })  : username = Value(username),
        password = Value(password),
        name = Value(name);
  static Insertable<Student> custom({
    Expression<int>? id,
    Expression<String>? username,
    Expression<String>? password,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (username != null) 'username': username,
      if (password != null) 'password': password,
      if (name != null) 'name': name,
    });
  }

  StudentsCompanion copyWith(
      {Value<int>? id,
      Value<String>? username,
      Value<String>? password,
      Value<String>? name}) {
    return StudentsCompanion(
      id: id ?? this.id,
      username: username ?? this.username,
      password: password ?? this.password,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StudentsCompanion(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $CoursesTable extends Courses with TableInfo<$CoursesTable, Course> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CoursesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _timingMeta = const VerificationMeta('timing');
  @override
  late final GeneratedColumn<String> timing = GeneratedColumn<String>(
      'timing', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _instructorIdMeta =
      const VerificationMeta('instructorId');
  @override
  late final GeneratedColumn<int> instructorId = GeneratedColumn<int>(
      'instructor_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES instructors (id)'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, description, timing, instructorId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'courses';
  @override
  VerificationContext validateIntegrity(Insertable<Course> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('timing')) {
      context.handle(_timingMeta,
          timing.isAcceptableOrUnknown(data['timing']!, _timingMeta));
    } else if (isInserting) {
      context.missing(_timingMeta);
    }
    if (data.containsKey('instructor_id')) {
      context.handle(
          _instructorIdMeta,
          instructorId.isAcceptableOrUnknown(
              data['instructor_id']!, _instructorIdMeta));
    } else if (isInserting) {
      context.missing(_instructorIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Course map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Course(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      timing: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}timing'])!,
      instructorId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}instructor_id'])!,
    );
  }

  @override
  $CoursesTable createAlias(String alias) {
    return $CoursesTable(attachedDatabase, alias);
  }
}

class Course extends DataClass implements Insertable<Course> {
  final int id;
  final String title;
  final String? description;
  final String timing;
  final int instructorId;
  const Course(
      {required this.id,
      required this.title,
      this.description,
      required this.timing,
      required this.instructorId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['timing'] = Variable<String>(timing);
    map['instructor_id'] = Variable<int>(instructorId);
    return map;
  }

  CoursesCompanion toCompanion(bool nullToAbsent) {
    return CoursesCompanion(
      id: Value(id),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      timing: Value(timing),
      instructorId: Value(instructorId),
    );
  }

  factory Course.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Course(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      timing: serializer.fromJson<String>(json['timing']),
      instructorId: serializer.fromJson<int>(json['instructorId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'timing': serializer.toJson<String>(timing),
      'instructorId': serializer.toJson<int>(instructorId),
    };
  }

  Course copyWith(
          {int? id,
          String? title,
          Value<String?> description = const Value.absent(),
          String? timing,
          int? instructorId}) =>
      Course(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description.present ? description.value : this.description,
        timing: timing ?? this.timing,
        instructorId: instructorId ?? this.instructorId,
      );
  @override
  String toString() {
    return (StringBuffer('Course(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('timing: $timing, ')
          ..write('instructorId: $instructorId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, description, timing, instructorId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Course &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.timing == this.timing &&
          other.instructorId == this.instructorId);
}

class CoursesCompanion extends UpdateCompanion<Course> {
  final Value<int> id;
  final Value<String> title;
  final Value<String?> description;
  final Value<String> timing;
  final Value<int> instructorId;
  const CoursesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.timing = const Value.absent(),
    this.instructorId = const Value.absent(),
  });
  CoursesCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.description = const Value.absent(),
    required String timing,
    required int instructorId,
  })  : title = Value(title),
        timing = Value(timing),
        instructorId = Value(instructorId);
  static Insertable<Course> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? timing,
    Expression<int>? instructorId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (timing != null) 'timing': timing,
      if (instructorId != null) 'instructor_id': instructorId,
    });
  }

  CoursesCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String?>? description,
      Value<String>? timing,
      Value<int>? instructorId}) {
    return CoursesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      timing: timing ?? this.timing,
      instructorId: instructorId ?? this.instructorId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (timing.present) {
      map['timing'] = Variable<String>(timing.value);
    }
    if (instructorId.present) {
      map['instructor_id'] = Variable<int>(instructorId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CoursesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('timing: $timing, ')
          ..write('instructorId: $instructorId')
          ..write(')'))
        .toString();
  }
}

class $CourseRegistrationsTable extends CourseRegistrations
    with TableInfo<$CourseRegistrationsTable, CourseRegistration> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CourseRegistrationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _courseIdMeta =
      const VerificationMeta('courseId');
  @override
  late final GeneratedColumn<int> courseId = GeneratedColumn<int>(
      'course_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES courses (id)'));
  static const VerificationMeta _studentIdMeta =
      const VerificationMeta('studentId');
  @override
  late final GeneratedColumn<int> studentId = GeneratedColumn<int>(
      'student_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES students (id)'));
  @override
  List<GeneratedColumn> get $columns => [id, courseId, studentId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'course_registrations';
  @override
  VerificationContext validateIntegrity(Insertable<CourseRegistration> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('course_id')) {
      context.handle(_courseIdMeta,
          courseId.isAcceptableOrUnknown(data['course_id']!, _courseIdMeta));
    } else if (isInserting) {
      context.missing(_courseIdMeta);
    }
    if (data.containsKey('student_id')) {
      context.handle(_studentIdMeta,
          studentId.isAcceptableOrUnknown(data['student_id']!, _studentIdMeta));
    } else if (isInserting) {
      context.missing(_studentIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CourseRegistration map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CourseRegistration(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      courseId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}course_id'])!,
      studentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}student_id'])!,
    );
  }

  @override
  $CourseRegistrationsTable createAlias(String alias) {
    return $CourseRegistrationsTable(attachedDatabase, alias);
  }
}

class CourseRegistration extends DataClass
    implements Insertable<CourseRegistration> {
  final int id;
  final int courseId;
  final int studentId;
  const CourseRegistration(
      {required this.id, required this.courseId, required this.studentId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['course_id'] = Variable<int>(courseId);
    map['student_id'] = Variable<int>(studentId);
    return map;
  }

  CourseRegistrationsCompanion toCompanion(bool nullToAbsent) {
    return CourseRegistrationsCompanion(
      id: Value(id),
      courseId: Value(courseId),
      studentId: Value(studentId),
    );
  }

  factory CourseRegistration.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CourseRegistration(
      id: serializer.fromJson<int>(json['id']),
      courseId: serializer.fromJson<int>(json['courseId']),
      studentId: serializer.fromJson<int>(json['studentId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'courseId': serializer.toJson<int>(courseId),
      'studentId': serializer.toJson<int>(studentId),
    };
  }

  CourseRegistration copyWith({int? id, int? courseId, int? studentId}) =>
      CourseRegistration(
        id: id ?? this.id,
        courseId: courseId ?? this.courseId,
        studentId: studentId ?? this.studentId,
      );
  @override
  String toString() {
    return (StringBuffer('CourseRegistration(')
          ..write('id: $id, ')
          ..write('courseId: $courseId, ')
          ..write('studentId: $studentId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, courseId, studentId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CourseRegistration &&
          other.id == this.id &&
          other.courseId == this.courseId &&
          other.studentId == this.studentId);
}

class CourseRegistrationsCompanion extends UpdateCompanion<CourseRegistration> {
  final Value<int> id;
  final Value<int> courseId;
  final Value<int> studentId;
  const CourseRegistrationsCompanion({
    this.id = const Value.absent(),
    this.courseId = const Value.absent(),
    this.studentId = const Value.absent(),
  });
  CourseRegistrationsCompanion.insert({
    this.id = const Value.absent(),
    required int courseId,
    required int studentId,
  })  : courseId = Value(courseId),
        studentId = Value(studentId);
  static Insertable<CourseRegistration> custom({
    Expression<int>? id,
    Expression<int>? courseId,
    Expression<int>? studentId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (courseId != null) 'course_id': courseId,
      if (studentId != null) 'student_id': studentId,
    });
  }

  CourseRegistrationsCompanion copyWith(
      {Value<int>? id, Value<int>? courseId, Value<int>? studentId}) {
    return CourseRegistrationsCompanion(
      id: id ?? this.id,
      courseId: courseId ?? this.courseId,
      studentId: studentId ?? this.studentId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (courseId.present) {
      map['course_id'] = Variable<int>(courseId.value);
    }
    if (studentId.present) {
      map['student_id'] = Variable<int>(studentId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CourseRegistrationsCompanion(')
          ..write('id: $id, ')
          ..write('courseId: $courseId, ')
          ..write('studentId: $studentId')
          ..write(')'))
        .toString();
  }
}

class InstructorWithCoursesViewData extends DataClass {
  final String name;
  final int? id;
  final String? title;
  const InstructorWithCoursesViewData(
      {required this.name, this.id, this.title});
  factory InstructorWithCoursesViewData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InstructorWithCoursesViewData(
      name: serializer.fromJson<String>(json['name']),
      id: serializer.fromJson<int?>(json['id']),
      title: serializer.fromJson<String?>(json['title']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'id': serializer.toJson<int?>(id),
      'title': serializer.toJson<String?>(title),
    };
  }

  InstructorWithCoursesViewData copyWith(
          {String? name,
          Value<int?> id = const Value.absent(),
          Value<String?> title = const Value.absent()}) =>
      InstructorWithCoursesViewData(
        name: name ?? this.name,
        id: id.present ? id.value : this.id,
        title: title.present ? title.value : this.title,
      );
  @override
  String toString() {
    return (StringBuffer('InstructorWithCoursesViewData(')
          ..write('name: $name, ')
          ..write('id: $id, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(name, id, title);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InstructorWithCoursesViewData &&
          other.name == this.name &&
          other.id == this.id &&
          other.title == this.title);
}

class $InstructorWithCoursesViewView extends ViewInfo<
    $InstructorWithCoursesViewView,
    InstructorWithCoursesViewData> implements HasResultSet {
  final String? _alias;
  @override
  final _$AppDatabase attachedDatabase;
  $InstructorWithCoursesViewView(this.attachedDatabase, [this._alias]);
  $CoursesTable get courses => attachedDatabase.courses.createAlias('t0');
  $InstructorsTable get instructors =>
      attachedDatabase.instructors.createAlias('t1');
  @override
  List<GeneratedColumn> get $columns => [name, id, title];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'instructor_with_courses_view';
  @override
  Map<SqlDialect, String>? get createViewStatements => null;
  @override
  $InstructorWithCoursesViewView get asDslTable => this;
  @override
  InstructorWithCoursesViewData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InstructorWithCoursesViewData(
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id']),
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title']),
    );
  }

  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      generatedAs: GeneratedAs(instructors.name, false),
      type: DriftSqlType.string);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, true,
      generatedAs: GeneratedAs(courses.id, false), type: DriftSqlType.int);
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, true,
      generatedAs: GeneratedAs(courses.title, false),
      type: DriftSqlType.string);
  @override
  $InstructorWithCoursesViewView createAlias(String alias) {
    return $InstructorWithCoursesViewView(attachedDatabase, alias);
  }

  @override
  Query? get query =>
      (attachedDatabase.selectOnly(instructors)..addColumns($columns)).join([
        leftOuterJoin(courses, courses.instructorId.equalsExp(instructors.id))
      ]);
  @override
  Set<String> get readTables => const {'courses', 'instructors'};
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $InstructorsTable instructors = $InstructorsTable(this);
  late final $StudentsTable students = $StudentsTable(this);
  late final $CoursesTable courses = $CoursesTable(this);
  late final $CourseRegistrationsTable courseRegistrations =
      $CourseRegistrationsTable(this);
  late final $InstructorWithCoursesViewView instructorWithCoursesView =
      $InstructorWithCoursesViewView(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        instructors,
        students,
        courses,
        courseRegistrations,
        instructorWithCoursesView
      ];
}
