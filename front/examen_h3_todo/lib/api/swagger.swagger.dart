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
  ///@param Authorization Bearer token
  Future<chopper.Response<ProfileDto>> profilesIdGet({
    required int? id,
    Object? authorization,
  }) {
    generatedMapping.putIfAbsent(ProfileDto, () => ProfileDto.fromJsonFactory);

    return _profilesIdGet(id: id, authorization: authorization?.toString());
  }

  ///
  ///@param id
  ///@param Authorization Bearer token
  @Get(path: '/profiles/{id}')
  Future<chopper.Response<ProfileDto>> _profilesIdGet({
    @Path('id') required int? id,
    @Header('Authorization') String? authorization,
  });

  ///
  ///@param id
  ///@param Authorization Bearer token
  Future<chopper.Response<ProfileDto>> profilesIdPut({
    required int? id,
    Object? authorization,
    required ProfileDto? body,
  }) {
    generatedMapping.putIfAbsent(ProfileDto, () => ProfileDto.fromJsonFactory);

    return _profilesIdPut(
        id: id, authorization: authorization?.toString(), body: body);
  }

  ///
  ///@param id
  ///@param Authorization Bearer token
  @Put(
    path: '/profiles/{id}',
    optionalBody: true,
  )
  Future<chopper.Response<ProfileDto>> _profilesIdPut({
    @Path('id') required int? id,
    @Header('Authorization') String? authorization,
    @Body() required ProfileDto? body,
  });

  ///
  ///@param id
  ///@param Authorization Bearer token
  Future<chopper.Response> profilesIdDelete({
    required int? id,
    Object? authorization,
  }) {
    return _profilesIdDelete(id: id, authorization: authorization?.toString());
  }

  ///
  ///@param id
  ///@param Authorization Bearer token
  @Delete(path: '/profiles/{id}')
  Future<chopper.Response> _profilesIdDelete({
    @Path('id') required int? id,
    @Header('Authorization') String? authorization,
  });

  ///
  ///@param idProject
  ///@param Authorization Bearer token
  Future<chopper.Response<ProjectDto>> profilesProjectsIdProjectPut({
    required int? idProject,
    Object? authorization,
    required ProjectDto? body,
  }) {
    generatedMapping.putIfAbsent(ProjectDto, () => ProjectDto.fromJsonFactory);

    return _profilesProjectsIdProjectPut(
        idProject: idProject,
        authorization: authorization?.toString(),
        body: body);
  }

  ///
  ///@param idProject
  ///@param Authorization Bearer token
  @Put(
    path: '/profiles/projects/{idProject}',
    optionalBody: true,
  )
  Future<chopper.Response<ProjectDto>> _profilesProjectsIdProjectPut({
    @Path('idProject') required int? idProject,
    @Header('Authorization') String? authorization,
    @Body() required ProjectDto? body,
  });

  ///
  ///@param id
  ///@param Authorization Bearer token
  Future<chopper.Response<TaskDto>> profilesProjectsTasksIdGet({
    required int? id,
    Object? authorization,
  }) {
    generatedMapping.putIfAbsent(TaskDto, () => TaskDto.fromJsonFactory);

    return _profilesProjectsTasksIdGet(
        id: id, authorization: authorization?.toString());
  }

  ///
  ///@param id
  ///@param Authorization Bearer token
  @Get(path: '/profiles/projects/tasks/{id}')
  Future<chopper.Response<TaskDto>> _profilesProjectsTasksIdGet({
    @Path('id') required int? id,
    @Header('Authorization') String? authorization,
  });

  ///
  ///@param id
  ///@param Authorization Bearer token
  Future<chopper.Response<TaskDto>> profilesProjectsTasksIdPut({
    required int? id,
    Object? authorization,
    required TaskDto? body,
  }) {
    generatedMapping.putIfAbsent(TaskDto, () => TaskDto.fromJsonFactory);

    return _profilesProjectsTasksIdPut(
        id: id, authorization: authorization?.toString(), body: body);
  }

  ///
  ///@param id
  ///@param Authorization Bearer token
  @Put(
    path: '/profiles/projects/tasks/{id}',
    optionalBody: true,
  )
  Future<chopper.Response<TaskDto>> _profilesProjectsTasksIdPut({
    @Path('id') required int? id,
    @Header('Authorization') String? authorization,
    @Body() required TaskDto? body,
  });

  ///
  ///@param id
  ///@param Authorization Bearer token
  Future<chopper.Response> profilesProjectsTasksIdDelete({
    required int? id,
    Object? authorization,
  }) {
    return _profilesProjectsTasksIdDelete(
        id: id, authorization: authorization?.toString());
  }

  ///
  ///@param id
  ///@param Authorization Bearer token
  @Delete(path: '/profiles/projects/tasks/{id}')
  Future<chopper.Response> _profilesProjectsTasksIdDelete({
    @Path('id') required int? id,
    @Header('Authorization') String? authorization,
  });

  ///
  ///@param id
  ///@param idProfile
  ///@param Authorization Bearer token
  Future<chopper.Response<TaskDto>>
      profilesProjectsTasksIdProfileGuestIdProfilePut({
    required int? id,
    required int? idProfile,
    Object? authorization,
  }) {
    generatedMapping.putIfAbsent(TaskDto, () => TaskDto.fromJsonFactory);

    return _profilesProjectsTasksIdProfileGuestIdProfilePut(
        id: id, idProfile: idProfile, authorization: authorization?.toString());
  }

  ///
  ///@param id
  ///@param idProfile
  ///@param Authorization Bearer token
  @Put(
    path: '/profiles/projects/tasks/{id}/profile_guest/{idProfile}',
    optionalBody: true,
  )
  Future<chopper.Response<TaskDto>>
      _profilesProjectsTasksIdProfileGuestIdProfilePut({
    @Path('id') required int? id,
    @Path('idProfile') required int? idProfile,
    @Header('Authorization') String? authorization,
  });

  ///
  ///@param id
  ///@param Authorization Bearer token
  Future<chopper.Response<SubTaskDto>> profilesProjectsTasksSubtasksIdGet({
    required int? id,
    Object? authorization,
  }) {
    generatedMapping.putIfAbsent(SubTaskDto, () => SubTaskDto.fromJsonFactory);

    return _profilesProjectsTasksSubtasksIdGet(
        id: id, authorization: authorization?.toString());
  }

  ///
  ///@param id
  ///@param Authorization Bearer token
  @Get(path: '/profiles/projects/tasks/subtasks/{id}')
  Future<chopper.Response<SubTaskDto>> _profilesProjectsTasksSubtasksIdGet({
    @Path('id') required int? id,
    @Header('Authorization') String? authorization,
  });

  ///
  ///@param id
  ///@param Authorization Bearer token
  Future<chopper.Response<SubTaskDto>> profilesProjectsTasksSubtasksIdPut({
    required int? id,
    Object? authorization,
    required SubTaskDto? body,
  }) {
    generatedMapping.putIfAbsent(SubTaskDto, () => SubTaskDto.fromJsonFactory);

    return _profilesProjectsTasksSubtasksIdPut(
        id: id, authorization: authorization?.toString(), body: body);
  }

  ///
  ///@param id
  ///@param Authorization Bearer token
  @Put(
    path: '/profiles/projects/tasks/subtasks/{id}',
    optionalBody: true,
  )
  Future<chopper.Response<SubTaskDto>> _profilesProjectsTasksSubtasksIdPut({
    @Path('id') required int? id,
    @Header('Authorization') String? authorization,
    @Body() required SubTaskDto? body,
  });

  ///
  ///@param firstName
  ///@param Authorization Bearer token
  Future<chopper.Response<List<ProfileDto>>> profilesGet({
    String? firstName,
    Object? authorization,
  }) {
    generatedMapping.putIfAbsent(ProfileDto, () => ProfileDto.fromJsonFactory);

    return _profilesGet(
        firstName: firstName, authorization: authorization?.toString());
  }

  ///
  ///@param firstName
  ///@param Authorization Bearer token
  @Get(path: '/profiles')
  Future<chopper.Response<List<ProfileDto>>> _profilesGet({
    @Query('firstName') String? firstName,
    @Header('Authorization') String? authorization,
  });

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
  ///@param Authorization Bearer token
  Future<chopper.Response<List<ProjectDto>>> profilesProjectsGet(
      {Object? authorization}) {
    generatedMapping.putIfAbsent(ProjectDto, () => ProjectDto.fromJsonFactory);

    return _profilesProjectsGet(authorization: authorization?.toString());
  }

  ///
  ///@param Authorization Bearer token
  @Get(path: '/profiles/projects')
  Future<chopper.Response<List<ProjectDto>>> _profilesProjectsGet(
      {@Header('Authorization') String? authorization});

  ///
  ///@param Authorization Bearer token
  Future<chopper.Response<ProjectDto>> profilesProjectsPost({
    Object? authorization,
    required ProjectDto? body,
  }) {
    generatedMapping.putIfAbsent(ProjectDto, () => ProjectDto.fromJsonFactory);

    return _profilesProjectsPost(
        authorization: authorization?.toString(), body: body);
  }

  ///
  ///@param Authorization Bearer token
  @Post(
    path: '/profiles/projects',
    optionalBody: true,
  )
  Future<chopper.Response<ProjectDto>> _profilesProjectsPost({
    @Header('Authorization') String? authorization,
    @Body() required ProjectDto? body,
  });

  ///
  ///@param idProject
  ///@param Authorization Bearer token
  Future<chopper.Response<List<TaskDto>>> profilesProjectsIdProjectTasksGet({
    required int? idProject,
    Object? authorization,
  }) {
    generatedMapping.putIfAbsent(TaskDto, () => TaskDto.fromJsonFactory);

    return _profilesProjectsIdProjectTasksGet(
        idProject: idProject, authorization: authorization?.toString());
  }

  ///
  ///@param idProject
  ///@param Authorization Bearer token
  @Get(path: '/profiles/projects/{idProject}/tasks')
  Future<chopper.Response<List<TaskDto>>> _profilesProjectsIdProjectTasksGet({
    @Path('idProject') required int? idProject,
    @Header('Authorization') String? authorization,
  });

  ///
  ///@param idProject
  ///@param Authorization Bearer token
  Future<chopper.Response<TaskDto>> profilesProjectsIdProjectTasksPost({
    required int? idProject,
    Object? authorization,
    required TaskDto? body,
  }) {
    generatedMapping.putIfAbsent(TaskDto, () => TaskDto.fromJsonFactory);

    return _profilesProjectsIdProjectTasksPost(
        idProject: idProject,
        authorization: authorization?.toString(),
        body: body);
  }

  ///
  ///@param idProject
  ///@param Authorization Bearer token
  @Post(
    path: '/profiles/projects/{idProject}/tasks',
    optionalBody: true,
  )
  Future<chopper.Response<TaskDto>> _profilesProjectsIdProjectTasksPost({
    @Path('idProject') required int? idProject,
    @Header('Authorization') String? authorization,
    @Body() required TaskDto? body,
  });

  ///
  ///@param idTask
  ///@param Authorization Bearer token
  Future<chopper.Response<SubTaskDto>> profilesProjectsTasksIdTaskSubtasksPost({
    required int? idTask,
    Object? authorization,
    required SubTaskDto? body,
  }) {
    generatedMapping.putIfAbsent(SubTaskDto, () => SubTaskDto.fromJsonFactory);

    return _profilesProjectsTasksIdTaskSubtasksPost(
        idTask: idTask, authorization: authorization?.toString(), body: body);
  }

  ///
  ///@param idTask
  ///@param Authorization Bearer token
  @Post(
    path: '/profiles/projects/tasks/{idTask}/subtasks',
    optionalBody: true,
  )
  Future<chopper.Response<SubTaskDto>>
      _profilesProjectsTasksIdTaskSubtasksPost({
    @Path('idTask') required int? idTask,
    @Header('Authorization') String? authorization,
    @Body() required SubTaskDto? body,
  });

  ///
  ///@param id
  ///@param Authorization Bearer token
  Future<chopper.Response<ProjectDto>> profilesProjectsIdGet({
    required int? id,
    Object? authorization,
  }) {
    generatedMapping.putIfAbsent(ProjectDto, () => ProjectDto.fromJsonFactory);

    return _profilesProjectsIdGet(
        id: id, authorization: authorization?.toString());
  }

  ///
  ///@param id
  ///@param Authorization Bearer token
  @Get(path: '/profiles/projects/{id}')
  Future<chopper.Response<ProjectDto>> _profilesProjectsIdGet({
    @Path('id') required int? id,
    @Header('Authorization') String? authorization,
  });

  ///
  ///@param id
  ///@param Authorization Bearer token
  Future<chopper.Response> profilesProjectsIdDelete({
    required int? id,
    Object? authorization,
  }) {
    return _profilesProjectsIdDelete(
        id: id, authorization: authorization?.toString());
  }

  ///
  ///@param id
  ///@param Authorization Bearer token
  @Delete(path: '/profiles/projects/{id}')
  Future<chopper.Response> _profilesProjectsIdDelete({
    @Path('id') required int? id,
    @Header('Authorization') String? authorization,
  });

  ///
  ///@param Authorization Bearer token
  Future<chopper.Response<List<SubTaskDto>>> profilesProjectsTasksSubtasksGet(
      {Object? authorization}) {
    generatedMapping.putIfAbsent(SubTaskDto, () => SubTaskDto.fromJsonFactory);

    return _profilesProjectsTasksSubtasksGet(
        authorization: authorization?.toString());
  }

  ///
  ///@param Authorization Bearer token
  @Get(path: '/profiles/projects/tasks/subtasks')
  Future<chopper.Response<List<SubTaskDto>>> _profilesProjectsTasksSubtasksGet(
      {@Header('Authorization') String? authorization});

  ///
  ///@param email
  Future<chopper.Response<Response$>> profilesForgetPwdGet(
      {required String? email}) {
    generatedMapping.putIfAbsent(Response$, () => Response$.fromJsonFactory);

    return _profilesForgetPwdGet(email: email);
  }

  ///
  ///@param email
  @Get(path: '/profiles/forget_pwd')
  Future<chopper.Response<Response$>> _profilesForgetPwdGet(
      {@Query('email') required String? email});

  ///
  ///@param Authorization Bearer token
  Future<chopper.Response<ProfileDto>> profilesCurrentGet(
      {Object? authorization}) {
    generatedMapping.putIfAbsent(ProfileDto, () => ProfileDto.fromJsonFactory);

    return _profilesCurrentGet(authorization: authorization?.toString());
  }

  ///
  ///@param Authorization Bearer token
  @Get(path: '/profiles/current')
  Future<chopper.Response<ProfileDto>> _profilesCurrentGet(
      {@Header('Authorization') String? authorization});
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
