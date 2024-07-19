import 'package:examen_h3_todo/controllers/auth_controllfer.dart';
import 'package:examen_h3_todo/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_strategy/url_strategy.dart';

import 'controllers/scaffold_messenger_controller.dart';

void main() {
  setPathUrlStrategy();

  runApp(const ProviderScope(child: App()));
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerP);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: ref.watch(scaffoldMessengerGlobalKeyP),
      routerConfig: router.config(
        reevaluateListenable: ref.watch(authNotifierP),
      ),
    );
  }
}
