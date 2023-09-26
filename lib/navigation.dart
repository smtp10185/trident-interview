// ignore_for_file: constant_pattern_never_matches_value_type

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:trident_interview/pages/student/course_detail_page.dart';
import 'package:trident_interview/pages/instructor/instructor_dashboard_page.dart';
import 'package:trident_interview/pages/login_page.dart';
import 'package:trident_interview/pages/student/course_list_page.dart';
import 'package:trident_interview/pages/student/instructor_list_page.dart';
import 'package:trident_interview/pages/student/student_dashboard_page.dart';
import 'package:trident_interview/repository/user/user.dart';
import 'package:trident_interview/repository/user/user_repository.dart';

final GoRouter router = GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            final userRepository =
                Provider.of<UserRepository>(context, listen: false);
            return StreamBuilder<User?>(
              stream: userRepository.user,
              builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
                if (snapshot.hasData) {
                  final user = snapshot.data!;
                  switch (user.type) {
                    case UserType.instructor:
                      return const InstructorDashboardPage();
                    case UserType.student:
                      return const StudentDashboardPage();
                    default:
                      return const LoginPage();
                  }
                } else {
                  return const LoginPage();
                }
              },
            );
          },
          routes: [
            GoRoute(
                path: 'login', builder: (context, state) => const LoginPage()),
            GoRoute(
              path: 'instructor-dashboard',
              builder: (context, state) => const InstructorDashboardPage(),
            ),
            GoRoute(
              path: 'student-dashboard',
              builder: (context, state) => const StudentDashboardPage(),
            ),
            GoRoute(
              path: 'student-course-list',
              builder: (context, state) => const CourseListPage(),
            ),
            GoRoute(
              path: 'student-instructor-list',
              builder: (context, state) => const InstructorListPage(),
            ),
            GoRoute(
              path: 'student-course-detail/:courseId',
              builder: (context, state) {
                final courseId = int.parse(state.pathParameters['courseId']!);
                return CourseDetailPage(courseId: courseId);
              },
            ),
          ]),
    ]);
