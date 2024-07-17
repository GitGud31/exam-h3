import 'package:auto_route/auto_route.dart';
import 'package:examen_h3_todo/routing/routes.dart';
import 'package:examen_h3_todo/screens/add_profile_screen.dart';
import 'package:examen_h3_todo/screens/add_task_screen.dart';
import 'package:examen_h3_todo/screens/edit_task_screen.dart';
import 'package:examen_h3_todo/screens/home_screen.dart';
import 'package:examen_h3_todo/screens/load_data_screen.dart';
import 'package:examen_h3_todo/screens/login_screen.dart';
import 'package:examen_h3_todo/screens/signup_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'router.gr.dart';

final routerP = Provider<AppRouter>((_) => AppRouter());

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        //loadData
        AutoRoute(
          //initial: true,
          path: Routes.loadData,
          page: LoadDataRoute.page,
        ),

        //sign up task
        AutoRoute(
          initial: true,
          path: Routes.signup,
          page: SignupRoute.page,
        ),

        //login task
        AutoRoute(
          path: Routes.login,
          page: LoginRoute.page,
        ),

        //add profile
        AutoRoute(
          path: Routes.addProfile,
          page: AddProfileRoute.page,
        ),

        //home
        AutoRoute(
          //initial: true,
          path: Routes.home,
          page: HomeRoute.page,
        ),

        //add task
        AutoRoute(
          path: Routes.addTask,
          page: AddTaskRoute.page,
        ),

        //edit task
        AutoRoute(
          path: Routes.editTask,
          page: EditTaskRoute.page,
        ),
      ];
}
