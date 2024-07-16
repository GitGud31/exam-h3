import 'package:auto_route/auto_route.dart';
import 'package:examen_h3_todo/api/swagger.swagger.dart';
import 'package:examen_h3_todo/crud/profile_crud.dart';
import 'package:examen_h3_todo/logger.dart';
import 'package:examen_h3_todo/widgets/task_board_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.only(left: 72),
            child: Icon(Icons.circle, size: 45, color: Colors.white),
          ),
          backgroundColor: Colors.blue[800],
          title: const Text(
            'Examen H3 Todo',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
          actions: [
            MaterialButton(
              child: const Text("Post Profile test"),
              onPressed: () {
                L.debug("profile icon", "click");
                ref.read(asyncProfileCrudP.notifier).profilePost(ProfileDto(
                      id: 0,
                      createdAt: DateTime.now(),
                      email: "email@email.com",
                      password: "password test",
                      firstName: "test first name",
                      lastName: "test last name",
                      projects: [],
                    ));
              },
            )
          ],
        ),
        body: ref.watch(asyncProfileCrudP).when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, st) => Center(child: Text(e.toString())),
              data: (_) => Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(16),
                color: Colors.blue[800],
                child: const TaskBoardBuilder(),
              ),
            ));
  }
}
