import 'package:examen_h3_todo/api/swagger.models.swagger.dart';
import 'package:examen_h3_todo/crud/project_crud.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final asyncProjectCrudP =
    AsyncNotifierProvider<ProjectCrudNotifier, void>(ProjectCrudNotifier.new);

final currentProjectP = StateProvider<ProjectDto?>((_) => null);
final projectsListP = StateProvider<List<ProjectDto>?>((_) => null);
