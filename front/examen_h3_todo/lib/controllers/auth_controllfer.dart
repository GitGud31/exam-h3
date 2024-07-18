import 'package:examen_h3_todo/controllers/profile_controller.dart';
import 'package:examen_h3_todo/controllers/project_controller.dart';
import 'package:examen_h3_todo/controllers/task_controller.dart';
import 'package:examen_h3_todo/models/user_token.dart';
import 'package:examen_h3_todo/routing/router.dart';
import 'package:examen_h3_todo/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authNotifierP =
    ChangeNotifierProvider<AuthNotifier>((ref) => AuthNotifier(ref, null));

class AuthNotifier extends ChangeNotifier {
  final Ref ref;
  UserToken? _userToken;

  AuthNotifier(this.ref, this._userToken);

  UserToken? get userToken => _userToken;

  set updateUserToken(UserToken? userToken) {
    _userToken = userToken;
    
    notifyListeners();
  }

  void logout() {
    _userToken = null;

    ref.invalidate(currentProjectP);
    ref.invalidate(currentProfileP);
    ref.invalidate(currentTaskP);

    ref.invalidate(profilesListP);
    ref.invalidate(projectsListP);
    ref.invalidate(tasksListP);

    ref.invalidate(asyncProfileCrudP);
    ref.invalidate(asyncProjectCrudP);
    ref.invalidate(asyncTaskCrudP);

    ref.read(routerP).replaceNamed(Routes.login);
    
    notifyListeners();
  }
}
