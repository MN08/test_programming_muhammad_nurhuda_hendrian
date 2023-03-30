import 'package:go_router/go_router.dart';
import 'package:test_programming_muhammad_nurhuda_hendrian/page/update_student.dart';
import '../page/add_student.dart';
import '../page/error_page.dart';
import '../page/home_page.dart';

class AppRoute {
  static const home = '/';
  static const addStudent = '/add-student';
  static const updateStudent = '/update-student';
  static const detailStudent = '/detail-student';

  static GoRouter routerConfig = GoRouter(
    errorBuilder: (context, state) => ErrorPage(
      title: "Somthing Wrong",
      description: state.error.toString(),
    ),
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: addStudent,
        builder: (context, state) => const AddStudent(),
      ),
      GoRoute(
        path: updateStudent,
        builder: (context, state) => const UpdateStudent(),
      ),
    ],
  );
}
