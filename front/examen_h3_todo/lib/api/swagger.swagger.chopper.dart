// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swagger.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$Swagger extends Swagger {
  _$Swagger([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = Swagger;

  @override
  Future<Response<ProfileDto>> _profilesIdGet({required int? id}) {
    final Uri $url = Uri.parse('/profiles/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<ProfileDto, ProfileDto>($request);
  }

  @override
  Future<Response<ProfileDto>> _profilesIdPut({
    required int? id,
    required ProfileDto? body,
  }) {
    final Uri $url = Uri.parse('/profiles/${id}');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ProfileDto, ProfileDto>($request);
  }

  @override
  Future<Response<dynamic>> _profilesIdDelete({required int? id}) {
    final Uri $url = Uri.parse('/profiles/${id}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<ProjectDto>> _profilesProjectsIdProjectPut({
    required int? idProject,
    required ProjectDto? body,
  }) {
    final Uri $url = Uri.parse('/profiles/projects/${idProject}');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ProjectDto, ProjectDto>($request);
  }

  @override
  Future<Response<TaskDto>> _profilesProjectsTasksIdGet({required int? id}) {
    final Uri $url = Uri.parse('/profiles/projects/tasks/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<TaskDto, TaskDto>($request);
  }

  @override
  Future<Response<TaskDto>> _profilesProjectsTasksIdPut({
    required int? id,
    required TaskDto? body,
  }) {
    final Uri $url = Uri.parse('/profiles/projects/tasks/${id}');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<TaskDto, TaskDto>($request);
  }

  @override
  Future<Response<dynamic>> _profilesProjectsTasksIdDelete({required int? id}) {
    final Uri $url = Uri.parse('/profiles/projects/tasks/${id}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<TaskDto>> _profilesProjectsTasksIdProfileGuestIdProfilePut({
    required int? id,
    required int? idProfile,
  }) {
    final Uri $url =
        Uri.parse('/profiles/projects/tasks/${id}/profile_guest/${idProfile}');
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
    );
    return client.send<TaskDto, TaskDto>($request);
  }

  @override
  Future<Response<SubTaskDto>> _profilesProjectsTasksSubtasksIdGet(
      {required int? id}) {
    final Uri $url = Uri.parse('/profiles/projects/tasks/subtasks/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<SubTaskDto, SubTaskDto>($request);
  }

  @override
  Future<Response<SubTaskDto>> _profilesProjectsTasksSubtasksIdPut({
    required int? id,
    required SubTaskDto? body,
  }) {
    final Uri $url = Uri.parse('/profiles/projects/tasks/subtasks/${id}');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<SubTaskDto, SubTaskDto>($request);
  }

  @override
  Future<Response<List<ProfileDto>>> _profilesGet({String? firstName}) {
    final Uri $url = Uri.parse('/profiles');
    final Map<String, dynamic> $params = <String, dynamic>{
      'firstName': firstName
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<List<ProfileDto>, ProfileDto>($request);
  }

  @override
  Future<Response<ProfileDto>> _profilesPost({required ProfileDto? body}) {
    final Uri $url = Uri.parse('/profiles');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ProfileDto, ProfileDto>($request);
  }

  @override
  Future<Response<ProfileDto>> _profilesResetPwdPost(
      {required ProfileForgetPwdDto? body}) {
    final Uri $url = Uri.parse('/profiles/reset_pwd');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ProfileDto, ProfileDto>($request);
  }

  @override
  Future<Response<List<ProjectDto>>> _profilesProjectsGet() {
    final Uri $url = Uri.parse('/profiles/projects');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<ProjectDto>, ProjectDto>($request);
  }

  @override
  Future<Response<ProjectDto>> _profilesProjectsPost(
      {required ProjectDto? body}) {
    final Uri $url = Uri.parse('/profiles/projects');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ProjectDto, ProjectDto>($request);
  }

  @override
  Future<Response<TaskDto>> _profilesProjectsIdProjectTasksPost({
    required int? idProject,
    required TaskDto? body,
  }) {
    final Uri $url = Uri.parse('/profiles/projects/${idProject}/tasks');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<TaskDto, TaskDto>($request);
  }

  @override
  Future<Response<SubTaskDto>> _profilesProjectsTasksIdTaskSubtasksPost({
    required int? idTask,
    required SubTaskDto? body,
  }) {
    final Uri $url = Uri.parse('/profiles/projects/tasks/${idTask}/subtasks');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<SubTaskDto, SubTaskDto>($request);
  }

  @override
  Future<Response<ProjectDto>> _profilesProjectsIdGet({required int? id}) {
    final Uri $url = Uri.parse('/profiles/projects/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<ProjectDto, ProjectDto>($request);
  }

  @override
  Future<Response<dynamic>> _profilesProjectsIdDelete({required int? id}) {
    final Uri $url = Uri.parse('/profiles/projects/${id}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<TaskDto>>> _profilesProjectsTasksGet() {
    final Uri $url = Uri.parse('/profiles/projects/tasks');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<TaskDto>, TaskDto>($request);
  }

  @override
  Future<Response<List<SubTaskDto>>> _profilesProjectsTasksSubtasksGet() {
    final Uri $url = Uri.parse('/profiles/projects/tasks/subtasks');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<SubTaskDto>, SubTaskDto>($request);
  }

  @override
  Future<Response<Response$>> _profilesForgetPwdGet({
    required String? email,
    String? origin,
  }) {
    final Uri $url = Uri.parse('/profiles/forget_pwd');
    final Map<String, dynamic> $params = <String, dynamic>{'email': email};
    final Map<String, String> $headers = {
      if (origin != null) 'Origin': origin,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<Response$, Response$>($request);
  }
}
