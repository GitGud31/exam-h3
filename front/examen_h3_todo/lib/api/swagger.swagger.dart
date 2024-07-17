// ignore_for_file: type=lint

import 'swagger.models.swagger.dart';
import 'package:chopper/chopper.dart';

import 'client_mapping.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:chopper/chopper.dart' as chopper;
export 'swagger.enums.swagger.dart';
export 'swagger.models.swagger.dart';

part 'swagger.swagger.chopper.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class Swagger extends ChopperService {
  static Swagger create({
    ChopperClient? client,
    http.Client? httpClient,
    Authenticator? authenticator,
    ErrorConverter? errorConverter,
    Converter? converter,
    Uri? baseUrl,
    Iterable<dynamic>? interceptors,
  }) {
    if (client != null) {
      return _$Swagger(client);
    }

    final newClient = ChopperClient(
        services: [_$Swagger()],
        converter: converter ?? $JsonSerializableConverter(),
        interceptors: interceptors ?? [],
        client: httpClient,
        authenticator: authenticator,
        errorConverter: errorConverter,
        baseUrl: baseUrl ?? Uri.parse('http://'));
    return _$Swagger(newClient);
  }

  ///
  ///@param id
  Future<chopper.Response<ProfileDto>> profilesIdGet({required int? id}) {
    generatedMapping.putIfAbsent(ProfileDto, () => ProfileDto.fromJsonFactory);

    return _profilesIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/profiles/{id}')
  Future<chopper.Response<ProfileDto>> _profilesIdGet(
      {@Path('id') required int? id});

  ///
  ///@param id
  Future<chopper.Response<ProfileDto>> profilesIdPut({
    required int? id,
    required ProfileDto? body,
  }) {
    generatedMapping.putIfAbsent(ProfileDto, () => ProfileDto.fromJsonFactory);

    return _profilesIdPut(id: id, body: body);
  }

  ///
  ///@param id
  @Put(
    path: '/profiles/{id}',
    optionalBody: true,
  )
  Future<chopper.Response<ProfileDto>> _profilesIdPut({
    @Path('id') required int? id,
    @Body() required ProfileDto? body,
  });

  ///
  ///@param id
  Future<chopper.Response> profilesIdDelete({required int? id}) {
    return _profilesIdDelete(id: id);
  }

  ///
  ///@param id
  @Delete(path: '/profiles/{id}')
  Future<chopper.Response> _profilesIdDelete({@Path('id') required int? id});

  ///
  ///@param idProject
  Future<chopper.Response<ProjectDto>> profilesProjectsIdProjectPut({
    required int? idProject,
    required ProjectDto? body,
  }) {
    generatedMapping.putIfAbsent(ProjectDto, () => ProjectDto.fromJsonFactory);

    return _profilesProjectsIdProjectPut(idProject: idProject, body: body);
  }

  ///
  ///@param idProject
  @Put(
    path: '/profiles/projects/{idProject}',
    optionalBody: true,
  )
  Future<chopper.Response<ProjectDto>> _profilesProjectsIdProjectPut({
    @Path('idProject') required int? idProject,
    @Body() required ProjectDto? body,
  });

  ///
  ///@param id
  Future<chopper.Response<TaskDto>> profilesProjectsTasksIdGet(
      {required int? id}) {
    generatedMapping.putIfAbsent(TaskDto, () => TaskDto.fromJsonFactory);

    return _profilesProjectsTasksIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/profiles/projects/tasks/{id}')
  Future<chopper.Response<TaskDto>> _profilesProjectsTasksIdGet(
      {@Path('id') required int? id});

  ///
  ///@param id
  Future<chopper.Response<TaskDto>> profilesProjectsTasksIdPut({
    required int? id,
    required TaskDto? body,
  }) {
    generatedMapping.putIfAbsent(TaskDto, () => TaskDto.fromJsonFactory);

    return _profilesProjectsTasksIdPut(id: id, body: body);
  }

  ///
  ///@param id
  @Put(
    path: '/profiles/projects/tasks/{id}',
    optionalBody: true,
  )
  Future<chopper.Response<TaskDto>> _profilesProjectsTasksIdPut({
    @Path('id') required int? id,
    @Body() required TaskDto? body,
  });

  ///
  ///@param id
  Future<chopper.Response> profilesProjectsTasksIdDelete({required int? id}) {
    return _profilesProjectsTasksIdDelete(id: id);
  }

  ///
  ///@param id
  @Delete(path: '/profiles/projects/tasks/{id}')
  Future<chopper.Response> _profilesProjectsTasksIdDelete(
      {@Path('id') required int? id});

  ///
  ///@param id
  ///@param idProfile
  Future<chopper.Response<TaskDto>>
      profilesProjectsTasksIdProfileGuestIdProfilePut({
    required int? id,
    required int? idProfile,
  }) {
    generatedMapping.putIfAbsent(TaskDto, () => TaskDto.fromJsonFactory);

    return _profilesProjectsTasksIdProfileGuestIdProfilePut(
        id: id, idProfile: idProfile);
  }

  ///
  ///@param id
  ///@param idProfile
  @Put(
    path: '/profiles/projects/tasks/{id}/profile_guest/{idProfile}',
    optionalBody: true,
  )
  Future<chopper.Response<TaskDto>>
      _profilesProjectsTasksIdProfileGuestIdProfilePut({
    @Path('id') required int? id,
    @Path('idProfile') required int? idProfile,
  });

  ///
  ///@param id
  Future<chopper.Response<SubTaskDto>> profilesProjectsTasksSubtasksIdGet(
      {required int? id}) {
    generatedMapping.putIfAbsent(SubTaskDto, () => SubTaskDto.fromJsonFactory);

    return _profilesProjectsTasksSubtasksIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/profiles/projects/tasks/subtasks/{id}')
  Future<chopper.Response<SubTaskDto>> _profilesProjectsTasksSubtasksIdGet(
      {@Path('id') required int? id});

  ///
  ///@param id
  Future<chopper.Response<SubTaskDto>> profilesProjectsTasksSubtasksIdPut({
    required int? id,
    required SubTaskDto? body,
  }) {
    generatedMapping.putIfAbsent(SubTaskDto, () => SubTaskDto.fromJsonFactory);

    return _profilesProjectsTasksSubtasksIdPut(id: id, body: body);
  }

  ///
  ///@param id
  @Put(
    path: '/profiles/projects/tasks/subtasks/{id}',
    optionalBody: true,
  )
  Future<chopper.Response<SubTaskDto>> _profilesProjectsTasksSubtasksIdPut({
    @Path('id') required int? id,
    @Body() required SubTaskDto? body,
  });

  ///
  ///@param firstName
  Future<chopper.Response<List<ProfileDto>>> profilesGet({String? firstName}) {
    generatedMapping.putIfAbsent(ProfileDto, () => ProfileDto.fromJsonFactory);

    return _profilesGet(firstName: firstName);
  }

  ///
  ///@param firstName
  @Get(path: '/profiles')
  Future<chopper.Response<List<ProfileDto>>> _profilesGet(
      {@Query('firstName') String? firstName});

  ///
  Future<chopper.Response<ProfileDto>> profilesPost(
      {required ProfileDto? body}) {
    generatedMapping.putIfAbsent(ProfileDto, () => ProfileDto.fromJsonFactory);

    return _profilesPost(body: body);
  }

  ///
  @Post(
    path: '/profiles',
    optionalBody: true,
  )
  Future<chopper.Response<ProfileDto>> _profilesPost(
      {@Body() required ProfileDto? body});

  ///
  Future<chopper.Response<ProfileDto>> profilesResetPwdPost(
      {required ProfileForgetPwdDto? body}) {
    generatedMapping.putIfAbsent(ProfileDto, () => ProfileDto.fromJsonFactory);

    return _profilesResetPwdPost(body: body);
  }

  ///
  @Post(
    path: '/profiles/reset_pwd',
    optionalBody: true,
  )
  Future<chopper.Response<ProfileDto>> _profilesResetPwdPost(
      {@Body() required ProfileForgetPwdDto? body});

  ///
  Future<chopper.Response<List<ProjectDto>>> profilesProjectsGet() {
    generatedMapping.putIfAbsent(ProjectDto, () => ProjectDto.fromJsonFactory);

    return _profilesProjectsGet();
  }

  ///
  @Get(path: '/profiles/projects')
  Future<chopper.Response<List<ProjectDto>>> _profilesProjectsGet();

  ///
  Future<chopper.Response<ProjectDto>> profilesProjectsPost(
      {required ProjectDto? body}) {
    generatedMapping.putIfAbsent(ProjectDto, () => ProjectDto.fromJsonFactory);

    return _profilesProjectsPost(body: body);
  }

  ///
  @Post(
    path: '/profiles/projects',
    optionalBody: true,
  )
  Future<chopper.Response<ProjectDto>> _profilesProjectsPost(
      {@Body() required ProjectDto? body});

  ///
  ///@param idProject
  Future<chopper.Response<TaskDto>> profilesProjectsIdProjectTasksPost({
    required int? idProject,
    required TaskDto? body,
  }) {
    generatedMapping.putIfAbsent(TaskDto, () => TaskDto.fromJsonFactory);

    return _profilesProjectsIdProjectTasksPost(
        idProject: idProject, body: body);
  }

  ///
  ///@param idProject
  @Post(
    path: '/profiles/projects/{idProject}/tasks',
    optionalBody: true,
  )
  Future<chopper.Response<TaskDto>> _profilesProjectsIdProjectTasksPost({
    @Path('idProject') required int? idProject,
    @Body() required TaskDto? body,
  });

  ///
  ///@param idTask
  Future<chopper.Response<SubTaskDto>> profilesProjectsTasksIdTaskSubtasksPost({
    required int? idTask,
    required SubTaskDto? body,
  }) {
    generatedMapping.putIfAbsent(SubTaskDto, () => SubTaskDto.fromJsonFactory);

    return _profilesProjectsTasksIdTaskSubtasksPost(idTask: idTask, body: body);
  }

  ///
  ///@param idTask
  @Post(
    path: '/profiles/projects/tasks/{idTask}/subtasks',
    optionalBody: true,
  )
  Future<chopper.Response<SubTaskDto>>
      _profilesProjectsTasksIdTaskSubtasksPost({
    @Path('idTask') required int? idTask,
    @Body() required SubTaskDto? body,
  });

  ///
  ///@param id
  Future<chopper.Response<ProjectDto>> profilesProjectsIdGet(
      {required int? id}) {
    generatedMapping.putIfAbsent(ProjectDto, () => ProjectDto.fromJsonFactory);

    return _profilesProjectsIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/profiles/projects/{id}')
  Future<chopper.Response<ProjectDto>> _profilesProjectsIdGet(
      {@Path('id') required int? id});

  ///
  ///@param id
  Future<chopper.Response> profilesProjectsIdDelete({required int? id}) {
    return _profilesProjectsIdDelete(id: id);
  }

  ///
  ///@param id
  @Delete(path: '/profiles/projects/{id}')
  Future<chopper.Response> _profilesProjectsIdDelete(
      {@Path('id') required int? id});

  ///
  Future<chopper.Response<List<TaskDto>>> profilesProjectsTasksGet() {
    generatedMapping.putIfAbsent(TaskDto, () => TaskDto.fromJsonFactory);

    return _profilesProjectsTasksGet();
  }

  ///
  @Get(path: '/profiles/projects/tasks')
  Future<chopper.Response<List<TaskDto>>> _profilesProjectsTasksGet();

  ///
  Future<chopper.Response<List<SubTaskDto>>>
      profilesProjectsTasksSubtasksGet() {
    generatedMapping.putIfAbsent(SubTaskDto, () => SubTaskDto.fromJsonFactory);

    return _profilesProjectsTasksSubtasksGet();
  }

  ///
  @Get(path: '/profiles/projects/tasks/subtasks')
  Future<chopper.Response<List<SubTaskDto>>>
      _profilesProjectsTasksSubtasksGet();

  ///
  ///@param email
  ///@param Origin
  Future<chopper.Response<Response$>> profilesForgetPwdGet({
    required String? email,
    String? origin,
  }) {
    generatedMapping.putIfAbsent(Response$, () => Response$.fromJsonFactory);

    return _profilesForgetPwdGet(email: email, origin: origin?.toString());
  }

  ///
  ///@param email
  ///@param Origin
  @Get(path: '/profiles/forget_pwd')
  Future<chopper.Response<Response$>> _profilesForgetPwdGet({
    @Query('email') required String? email,
    @Header('Origin') String? origin,
  });
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (isTypeOf<T, Map>()) {
      return entity;
    }

    if (isTypeOf<T, Iterable>()) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  FutureOr<chopper.Response<ResultType>> convertResponse<ResultType, Item>(
      chopper.Response response) async {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    if (ResultType == String) {
      return response.copyWith();
    }

    if (ResultType == DateTime) {
      return response.copyWith(
          body: DateTime.parse((response.body as String).replaceAll('"', ''))
              as ResultType);
    }

    final jsonRes = await super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);
