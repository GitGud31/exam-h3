// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

import 'swagger.enums.swagger.dart' as enums;

part 'swagger.models.swagger.g.dart';

@JsonSerializable(explicitToJson: true)
class ErrorInfo {
  const ErrorInfo({
    this.url,
    this.message,
  });

  factory ErrorInfo.fromJson(Map<String, dynamic> json) =>
      _$ErrorInfoFromJson(json);

  static const toJsonFactory = _$ErrorInfoToJson;
  Map<String, dynamic> toJson() => _$ErrorInfoToJson(this);

  @JsonKey(name: 'url')
  final String? url;
  @JsonKey(name: 'message')
  final String? message;
  static const fromJsonFactory = _$ErrorInfoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ErrorInfo &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(message) ^
      runtimeType.hashCode;
}

extension $ErrorInfoExtension on ErrorInfo {
  ErrorInfo copyWith({String? url, String? message}) {
    return ErrorInfo(url: url ?? this.url, message: message ?? this.message);
  }

  ErrorInfo copyWithWrapped(
      {Wrapped<String?>? url, Wrapped<String?>? message}) {
    return ErrorInfo(
        url: (url != null ? url.value : this.url),
        message: (message != null ? message.value : this.message));
  }
}

@JsonSerializable(explicitToJson: true)
class ProfileDto {
  const ProfileDto({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.password,
    this.createdAt,
    this.version,
    this.projects,
  });

  factory ProfileDto.fromJson(Map<String, dynamic> json) =>
      _$ProfileDtoFromJson(json);

  static const toJsonFactory = _$ProfileDtoToJson;
  Map<String, dynamic> toJson() => _$ProfileDtoToJson(this);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'firstName')
  final String? firstName;
  @JsonKey(name: 'lastName')
  final String? lastName;
  @JsonKey(name: 'password')
  final String? password;
  @JsonKey(name: 'createdAt')
  final DateTime? createdAt;
  @JsonKey(name: 'version')
  final int? version;
  @JsonKey(name: 'projects', defaultValue: <ProjectDto>[])
  final List<ProjectDto>? projects;
  static const fromJsonFactory = _$ProfileDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ProfileDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality()
                    .equals(other.version, version)) &&
            (identical(other.projects, projects) ||
                const DeepCollectionEquality()
                    .equals(other.projects, projects)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(projects) ^
      runtimeType.hashCode;
}

extension $ProfileDtoExtension on ProfileDto {
  ProfileDto copyWith(
      {int? id,
      String? email,
      String? firstName,
      String? lastName,
      String? password,
      DateTime? createdAt,
      int? version,
      List<ProjectDto>? projects}) {
    return ProfileDto(
        id: id ?? this.id,
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        password: password ?? this.password,
        createdAt: createdAt ?? this.createdAt,
        version: version ?? this.version,
        projects: projects ?? this.projects);
  }

  ProfileDto copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String?>? email,
      Wrapped<String?>? firstName,
      Wrapped<String?>? lastName,
      Wrapped<String?>? password,
      Wrapped<DateTime?>? createdAt,
      Wrapped<int?>? version,
      Wrapped<List<ProjectDto>?>? projects}) {
    return ProfileDto(
        id: (id != null ? id.value : this.id),
        email: (email != null ? email.value : this.email),
        firstName: (firstName != null ? firstName.value : this.firstName),
        lastName: (lastName != null ? lastName.value : this.lastName),
        password: (password != null ? password.value : this.password),
        createdAt: (createdAt != null ? createdAt.value : this.createdAt),
        version: (version != null ? version.value : this.version),
        projects: (projects != null ? projects.value : this.projects));
  }
}

@JsonSerializable(explicitToJson: true)
class ProjectDto {
  const ProjectDto({
    this.id,
    this.description,
    this.createdAt,
    this.tasks,
  });

  factory ProjectDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectDtoFromJson(json);

  static const toJsonFactory = _$ProjectDtoToJson;
  Map<String, dynamic> toJson() => _$ProjectDtoToJson(this);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'createdAt')
  final DateTime? createdAt;
  @JsonKey(name: 'tasks', defaultValue: <TaskDto>[])
  final List<TaskDto>? tasks;
  static const fromJsonFactory = _$ProjectDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ProjectDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.tasks, tasks) ||
                const DeepCollectionEquality().equals(other.tasks, tasks)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(tasks) ^
      runtimeType.hashCode;
}

extension $ProjectDtoExtension on ProjectDto {
  ProjectDto copyWith(
      {int? id,
      String? description,
      DateTime? createdAt,
      List<TaskDto>? tasks}) {
    return ProjectDto(
        id: id ?? this.id,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        tasks: tasks ?? this.tasks);
  }

  ProjectDto copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String?>? description,
      Wrapped<DateTime?>? createdAt,
      Wrapped<List<TaskDto>?>? tasks}) {
    return ProjectDto(
        id: (id != null ? id.value : this.id),
        description:
            (description != null ? description.value : this.description),
        createdAt: (createdAt != null ? createdAt.value : this.createdAt),
        tasks: (tasks != null ? tasks.value : this.tasks));
  }
}

@JsonSerializable(explicitToJson: true)
class SubTaskDto {
  const SubTaskDto({
    this.id,
    this.description,
    this.createdAt,
    this.checked,
  });

  factory SubTaskDto.fromJson(Map<String, dynamic> json) =>
      _$SubTaskDtoFromJson(json);

  static const toJsonFactory = _$SubTaskDtoToJson;
  Map<String, dynamic> toJson() => _$SubTaskDtoToJson(this);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'createdAt')
  final DateTime? createdAt;
  @JsonKey(name: 'checked')
  final bool? checked;
  static const fromJsonFactory = _$SubTaskDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is SubTaskDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.checked, checked) ||
                const DeepCollectionEquality().equals(other.checked, checked)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(checked) ^
      runtimeType.hashCode;
}

extension $SubTaskDtoExtension on SubTaskDto {
  SubTaskDto copyWith(
      {int? id, String? description, DateTime? createdAt, bool? checked}) {
    return SubTaskDto(
        id: id ?? this.id,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        checked: checked ?? this.checked);
  }

  SubTaskDto copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String?>? description,
      Wrapped<DateTime?>? createdAt,
      Wrapped<bool?>? checked}) {
    return SubTaskDto(
        id: (id != null ? id.value : this.id),
        description:
            (description != null ? description.value : this.description),
        createdAt: (createdAt != null ? createdAt.value : this.createdAt),
        checked: (checked != null ? checked.value : this.checked));
  }
}

@JsonSerializable(explicitToJson: true)
class TaskDto {
  const TaskDto({
    this.id,
    this.title,
    this.description,
    this.state,
    this.priority,
    this.createdAt,
    this.deadline,
    this.creator,
    this.version,
    this.subTasks,
  });

  factory TaskDto.fromJson(Map<String, dynamic> json) =>
      _$TaskDtoFromJson(json);

  static const toJsonFactory = _$TaskDtoToJson;
  Map<String, dynamic> toJson() => _$TaskDtoToJson(this);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(
    name: 'state',
    toJson: taskDtoStateNullableToJson,
    fromJson: taskDtoStateNullableFromJson,
  )
  final enums.TaskDtoState? state;
  @JsonKey(
    name: 'priority',
    toJson: taskDtoPriorityNullableToJson,
    fromJson: taskDtoPriorityNullableFromJson,
  )
  final enums.TaskDtoPriority? priority;
  @JsonKey(name: 'createdAt')
  final DateTime? createdAt;
  @JsonKey(name: 'deadline')
  final DateTime? deadline;
  @JsonKey(name: 'creator')
  final ProfileDto? creator;
  @JsonKey(name: 'version')
  final int? version;
  @JsonKey(name: 'subTasks', defaultValue: <SubTaskDto>[])
  final List<SubTaskDto>? subTasks;
  static const fromJsonFactory = _$TaskDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is TaskDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.priority, priority) ||
                const DeepCollectionEquality()
                    .equals(other.priority, priority)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.deadline, deadline) ||
                const DeepCollectionEquality()
                    .equals(other.deadline, deadline)) &&
            (identical(other.creator, creator) ||
                const DeepCollectionEquality()
                    .equals(other.creator, creator)) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality()
                    .equals(other.version, version)) &&
            (identical(other.subTasks, subTasks) ||
                const DeepCollectionEquality()
                    .equals(other.subTasks, subTasks)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(priority) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(deadline) ^
      const DeepCollectionEquality().hash(creator) ^
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(subTasks) ^
      runtimeType.hashCode;
}

extension $TaskDtoExtension on TaskDto {
  TaskDto copyWith(
      {int? id,
      String? title,
      String? description,
      enums.TaskDtoState? state,
      enums.TaskDtoPriority? priority,
      DateTime? createdAt,
      DateTime? deadline,
      ProfileDto? creator,
      int? version,
      List<SubTaskDto>? subTasks}) {
    return TaskDto(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        state: state ?? this.state,
        priority: priority ?? this.priority,
        createdAt: createdAt ?? this.createdAt,
        deadline: deadline ?? this.deadline,
        creator: creator ?? this.creator,
        version: version ?? this.version,
        subTasks: subTasks ?? this.subTasks);
  }

  TaskDto copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String?>? title,
      Wrapped<String?>? description,
      Wrapped<enums.TaskDtoState?>? state,
      Wrapped<enums.TaskDtoPriority?>? priority,
      Wrapped<DateTime?>? createdAt,
      Wrapped<DateTime?>? deadline,
      Wrapped<ProfileDto?>? creator,
      Wrapped<int?>? version,
      Wrapped<List<SubTaskDto>?>? subTasks}) {
    return TaskDto(
        id: (id != null ? id.value : this.id),
        title: (title != null ? title.value : this.title),
        description:
            (description != null ? description.value : this.description),
        state: (state != null ? state.value : this.state),
        priority: (priority != null ? priority.value : this.priority),
        createdAt: (createdAt != null ? createdAt.value : this.createdAt),
        deadline: (deadline != null ? deadline.value : this.deadline),
        creator: (creator != null ? creator.value : this.creator),
        version: (version != null ? version.value : this.version),
        subTasks: (subTasks != null ? subTasks.value : this.subTasks));
  }
}

@JsonSerializable(explicitToJson: true)
class ProfileForgetPwdDto {
  const ProfileForgetPwdDto({
    this.email,
    this.code,
    this.newPwd,
  });

  factory ProfileForgetPwdDto.fromJson(Map<String, dynamic> json) =>
      _$ProfileForgetPwdDtoFromJson(json);

  static const toJsonFactory = _$ProfileForgetPwdDtoToJson;
  Map<String, dynamic> toJson() => _$ProfileForgetPwdDtoToJson(this);

  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'code')
  final String? code;
  @JsonKey(name: 'newPwd')
  final String? newPwd;
  static const fromJsonFactory = _$ProfileForgetPwdDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ProfileForgetPwdDto &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.newPwd, newPwd) ||
                const DeepCollectionEquality().equals(other.newPwd, newPwd)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(newPwd) ^
      runtimeType.hashCode;
}

extension $ProfileForgetPwdDtoExtension on ProfileForgetPwdDto {
  ProfileForgetPwdDto copyWith({String? email, String? code, String? newPwd}) {
    return ProfileForgetPwdDto(
        email: email ?? this.email,
        code: code ?? this.code,
        newPwd: newPwd ?? this.newPwd);
  }

  ProfileForgetPwdDto copyWithWrapped(
      {Wrapped<String?>? email,
      Wrapped<String?>? code,
      Wrapped<String?>? newPwd}) {
    return ProfileForgetPwdDto(
        email: (email != null ? email.value : this.email),
        code: (code != null ? code.value : this.code),
        newPwd: (newPwd != null ? newPwd.value : this.newPwd));
  }
}

@JsonSerializable(explicitToJson: true)
class Response$ {
  const Response$({
    this.status,
  });

  factory Response$.fromJson(Map<String, dynamic> json) =>
      _$Response$FromJson(json);

  static const toJsonFactory = _$Response$ToJson;
  Map<String, dynamic> toJson() => _$Response$ToJson(this);

  @JsonKey(name: 'status')
  final String? status;
  static const fromJsonFactory = _$Response$FromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Response$ &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(status) ^ runtimeType.hashCode;
}

extension $Response$Extension on Response$ {
  Response$ copyWith({String? status}) {
    return Response$(status: status ?? this.status);
  }

  Response$ copyWithWrapped({Wrapped<String?>? status}) {
    return Response$(status: (status != null ? status.value : this.status));
  }
}

String? taskDtoStateNullableToJson(enums.TaskDtoState? taskDtoState) {
  return taskDtoState?.value;
}

String? taskDtoStateToJson(enums.TaskDtoState taskDtoState) {
  return taskDtoState.value;
}

enums.TaskDtoState taskDtoStateFromJson(
  Object? taskDtoState, [
  enums.TaskDtoState? defaultValue,
]) {
  return enums.TaskDtoState.values
          .firstWhereOrNull((e) => e.value == taskDtoState) ??
      defaultValue ??
      enums.TaskDtoState.swaggerGeneratedUnknown;
}

enums.TaskDtoState? taskDtoStateNullableFromJson(
  Object? taskDtoState, [
  enums.TaskDtoState? defaultValue,
]) {
  if (taskDtoState == null) {
    return null;
  }
  return enums.TaskDtoState.values
          .firstWhereOrNull((e) => e.value == taskDtoState) ??
      defaultValue;
}

String taskDtoStateExplodedListToJson(List<enums.TaskDtoState>? taskDtoState) {
  return taskDtoState?.map((e) => e.value!).join(',') ?? '';
}

List<String> taskDtoStateListToJson(List<enums.TaskDtoState>? taskDtoState) {
  if (taskDtoState == null) {
    return [];
  }

  return taskDtoState.map((e) => e.value!).toList();
}

List<enums.TaskDtoState> taskDtoStateListFromJson(
  List? taskDtoState, [
  List<enums.TaskDtoState>? defaultValue,
]) {
  if (taskDtoState == null) {
    return defaultValue ?? [];
  }

  return taskDtoState.map((e) => taskDtoStateFromJson(e.toString())).toList();
}

List<enums.TaskDtoState>? taskDtoStateNullableListFromJson(
  List? taskDtoState, [
  List<enums.TaskDtoState>? defaultValue,
]) {
  if (taskDtoState == null) {
    return defaultValue;
  }

  return taskDtoState.map((e) => taskDtoStateFromJson(e.toString())).toList();
}

String? taskDtoPriorityNullableToJson(enums.TaskDtoPriority? taskDtoPriority) {
  return taskDtoPriority?.value;
}

String? taskDtoPriorityToJson(enums.TaskDtoPriority taskDtoPriority) {
  return taskDtoPriority.value;
}

enums.TaskDtoPriority taskDtoPriorityFromJson(
  Object? taskDtoPriority, [
  enums.TaskDtoPriority? defaultValue,
]) {
  return enums.TaskDtoPriority.values
          .firstWhereOrNull((e) => e.value == taskDtoPriority) ??
      defaultValue ??
      enums.TaskDtoPriority.swaggerGeneratedUnknown;
}

enums.TaskDtoPriority? taskDtoPriorityNullableFromJson(
  Object? taskDtoPriority, [
  enums.TaskDtoPriority? defaultValue,
]) {
  if (taskDtoPriority == null) {
    return null;
  }
  return enums.TaskDtoPriority.values
          .firstWhereOrNull((e) => e.value == taskDtoPriority) ??
      defaultValue;
}

String taskDtoPriorityExplodedListToJson(
    List<enums.TaskDtoPriority>? taskDtoPriority) {
  return taskDtoPriority?.map((e) => e.value!).join(',') ?? '';
}

List<String> taskDtoPriorityListToJson(
    List<enums.TaskDtoPriority>? taskDtoPriority) {
  if (taskDtoPriority == null) {
    return [];
  }

  return taskDtoPriority.map((e) => e.value!).toList();
}

List<enums.TaskDtoPriority> taskDtoPriorityListFromJson(
  List? taskDtoPriority, [
  List<enums.TaskDtoPriority>? defaultValue,
]) {
  if (taskDtoPriority == null) {
    return defaultValue ?? [];
  }

  return taskDtoPriority
      .map((e) => taskDtoPriorityFromJson(e.toString()))
      .toList();
}

List<enums.TaskDtoPriority>? taskDtoPriorityNullableListFromJson(
  List? taskDtoPriority, [
  List<enums.TaskDtoPriority>? defaultValue,
]) {
  if (taskDtoPriority == null) {
    return defaultValue;
  }

  return taskDtoPriority
      .map((e) => taskDtoPriorityFromJson(e.toString()))
      .toList();
}

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}

class Wrapped<T> {
  final T value;
  const Wrapped.value(this.value);
}
