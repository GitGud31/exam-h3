// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:examen_h3_todo/consts/colors.dart';
import 'package:examen_h3_todo/controllers/profile_controller.dart';
import 'package:examen_h3_todo/routing/router.dart';
import 'package:examen_h3_todo/routing/routes.dart';
import 'package:examen_h3_todo/utils/snackbar_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

final _isResetP = StateProvider<bool>((_) => false);

@RoutePage()
class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forgot Password"),
        centerTitle: true,
      ),
      body: ref.watch(_isResetP)
          ? const _ResetPasswordBuilder()
          : const _ForgotPasswordBuilder(),
    );
  }
}

class _ForgotPasswordBuilder extends ConsumerStatefulWidget {
  const _ForgotPasswordBuilder();

  @override
  ConsumerState<_ForgotPasswordBuilder> createState() =>
      _ForgotPasswordBuilderState();
}

class _ForgotPasswordBuilderState
    extends ConsumerState<_ForgotPasswordBuilder> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.clear();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //email
            SizedBox(
              width: MediaQuery.sizeOf(context).width / 3,
              child: TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
            ),

            const Gap(16),

            // submit
            SizedBox(
              width: MediaQuery.sizeOf(context).width / 4,
              child: MaterialButton(
                color: lightBlue,
                child: const Text("Send me a code",
                    style: TextStyle(color: white)),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final result = await ref
                        .read(asyncProfileCrudP.notifier)
                        .forgotPassword(
                            _emailController.text.toLowerCase().trim());

                    if (result) {
                      Bar.success(ref, context,
                          "RESET PASSWORD CODE sent, please check your email");

                      ref.read(_isResetP.notifier).state = true;
                    } else {
                      Bar.error(ref, context, "Error sending code");
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ResetPasswordBuilder extends ConsumerStatefulWidget {
  const _ResetPasswordBuilder();

  @override
  ConsumerState<_ResetPasswordBuilder> createState() =>
      _ResetPasswordBuilderState();
}

class _ResetPasswordBuilderState extends ConsumerState<_ResetPasswordBuilder> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _codeController = TextEditingController();
  final _newPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.clear();
    _codeController.clear();
    _newPasswordController.clear();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //email
            SizedBox(
              width: MediaQuery.sizeOf(context).width / 3,
              child: TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
            ),

            const Gap(16),

            //code
            SizedBox(
              width: MediaQuery.sizeOf(context).width / 3,
              child: TextFormField(
                controller: _codeController,
                decoration: const InputDecoration(
                  labelText: 'Code',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the reset code';
                  }
                  return null;
                },
              ),
            ),

            const Gap(16),

            //new password
            SizedBox(
              width: MediaQuery.sizeOf(context).width / 3,
              child: TextFormField(
                controller: _newPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'New Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a New Password';
                  }
                  return null;
                },
              ),
            ),

            const Gap(16),

            // submit
            SizedBox(
              width: MediaQuery.sizeOf(context).width / 4,
              child: MaterialButton(
                color: lightBlue,
                child: const Text("Submit", style: TextStyle(color: white)),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final result = await ref
                        .read(asyncProfileCrudP.notifier)
                        .resetPassword(
                          _emailController.text.toLowerCase().trim(),
                          _codeController.text.toLowerCase().trim(),
                          _newPasswordController.text.toLowerCase().trim(),
                        );

                    ref.read(routerP).replaceNamed(Routes.login);

                    if (result) {
                      Bar.success(ref, context,
                          "RESET PASSWORD CODE sent, please check your email");
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
