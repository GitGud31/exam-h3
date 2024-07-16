import 'package:examen_h3_todo/api/swagger.models.swagger.dart';
import 'package:examen_h3_todo/crud/profile_crud.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final asyncProfileCrudP =
    AsyncNotifierProvider<ProfileCrudNotifier, void>(ProfileCrudNotifier.new);

final currentProfileP = StateProvider<ProfileDto?>((_) => null);
final profilesListP = StateProvider<List<ProfileDto>>((_) => []);
