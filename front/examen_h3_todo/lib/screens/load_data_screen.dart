import 'package:auto_route/auto_route.dart';
import 'package:examen_h3_todo/controllers/load_data_controller.dart';
import 'package:examen_h3_todo/screens/select_project_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class LoadDataScreen extends ConsumerStatefulWidget {
  const LoadDataScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoadDataScreenState();
}

class _LoadDataScreenState extends ConsumerState<LoadDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ref.watch(asyncLoadDataP).when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, st) => Center(child: Text(e.toString())),
            data: (_) => const SelectProjectScreen(),
          ),
    );
  }
}
