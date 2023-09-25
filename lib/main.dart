import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trident_interview/database/database.dart';
import 'package:trident_interview/navigation.dart';
import 'package:trident_interview/repository/app_repository.dart';
import 'package:trident_interview/repository/user/user_repository.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<AppDatabase>(
          create: (context) => AppDatabase(NativeDatabase.memory()),
          dispose: (context, db) => db.close(),
        ),
        ProxyProvider<AppDatabase, AppRepository>(
          update: (context, db, _) => AppRepository(db: db),
        ),
        ProxyProvider<AppDatabase, UserRepository>(
          update: (context, db, _) => UserRepository(db: db),
        ),
      ],
      child: TridentApp(),
    ),
  );
}

class TridentApp extends StatelessWidget {
  TridentApp({super.key});

  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Trident App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      scaffoldMessengerKey: _scaffoldMessengerKey,
    );
  }
}
