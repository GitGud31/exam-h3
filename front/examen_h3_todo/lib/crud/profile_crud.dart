import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:examen_h3_todo/api/swagger.swagger.dart';
import 'package:examen_h3_todo/consts/urls.dart';
import 'package:examen_h3_todo/controllers/profile_controller.dart';
import 'package:examen_h3_todo/controllers/swagger_controller.dart';
import 'package:examen_h3_todo/logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileCrudNotifier extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() async {}

  Future<bool> createProfile(ProfileDto profile) async {
    state = const AsyncLoading();
      L.debug("create profile", profile);

    bool result = false;
    state = await AsyncValue.guard<void>(() async {
      final response = await ref.read(swaggerP).profilesPost(body: profile);

      L.debug("create profile", response);


      if (response.statusCode == 200) {
        ref
            .read(currentProfileP.notifier)
            .update((state) => state = response.bodyOrThrow);

        result = true;
        return;
      } else {
        state = AsyncValue.error(
          "Code (${response.statusCode}), Create Profile: ${response.error as String}",
          StackTrace.current,
        );

        result = false;
      }
    });

    return result;
  }

  //TODO; finish implmentation
  void loginProfile(String email, String password) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard<void>(() async {
      final response = await ref
          .read(swaggerP)
          .client
          .post(Uri.parse("${Url.baseUrl}/login"), body: {
        "email": "test@test.com",
        "password": "test",
      });

      if (response.statusCode == 200) {
        /*  ref
            .read(currentProfileP.notifier)
            .update((state) => state = response.bodyOrThrow); */

        L.debug("login profile", response);
      } else {
        state = AsyncValue.error(
          "Code (${response.statusCode}), Login Profile: ${response.error as String}",
          StackTrace.current,
        );
      }

      return Future.delayed(Duration.zero);
    });
  }

  void updateProfile(ProfileDto updatedProfile) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard<void>(() async {
      final response = await ref
          .read(swaggerP)
          .profilesIdPut(id: updatedProfile.id, body: updatedProfile);

      if (response.statusCode == 200) {
        ref
            .read(currentProfileP.notifier)
            .update((state) => state = response.bodyOrThrow);
      } else {
        state = AsyncValue.error(
          "Code (${response.statusCode}), Update Profile: ${response.error as String}",
          StackTrace.current,
        );
      }

      return Future.delayed(Duration.zero);
    });
  }

  Future<List<ProfileDto>?> getAllProfiles() async {
    state = const AsyncLoading();

    Response<List<ProfileDto>?>? response;
    state = await AsyncValue.guard<void>(() async {
      response = await ref.read(swaggerP).profilesGet();

      if (response?.statusCode == 200) {
        ref
            .read(profilesListP.notifier)
            .update((state) => state = response?.bodyOrThrow);
      } else {
        state = AsyncValue.error(
          "Code (${response?.statusCode}), Get all Profiles: ${response?.error as String}",
          StackTrace.current,
        );
      }

      return;
    });

    return response?.body;
  }

  void getProfile(int id) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard<void>(() async {
      final response = await ref.read(swaggerP).profilesIdGet(id: id);

      if (response.statusCode == 200) {
        ref
            .read(currentProfileP.notifier)
            .update((state) => state = response.bodyOrThrow);
      } else {
        state = AsyncValue.error(
          "Code (${response.statusCode}), Get Profile: ${response.error as String}",
          StackTrace.current,
        );
      }

      return Future.delayed(Duration.zero);
    });
  }

  void deleteProfile(int id) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard<void>(() async {
      final response = await ref.read(swaggerP).profilesIdDelete(id: id);

      if (response.statusCode != 200) {
        state = AsyncValue.error(
          "Code (${response.statusCode}), Delete profile: ${response.error as String}",
          StackTrace.current,
        );
      }

      return Future.delayed(Duration.zero);
    });
  }
}
