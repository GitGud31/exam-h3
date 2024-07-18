import 'package:auto_route/auto_route.dart';
import 'package:examen_h3_todo/routing/guards/authentication_guard.dart';
import 'package:examen_h3_todo/routing/routes.dart';
import 'package:examen_h3_todo/screens/add_profile_screen.dart';
import 'package:examen_h3_todo/screens/edit_task_screen.dart';
import 'package:examen_h3_todo/screens/forgot_password_screen.dart';
import 'package:examen_h3_todo/screens/home_screen.dart';
import 'package:examen_h3_todo/screens/load_data_screen.dart';
import 'package:examen_h3_todo/screens/login_screen.dart';
import 'package:examen_h3_todo/screens/select_project_screen.dart';
import 'package:examen_h3_todo/screens/signup_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'router.gr.dart';

final routerP = Provider<AppRouter>((ref) => AppRouter(ref));

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  final Ref ref;

  AppRouter(this.ref);

  @override
  List<AutoRoute> get routes => [
        //loadData
        AutoRoute(
          path: Routes.loadData,
          page: LoadDataRoute.page,
          guards: [
            AuthGuard(ref),
          ],
        ),

        //sign up task
        AutoRoute(
          path: Routes.signup,
          page: SignupRoute.page,
        ),

        //login task
        AutoRoute(
          path: Routes.login,
          page: LoginRoute.page,
        ),

        //select project
        AutoRoute(
          initial: true,
          path: Routes.selectProject,
          page: SelectProjectRoute.page,
          guards: [
            AuthGuard(ref),
          ],
        ),

        //home
        AutoRoute(
          path: Routes.home,
          page: HomeRoute.page,
          guards: [
            AuthGuard(ref),
          ],
        ),

        //edit task
        AutoRoute(
          path: Routes.editTask,
          page: EditTaskRoute.page,
          guards: [
            AuthGuard(ref),
          ],
        ),

        //forgot password
        AutoRoute(
          path: Routes.forgotPassword,
          page: ForgotPasswordRoute.page,
        ),
      ];
}
