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
  Future<Response<ProjectDto>> _profilesProjectsProfileIdProjectPut({
    required int? idProject,
    required ProjectDto? body,
  }) {
    final Uri $url = Uri.parse('/profiles/projects/profile/${idProject}');
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
  Future<Response<List<ProfileDto>>> _profilesGet() {
    final Uri $url = Uri.parse('/profiles');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
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
  Future<Response<TaskDto>> _profilesProjectsIdProjectTasksPost({
    required int? idProject,
    required Task? body,
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
  Future<Response<ProjectDto>> _profilesProjectsProfileIdProfilePost({
    required int? idProfile,
    required ProjectDto? body,
  }) {
    final Uri $url = Uri.parse('/profiles/projects/profile/${idProfile}');
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
  Future<Response<List<ProjectDto>>> _profilesProjectsGet() {
    final Uri $url = Uri.parse('/profiles/projects/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<ProjectDto>, ProjectDto>($request);
  }
}
