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

@RoutePage()
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  void _login() async {
    if (_formKey.currentState!.validate()) {
      final result = await ref.read(asyncProfileCrudP.notifier).loginProfile(
            context,
            _emailController.text.trim(),
            _passwordController.text.trim(),
          );

      if (result) {
        _emailController.clear();
        _passwordController.clear();

        Bar.success(ref, context, "Login successful");

        ref.read(routerP).replaceNamed(Routes.loadData);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Login"), centerTitle: true),
        body: ref.watch(asyncProfileCrudP).when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) => Center(child: Text(error.toString())),
            data: (_) {
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

                      //password
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width / 3,
                        child: TextFormField(
                          controller: _passwordController,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                      ),

                      const Gap(16),

                      //login button
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width / 4,
                        child: MaterialButton(
                          color: lightBlue,
                          onPressed: _login,
                          child: const Text('Login'),
                        ),
                      ),

                      const Gap(16),

                      // go signup button
                      GestureDetector(
                        onTap: () =>
                            ref.read(routerP).replaceNamed(Routes.signup),
                        child: const Text(
                          "Don't have an account ? Signup",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: black),
                        ),
                      ),

                      const Gap(16),

                      // go signup button
                      GestureDetector(
                        onTap: () => ref
                            .read(routerP)
                            .navigateNamed(Routes.forgotPassword),
                        child: Text(
                          "I Forgot my password",
                          style: TextStyle(color: lightRed),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
