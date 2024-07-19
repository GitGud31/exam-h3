// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:examen_h3_todo/api/swagger.models.swagger.dart';
import 'package:examen_h3_todo/consts/colors.dart';
import 'package:examen_h3_todo/controllers/profile_controller.dart';
import 'package:examen_h3_todo/routing/router.dart';
import 'package:examen_h3_todo/routing/routes.dart';
import 'package:examen_h3_todo/utils/snackbar_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

@RoutePage()
class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fnController = TextEditingController();
  final _lnController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _fnController.dispose();
    _lnController.dispose();

    super.dispose();
  }

  void _signup() async {
    if (_formKey.currentState!.validate()) {
      final profileDto = ProfileDto(
        id: 0,
        projects: [],
        version: 0,
        createdAt: DateTime.now(),
        firstName: _fnController.text.trim(),
        lastName: _lnController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      final result = await ref
          .read(asyncProfileCrudP.notifier)
          .createProfile(context, profileDto);

      if (result) {
        _emailController.clear();
        _passwordController.clear();
        _fnController.clear();
        _lnController.clear();

        Bar.success(ref, context, "Profile created");

        ref.read(routerP).replaceNamed(Routes.login);
      } else {
        Bar.error(ref, context, "Error creating profile");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Signup"), centerTitle: true),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //title
              const Text("Create your profile",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),

              const Gap(80),

              //first name
              SizedBox(
                width: MediaQuery.sizeOf(context).width / 3,
                child: TextFormField(
                  controller: _fnController,
                  decoration: const InputDecoration(
                    labelText: 'First name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
              ),

              const Gap(16),

              //last name
              SizedBox(
                width: MediaQuery.sizeOf(context).width / 3,
                child: TextFormField(
                  controller: _lnController,
                  decoration: const InputDecoration(
                    labelText: 'Last name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
              ),

              const Gap(16),

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

              // signup button
              SizedBox(
                width: MediaQuery.sizeOf(context).width / 4,
                child: MaterialButton(
                  color: lightGreen,
                  onPressed: _signup,
                  child: const Text('Signup'),
                ),
              ),

              const Gap(16),

              // go login button
              GestureDetector(
                onTap: () => ref.read(routerP).replaceNamed(Routes.login),
                child: const Text(
                  'Already have an account? Go Login',
                  style: TextStyle(
                      decoration: TextDecoration.underline, color: black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
