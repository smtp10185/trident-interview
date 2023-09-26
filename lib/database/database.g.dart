// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $InstructorsTable extends Instructors
    with TableInfo<$InstructorsTable, Instructor> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InstructorsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _instructorIdMeta =
      const VerificationMeta('instructorId');
  @override
  late final GeneratedColumn<int> instructorId = GeneratedColumn<int>(
      'instructor_id', aliasedName, false,
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
  List<GeneratedColumn> get $columns =>
      [instructorId, username, password, name];
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
    if (data.containsKey('instructor_id')) {
      context.handle(
          _instructorIdMeta,
          instructorId.isAcceptableOrUnknown(
              data['instructor_id']!, _instructorIdMeta));
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
  Set<GeneratedColumn> get $primaryKey => {instructorId};
  @override
  Instructor map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Instructor(
      instructorId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}instructor_id'])!,
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
  final int instructorId;
  final String username;
  final String password;
  final String name;
  const Instructor(
      {required this.instructorId,
      required this.username,
      required this.password,
      required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['instructor_id'] = Variable<int>(instructorId);
    map['username'] = Variable<String>(username);
    map['password'] = Variable<String>(password);
    map['name'] = Variable<String>(name);
    return map;
  }

  InstructorsCompanion toCompanion(bool nullToAbsent) {
    return InstructorsCompanion(
      instructorId: Value(instructorId),
      username: Value(username),
      password: Value(password),
      name: Value(name),
    );
  }

  factory Instructor.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Instructor(
      instructorId: serializer.fromJson<int>(json['instructorId']),
      username: serializer.fromJson<String>(json['username']),
      password: serializer.fromJson<String>(json['password']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'instructorId': serializer.toJson<int>(instructorId),
      'username': serializer.toJson<String>(username),
      'password': serializer.toJson<String>(password),
      'name': serializer.toJson<String>(name),
    };
  }

  Instructor copyWith(
          {int? instructorId,
          String? username,
          String? password,
          String? name}) =>
      Instructor(
        instructorId: instructorId ?? this.instructorId,
        username: username ?? this.username,
        password: password ?? this.password,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('Instructor(')
          ..write('instructorId: $instructorId, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(instructorId, username, password, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Instructor &&
          other.instructorId == this.instructorId &&
          other.username == this.username &&
          other.password == this.password &&
          other.name == this.name);
}

class InstructorsCompanion extends UpdateCompanion<Instructor> {
  final Value<int> instructorId;
  final Value<String> username;
  final Value<String> password;
  final Value<String> name;
  const InstructorsCompanion({
    this.instructorId = const Value.absent(),
    this.username = const Value.absent(),
    this.password = const Value.absent(),
    this.name = const Value.absent(),
  });
  InstructorsCompanion.insert({
    this.instructorId = const Value.absent(),
    required String username,
    required String password,
    required String name,
  })  : username = Value(username),
        password = Value(password),
        name = Value(name);
  static Insertable<Instructor> custom({
    Expression<int>? instructorId,
    Expression<String>? username,
    Expression<String>? password,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (instructorId != null) 'instructor_id': instructorId,
      if (username != null) 'username': username,
      if (password != null) 'password': password,
      if (name != null) 'name': name,
    });
  }

  InstructorsCompanion copyWith(
      {Value<int>? instructorId,
      Value<String>? username,
      Value<String>? password,
      Value<String>? name}) {
    return InstructorsCompanion(
      instructorId: instructorId ?? this.instructorId,
      username: username ?? this.username,
      password: password ?? this.password,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (instructorId.present) {
      map['instructor_id'] = Variable<int>(instructorId.value);
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
          ..write('instructorId: $instructorId, ')
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
  static const VerificationMeta _studentIdMeta =
      const VerificationMeta('studentId');
  @override
  late final GeneratedColumn<int> studentId = GeneratedColumn<int>(
      'student_id', aliasedName, false,
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
  List<GeneratedColumn> get $columns => [studentId, username, password, name];
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
    if (data.containsKey('student_id')) {
      context.handle(_studentIdMeta,
          studentId.isAcceptableOrUnknown(data['student_id']!, _studentIdMeta));
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
  Set<GeneratedColumn> get $primaryKey => {studentId};
  @override
  Student map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Student(
      studentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}student_id'])!,
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
  final int studentId;
  final String username;
  final String password;
  final String name;
  const Student(
      {required this.studentId,
      required this.username,
      required this.password,
      required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['student_id'] = Variable<int>(studentId);
    map['username'] = Variable<String>(username);
    map['password'] = Variable<String>(password);
    map['name'] = Variable<String>(name);
    return map;
  }

  StudentsCompanion toCompanion(bool nullToAbsent) {
    return StudentsCompanion(
      studentId: Value(studentId),
      username: Value(username),
      password: Value(password),
      name: Value(name),
    );
  }

  factory Student.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Student(
      studentId: serializer.fromJson<int>(json['studentId']),
      username: serializer.fromJson<String>(json['username']),
      password: serializer.fromJson<String>(json['password']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'studentId': serializer.toJson<int>(studentId),
      'username': serializer.toJson<String>(username),
      'password': serializer.toJson<String>(password),
      'name': serializer.toJson<String>(name),
    };
  }

  Student copyWith(
          {int? studentId, String? username, String? password, String? name}) =>
      Student(
        studentId: studentId ?? this.studentId,
        username: username ?? this.username,
        password: password ?? this.password,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('Student(')
          ..write('studentId: $studentId, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(studentId, username, password, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Student &&
          other.studentId == this.studentId &&
          other.username == this.username &&
          other.password == this.password &&
          other.name == this.name);
}

class StudentsCompanion extends UpdateCompanion<Student> {
  final Value<int> studentId;
  final Value<String> username;
  final Value<String> password;
  final Value<String> name;
  const StudentsCompanion({
    this.studentId = const Value.absent(),
    this.username = const Value.absent(),
    this.password = const Value.absent(),
    this.name = const Value.absent(),
  });
  StudentsCompanion.insert({
    this.studentId = const Value.absent(),
    required String username,
    required String password,
    required String name,
  })  : username = Value(username),
        password = Value(password),
        name = Value(name);
  static Insertable<Student> custom({
    Expression<int>? studentId,
    Expression<String>? username,
    Expression<String>? password,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (studentId != null) 'student_id': studentId,
      if (username != null) 'username': username,
      if (password != null) 'password': password,
      if (name != null) 'name': name,
    });
  }

  StudentsCompanion copyWith(
      {Value<int>? studentId,
      Value<String>? username,
      Value<String>? password,
      Value<String>? name}) {
    return StudentsCompanion(
      studentId: studentId ?? this.studentId,
      username: username ?? this.username,
      password: password ?? this.password,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (studentId.present) {
      map['student_id'] = Variable<int>(studentId.value);
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
          ..write('studentId: $studentId, ')
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
  static const VerificationMeta _courseIdMeta =
      const VerificationMeta('courseId');
  @override
  late final GeneratedColumn<int> courseId = GeneratedColumn<int>(
      'course_id', aliasedName, false,
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
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES instructors (instructor_id)'));
  @override
  List<GeneratedColumn> get $columns =>
      [courseId, title, description, timing, instructorId];
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
    if (data.containsKey('course_id')) {
      context.handle(_courseIdMeta,
          courseId.isAcceptableOrUnknown(data['course_id']!, _courseIdMeta));
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
  Set<GeneratedColumn> get $primaryKey => {courseId};
  @override
  Course map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Course(
      courseId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}course_id'])!,
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
  final int courseId;
  final String title;
  final String? description;
  final String timing;
  final int instructorId;
  const Course(
      {required this.courseId,
      required this.title,
      this.description,
      required this.timing,
      required this.instructorId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['course_id'] = Variable<int>(courseId);
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
      courseId: Value(courseId),
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
      courseId: serializer.fromJson<int>(json['courseId']),
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
      'courseId': serializer.toJson<int>(courseId),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'timing': serializer.toJson<String>(timing),
      'instructorId': serializer.toJson<int>(instructorId),
    };
  }

  Course copyWith(
          {int? courseId,
          String? title,
          Value<String?> description = const Value.absent(),
          String? timing,
          int? instructorId}) =>
      Course(
        courseId: courseId ?? this.courseId,
        title: title ?? this.title,
        description: description.present ? description.value : this.description,
        timing: timing ?? this.timing,
        instructorId: instructorId ?? this.instructorId,
      );
  @override
  String toString() {
    return (StringBuffer('Course(')
          ..write('courseId: $courseId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('timing: $timing, ')
          ..write('instructorId: $instructorId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(courseId, title, description, timing, instructorId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Course &&
          other.courseId == this.courseId &&
          other.title == this.title &&
          other.description == this.description &&
          other.timing == this.timing &&
          other.instructorId == this.instructorId);
}

class CoursesCompanion extends UpdateCompanion<Course> {
  final Value<int> courseId;
  final Value<String> title;
  final Value<String?> description;
  final Value<String> timing;
  final Value<int> instructorId;
  const CoursesCompanion({
    this.courseId = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.timing = const Value.absent(),
    this.instructorId = const Value.absent(),
  });
  CoursesCompanion.insert({
    this.courseId = const Value.absent(),
    required String title,
    this.description = const Value.absent(),
    required String timing,
    required int instructorId,
  })  : title = Value(title),
        timing = Value(timing),
        instructorId = Value(instructorId);
  static Insertable<Course> custom({
    Expression<int>? courseId,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? timing,
    Expression<int>? instructorId,
  }) {
    return RawValuesInsertable({
      if (courseId != null) 'course_id': courseId,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (timing != null) 'timing': timing,
      if (instructorId != null) 'instructor_id': instructorId,
    });
  }

  CoursesCompanion copyWith(
      {Value<int>? courseId,
      Value<String>? title,
      Value<String?>? description,
      Value<String>? timing,
      Value<int>? instructorId}) {
    return CoursesCompanion(
      courseId: courseId ?? this.courseId,
      title: title ?? this.title,
      description: description ?? this.description,
      timing: timing ?? this.timing,
      instructorId: instructorId ?? this.instructorId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (courseId.present) {
      map['course_id'] = Variable<int>(courseId.value);
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
          ..write('courseId: $courseId, ')
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
  static const VerificationMeta _courseRegisIdMeta =
      const VerificationMeta('courseRegisId');
  @override
  late final GeneratedColumn<int> courseRegisId = GeneratedColumn<int>(
      'course_regis_id', aliasedName, false,
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
          GeneratedColumn.constraintIsAlways('REFERENCES courses (course_id)'));
  static const VerificationMeta _studentIdMeta =
      const VerificationMeta('studentId');
  @override
  late final GeneratedColumn<int> studentId = GeneratedColumn<int>(
      'student_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES students (student_id)'));
  @override
  List<GeneratedColumn> get $columns => [courseRegisId, courseId, studentId];
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
    if (data.containsKey('course_regis_id')) {
      context.handle(
          _courseRegisIdMeta,
          courseRegisId.isAcceptableOrUnknown(
              data['course_regis_id']!, _courseRegisIdMeta));
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
  Set<GeneratedColumn> get $primaryKey => {courseRegisId};
  @override
  CourseRegistration map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CourseRegistration(
      courseRegisId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}course_regis_id'])!,
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
  final int courseRegisId;
  final int courseId;
  final int studentId;
  const CourseRegistration(
      {required this.courseRegisId,
      required this.courseId,
      required this.studentId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['course_regis_id'] = Variable<int>(courseRegisId);
    map['course_id'] = Variable<int>(courseId);
    map['student_id'] = Variable<int>(studentId);
    return map;
  }

  CourseRegistrationsCompanion toCompanion(bool nullToAbsent) {
    return CourseRegistrationsCompanion(
      courseRegisId: Value(courseRegisId),
      courseId: Value(courseId),
      studentId: Value(studentId),
    );
  }

  factory CourseRegistration.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CourseRegistration(
      courseRegisId: serializer.fromJson<int>(json['courseRegisId']),
      courseId: serializer.fromJson<int>(json['courseId']),
      studentId: serializer.fromJson<int>(json['studentId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'courseRegisId': serializer.toJson<int>(courseRegisId),
      'courseId': serializer.toJson<int>(courseId),
      'studentId': serializer.toJson<int>(studentId),
    };
  }

  CourseRegistration copyWith(
          {int? courseRegisId, int? courseId, int? studentId}) =>
      CourseRegistration(
        courseRegisId: courseRegisId ?? this.courseRegisId,
        courseId: courseId ?? this.courseId,
        studentId: studentId ?? this.studentId,
      );
  @override
  String toString() {
    return (StringBuffer('CourseRegistration(')
          ..write('courseRegisId: $courseRegisId, ')
          ..write('courseId: $courseId, ')
          ..write('studentId: $studentId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(courseRegisId, courseId, studentId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CourseRegistration &&
          other.courseRegisId == this.courseRegisId &&
          other.courseId == this.courseId &&
          other.studentId == this.studentId);
}

class CourseRegistrationsCompanion extends UpdateCompanion<CourseRegistration> {
  final Value<int> courseRegisId;
  final Value<int> courseId;
  final Value<int> studentId;
  const CourseRegistrationsCompanion({
    this.courseRegisId = const Value.absent(),
    this.courseId = const Value.absent(),
    this.studentId = const Value.absent(),
  });
  CourseRegistrationsCompanion.insert({
    this.courseRegisId = const Value.absent(),
    required int courseId,
    required int studentId,
  })  : courseId = Value(courseId),
        studentId = Value(studentId);
  static Insertable<CourseRegistration> custom({
    Expression<int>? courseRegisId,
    Expression<int>? courseId,
    Expression<int>? studentId,
  }) {
    return RawValuesInsertable({
      if (courseRegisId != null) 'course_regis_id': courseRegisId,
      if (courseId != null) 'course_id': courseId,
      if (studentId != null) 'student_id': studentId,
    });
  }

  CourseRegistrationsCompanion copyWith(
      {Value<int>? courseRegisId,
      Value<int>? courseId,
      Value<int>? studentId}) {
    return CourseRegistrationsCompanion(
      courseRegisId: courseRegisId ?? this.courseRegisId,
      courseId: courseId ?? this.courseId,
      studentId: studentId ?? this.studentId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (courseRegisId.present) {
      map['course_regis_id'] = Variable<int>(courseRegisId.value);
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
          ..write('courseRegisId: $courseRegisId, ')
          ..write('courseId: $courseId, ')
          ..write('studentId: $studentId')
          ..write(')'))
        .toString();
  }
}

class InstructorWithCoursesViewData extends DataClass {
  final int instructorId;
  final String name;
  final int? courseId;
  final String? title;
  const InstructorWithCoursesViewData(
      {required this.instructorId,
      required this.name,
      this.courseId,
      this.title});
  factory InstructorWithCoursesViewData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InstructorWithCoursesViewData(
      instructorId: serializer.fromJson<int>(json['instructorId']),
      name: serializer.fromJson<String>(json['name']),
      courseId: serializer.fromJson<int?>(json['courseId']),
      title: serializer.fromJson<String?>(json['title']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'instructorId': serializer.toJson<int>(instructorId),
      'name': serializer.toJson<String>(name),
      'courseId': serializer.toJson<int?>(courseId),
      'title': serializer.toJson<String?>(title),
    };
  }

  InstructorWithCoursesViewData copyWith(
          {int? instructorId,
          String? name,
          Value<int?> courseId = const Value.absent(),
          Value<String?> title = const Value.absent()}) =>
      InstructorWithCoursesViewData(
        instructorId: instructorId ?? this.instructorId,
        name: name ?? this.name,
        courseId: courseId.present ? courseId.value : this.courseId,
        title: title.present ? title.value : this.title,
      );
  @override
  String toString() {
    return (StringBuffer('InstructorWithCoursesViewData(')
          ..write('instructorId: $instructorId, ')
          ..write('name: $name, ')
          ..write('courseId: $courseId, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(instructorId, name, courseId, title);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InstructorWithCoursesViewData &&
          other.instructorId == this.instructorId &&
          other.name == this.name &&
          other.courseId == this.courseId &&
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
  List<GeneratedColumn> get $columns => [instructorId, name, courseId, title];
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
      instructorId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}instructor_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      courseId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}course_id']),
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title']),
    );
  }

  late final GeneratedColumn<int> instructorId = GeneratedColumn<int>(
      'instructor_id', aliasedName, false,
      generatedAs: GeneratedAs(instructors.instructorId, false),
      type: DriftSqlType.int);
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      generatedAs: GeneratedAs(instructors.name, false),
      type: DriftSqlType.string);
  late final GeneratedColumn<int> courseId = GeneratedColumn<int>(
      'course_id', aliasedName, true,
      generatedAs: GeneratedAs(courses.courseId, false),
      type: DriftSqlType.int);
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
        leftOuterJoin(
            courses, courses.instructorId.equalsExp(instructors.instructorId))
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
