import "package:examen_h3_todo/consts/colors.dart";
import "package:examen_h3_todo/controllers/scaffold_messenger_controller.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class Bar {
  static void error(WidgetRef ref, BuildContext context, String message) {
    ref.read(scaffoldMessengerP).showSnackBar(
          SnackBar(
            backgroundColor: Theme.of(context).colorScheme.error,
            content: Text(message, style: const TextStyle(color: white)),
            showCloseIcon: true,
            closeIconColor: white,
          ),
        );
  }

  static void success(WidgetRef ref, BuildContext context, String message) {
    ref.read(scaffoldMessengerP).showSnackBar(
          SnackBar(
            backgroundColor: lightGreen,
            content: Text(message, style: const TextStyle(color: white)),
            showCloseIcon: true,
          ),
        );
  }
}
