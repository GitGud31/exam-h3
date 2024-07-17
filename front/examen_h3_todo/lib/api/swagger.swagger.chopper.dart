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
  Future<Response<ProfileDto>> _profilesIdGet({
    required int? id,
    String? authorization,
  }) {
    final Uri $url = Uri.parse('/profiles/${id}');
    final Map<String, String> $headers = {
      if (authorization != null) 'Authorization': authorization,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<ProfileDto, ProfileDto>($request);
  }

  @override
  Future<Response<ProfileDto>> _profilesIdPut({
    required int? id,
    String? authorization,
    required ProfileDto? body,
  }) {
    final Uri $url = Uri.parse('/profiles/${id}');
    final Map<String, String> $headers = {
      if (authorization != null) 'Authorization': authorization,
    };
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<ProfileDto, ProfileDto>($request);
  }

  @override
  Future<Response<dynamic>> _profilesIdDelete({
    required int? id,
    String? authorization,
  }) {
    final Uri $url = Uri.parse('/profiles/${id}');
    final Map<String, String> $headers = {
      if (authorization != null) 'Authorization': authorization,
    };
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<ProjectDto>> _profilesProjectsIdProjectPut({
    required int? idProject,
    String? authorization,
    required ProjectDto? body,
  }) {
    final Uri $url = Uri.parse('/profiles/projects/${idProject}');
    final Map<String, String> $headers = {
      if (authorization != null) 'Authorization': authorization,
    };
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<ProjectDto, ProjectDto>($request);
  }

  @override
  Future<Response<TaskDto>> _profilesProjectsTasksIdGet({
    required int? id,
    String? authorization,
  }) {
    final Uri $url = Uri.parse('/profiles/projects/tasks/${id}');
    final Map<String, String> $headers = {
      if (authorization != null) 'Authorization': authorization,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<TaskDto, TaskDto>($request);
  }

  @override
  Future<Response<TaskDto>> _profilesProjectsTasksIdPut({
    required int? id,
    String? authorization,
    required TaskDto? body,
  }) {
    final Uri $url = Uri.parse('/profiles/projects/tasks/${id}');
    final Map<String, String> $headers = {
      if (authorization != null) 'Authorization': authorization,
    };
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<TaskDto, TaskDto>($request);
  }

  @override
  Future<Response<dynamic>> _profilesProjectsTasksIdDelete({
    required int? id,
    String? authorization,
  }) {
    final Uri $url = Uri.parse('/profiles/projects/tasks/${id}');
    final Map<String, String> $headers = {
      if (authorization != null) 'Authorization': authorization,
    };
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<TaskDto>> _profilesProjectsTasksIdProfileGuestIdProfilePut({
    required int? id,
    required int? idProfile,
    String? authorization,
  }) {
    final Uri $url =
        Uri.parse('/profiles/projects/tasks/${id}/profile_guest/${idProfile}');
    final Map<String, String> $headers = {
      if (authorization != null) 'Authorization': authorization,
    };
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<TaskDto, TaskDto>($request);
  }

  @override
  Future<Response<SubTaskDto>> _profilesProjectsTasksSubtasksIdGet({
    required int? id,
    String? authorization,
  }) {
    final Uri $url = Uri.parse('/profiles/projects/tasks/subtasks/${id}');
    final Map<String, String> $headers = {
      if (authorization != null) 'Authorization': authorization,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<SubTaskDto, SubTaskDto>($request);
  }

  @override
  Future<Response<SubTaskDto>> _profilesProjectsTasksSubtasksIdPut({
    required int? id,
    String? authorization,
    required SubTaskDto? body,
  }) {
    final Uri $url = Uri.parse('/profiles/projects/tasks/subtasks/${id}');
    final Map<String, String> $headers = {
      if (authorization != null) 'Authorization': authorization,
    };
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<SubTaskDto, SubTaskDto>($request);
  }

  @override
  Future<Response<List<ProfileDto>>> _profilesGet({
    String? firstName,
    String? authorization,
  }) {
    final Uri $url = Uri.parse('/profiles');
    final Map<String, dynamic> $params = <String, dynamic>{
      'firstName': firstName
    };
    final Map<String, String> $headers = {
      if (authorization != null) 'Authorization': authorization,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
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
  Future<Response<List<ProjectDto>>> _profilesProjectsGet(
      {String? authorization}) {
    final Uri $url = Uri.parse('/profiles/projects');
    final Map<String, String> $headers = {
      if (authorization != null) 'Authorization': authorization,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<List<ProjectDto>, ProjectDto>($request);
  }

  @override
  Future<Response<ProjectDto>> _profilesProjectsPost({
    String? authorization,
    required ProjectDto? body,
  }) {
    final Uri $url = Uri.parse('/profiles/projects');
    final Map<String, String> $headers = {
      if (authorization != null) 'Authorization': authorization,
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<ProjectDto, ProjectDto>($request);
  }

  @override
  Future<Response<TaskDto>> _profilesProjectsIdProjectTasksPost({
    required int? idProject,
    String? authorization,
    required TaskDto? body,
  }) {
    final Uri $url = Uri.parse('/profiles/projects/${idProject}/tasks');
    final Map<String, String> $headers = {
      if (authorization != null) 'Authorization': authorization,
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<TaskDto, TaskDto>($request);
  }

  @override
  Future<Response<SubTaskDto>> _profilesProjectsTasksIdTaskSubtasksPost({
    required int? idTask,
    String? authorization,
    required SubTaskDto? body,
  }) {
    final Uri $url = Uri.parse('/profiles/projects/tasks/${idTask}/subtasks');
    final Map<String, String> $headers = {
      if (authorization != null) 'Authorization': authorization,
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<SubTaskDto, SubTaskDto>($request);
  }

  @override
  Future<Response<ProjectDto>> _profilesProjectsIdGet({
    required int? id,
    String? authorization,
  }) {
    final Uri $url = Uri.parse('/profiles/projects/${id}');
    final Map<String, String> $headers = {
      if (authorization != null) 'Authorization': authorization,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<ProjectDto, ProjectDto>($request);
  }

  @override
  Future<Response<dynamic>> _profilesProjectsIdDelete({
    required int? id,
    String? authorization,
  }) {
    final Uri $url = Uri.parse('/profiles/projects/${id}');
    final Map<String, String> $headers = {
      if (authorization != null) 'Authorization': authorization,
    };
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<TaskDto>>> _profilesProjectsTasksGet(
      {String? authorization}) {
    final Uri $url = Uri.parse('/profiles/projects/tasks');
    final Map<String, String> $headers = {
      if (authorization != null) 'Authorization': authorization,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<List<TaskDto>, TaskDto>($request);
  }

  @override
  Future<Response<List<SubTaskDto>>> _profilesProjectsTasksSubtasksGet(
      {String? authorization}) {
    final Uri $url = Uri.parse('/profiles/projects/tasks/subtasks');
    final Map<String, String> $headers = {
      if (authorization != null) 'Authorization': authorization,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
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

  @override
  Future<Response<ProfileDto>> _profilesCurrentGet({String? authorization}) {
    final Uri $url = Uri.parse('/profiles/current');
    final Map<String, String> $headers = {
      if (authorization != null) 'Authorization': authorization,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<ProfileDto, ProfileDto>($request);
  }
}
