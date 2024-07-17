// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:examen_h3_todo/api/swagger.swagger.dart';
import 'package:examen_h3_todo/consts/urls.dart';
import 'package:examen_h3_todo/controllers/profile_controller.dart';
import 'package:examen_h3_todo/controllers/swagger_controller.dart';
import 'package:examen_h3_todo/logger.dart';
import 'package:examen_h3_todo/models/user_token.dart';
import 'package:examen_h3_todo/utils/snackbar_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileCrudNotifier extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() async {}

  Future<bool> createProfile(BuildContext context, ProfileDto profile) async {
    state = const AsyncLoading();

    bool result = false;
    state = await AsyncValue.guard<void>(() async {
      final response = await ref.read(swaggerP).profilesPost(body: profile);

      if (response.statusCode == 200) {
        ref
            .read(currentProfileP.notifier)
            .update((state) => state = response.bodyOrThrow);

        result = true;
        return;
      } else {
        Bar.error(
            ref, context, "Error (${response.statusCode}) Creating Profile");

        state = AsyncValue.error(
          "Code (${response.statusCode}), Create Profile: ${response.error as String}",
          StackTrace.current,
        );
      }
    });

    return result;
  }

  Future<bool> loginProfile(
      BuildContext context, String email, String password) async {
    state = const AsyncLoading();

    bool result = false;
    state = await AsyncValue.guard<void>(() async {
      final loginUrl = Uri.parse("${Url.baseUrl}/login");
      final response = await ref.read(swaggerP).client.post(loginUrl, body: {
        "email": email,
        "password": password,
      });

      if (response.statusCode == 200) {
        //save token
        ref
            .read(profileTokenP.notifier)
            .update((state) => state = UserToken.fromMap(response.bodyOrThrow));

        //get profile by email
        final profileDtoResponse = await ref
            .read(swaggerP)
            .profilesCurrentGet(authorization: ref.read(profileTokenP)!.token);

        L.debug("get profile by email profile", profileDtoResponse);

        //select currentProfile
        ref
            .read(currentProfileP.notifier)
            .update((state) => state = profileDtoResponse.bodyOrThrow);

        result = true;
        return;
      } else {
        Bar.error(ref, context,
            "Error (${response.statusCode}) Error Log in Profile");

        state = AsyncValue.error(
          "Code (${response.statusCode}), Login Profile: ${response.error as String}",
          StackTrace.current,
        );
      }

      return;
    });

    return result;
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
