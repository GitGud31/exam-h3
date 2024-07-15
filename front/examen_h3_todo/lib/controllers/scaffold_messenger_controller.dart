import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

final scaffoldMessengerGlobalKeyP = Provider<GlobalKey<ScaffoldMessengerState>>(
  (_) => GlobalKey<ScaffoldMessengerState>(),
);

final scaffoldMessengerP = Provider<ScaffoldMessengerState>(
  (ref) => ref.watch(scaffoldMessengerGlobalKeyP).currentState!,
);
