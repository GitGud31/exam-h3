import 'dart:async';

import 'package:examen_h3_todo/api/swagger.swagger.dart';
import 'package:examen_h3_todo/controllers/swagger_controller.dart';
import 'package:examen_h3_todo/logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final asyncProfileCrudP =
    AsyncNotifierProvider<ProfileCrudNotifier, void>(ProfileCrudNotifier.new);

class ProfileCrudNotifier extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  void profilePost(ProfileDto profile) async {
    try {
      state = const AsyncLoading();

      state = await AsyncValue.guard<void>(() async {
        final response = await ref.read(swaggerP).profilesPost(body: profile);

        if (response.statusCode == 200) {
          L.debug("profile post", response);
        } else {
          state = AsyncValue.error(
            "Code (${response.statusCode}) Message: ${response.error as String}",
            StackTrace.current,
          );
          L.debug("profile post stackTrace", StackTrace.current);
        }

        return Future.delayed(Duration.zero);
      });
    } catch (e) {
      state = AsyncValue.error(
        "Exception Message: ${e as String}",
        StackTrace.current,
      );
    }
  }
}
