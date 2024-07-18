import "package:auto_route/auto_route.dart";
import "package:examen_h3_todo/controllers/auth_controllfer.dart";
import "package:examen_h3_todo/routing/router.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class AuthGuard extends AutoRouteGuard {
  final Ref ref;

  AuthGuard(this.ref);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final userToken = ref.read(authNotifierP.notifier).userToken;

    if (userToken != null) return resolver.next(true);

    resolver.redirect(const LoginRoute());
  }
}
