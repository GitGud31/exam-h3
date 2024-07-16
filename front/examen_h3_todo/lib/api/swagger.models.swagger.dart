// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

import 'swagger.enums.swagger.dart' as enums;

part 'swagger.models.swagger.g.dart';

@JsonSerializable(explicitToJson: true)
class ProfileDto {
  const ProfileDto({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.password,
    this.createdAt,
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
      List<ProjectDto>? projects}) {
    return ProfileDto(
        id: id ?? this.id,
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        password: password ?? this.password,
        createdAt: createdAt ?? this.createdAt,
        projects: projects ?? this.projects);
  }

  ProfileDto copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String?>? email,
      Wrapped<String?>? firstName,
      Wrapped<String?>? lastName,
      Wrapped<String?>? password,
      Wrapped<DateTime?>? createdAt,
      Wrapped<List<ProjectDto>?>? projects}) {
    return ProfileDto(
        id: (id != null ? id.value : this.id),
        email: (email != null ? email.value : this.email),
        firstName: (firstName != null ? firstName.value : this.firstName),
        lastName: (lastName != null ? lastName.value : this.lastName),
        password: (password != null ? password.value : this.password),
        createdAt: (createdAt != null ? createdAt.value : this.createdAt),
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
  @JsonKey(name: 'priority')
  final String? priority;
  @JsonKey(name: 'createdAt')
  final DateTime? createdAt;
  @JsonKey(name: 'deadline')
  final String? deadline;
  @JsonKey(name: 'creator')
  final ProfileDto? creator;
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
      const DeepCollectionEquality().hash(subTasks) ^
      runtimeType.hashCode;
}

extension $TaskDtoExtension on TaskDto {
  TaskDto copyWith(
      {int? id,
      String? title,
      String? description,
      enums.TaskDtoState? state,
      String? priority,
      DateTime? createdAt,
      String? deadline,
      ProfileDto? creator,
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
        subTasks: subTasks ?? this.subTasks);
  }

  TaskDto copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String?>? title,
      Wrapped<String?>? description,
      Wrapped<enums.TaskDtoState?>? state,
      Wrapped<String?>? priority,
      Wrapped<DateTime?>? createdAt,
      Wrapped<String?>? deadline,
      Wrapped<ProfileDto?>? creator,
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
        subTasks: (subTasks != null ? subTasks.value : this.subTasks));
  }
}

@JsonSerializable(explicitToJson: true)
class Profile {
  const Profile({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.password,
    this.createdAt,
    this.projects,
  });

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  static const toJsonFactory = _$ProfileToJson;
  Map<String, dynamic> toJson() => _$ProfileToJson(this);

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
  @JsonKey(name: 'projects', defaultValue: <Project>[])
  final List<Project>? projects;
  static const fromJsonFactory = _$ProfileFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Profile &&
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
      const DeepCollectionEquality().hash(projects) ^
      runtimeType.hashCode;
}

extension $ProfileExtension on Profile {
  Profile copyWith(
      {int? id,
      String? email,
      String? firstName,
      String? lastName,
      String? password,
      DateTime? createdAt,
      List<Project>? projects}) {
    return Profile(
        id: id ?? this.id,
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        password: password ?? this.password,
        createdAt: createdAt ?? this.createdAt,
        projects: projects ?? this.projects);
  }

  Profile copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String?>? email,
      Wrapped<String?>? firstName,
      Wrapped<String?>? lastName,
      Wrapped<String?>? password,
      Wrapped<DateTime?>? createdAt,
      Wrapped<List<Project>?>? projects}) {
    return Profile(
        id: (id != null ? id.value : this.id),
        email: (email != null ? email.value : this.email),
        firstName: (firstName != null ? firstName.value : this.firstName),
        lastName: (lastName != null ? lastName.value : this.lastName),
        password: (password != null ? password.value : this.password),
        createdAt: (createdAt != null ? createdAt.value : this.createdAt),
        projects: (projects != null ? projects.value : this.projects));
  }
}

@JsonSerializable(explicitToJson: true)
class Project {
  const Project({
    this.id,
    this.profile,
    this.tasks,
    this.description,
    this.createdAt,
  });

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  static const toJsonFactory = _$ProjectToJson;
  Map<String, dynamic> toJson() => _$ProjectToJson(this);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'profile')
  final Profile? profile;
  @JsonKey(name: 'tasks', defaultValue: <Task>[])
  final List<Task>? tasks;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'createdAt')
  final DateTime? createdAt;
  static const fromJsonFactory = _$ProjectFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Project &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.profile, profile) ||
                const DeepCollectionEquality()
                    .equals(other.profile, profile)) &&
            (identical(other.tasks, tasks) ||
                const DeepCollectionEquality().equals(other.tasks, tasks)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(profile) ^
      const DeepCollectionEquality().hash(tasks) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(createdAt) ^
      runtimeType.hashCode;
}

extension $ProjectExtension on Project {
  Project copyWith(
      {int? id,
      Profile? profile,
      List<Task>? tasks,
      String? description,
      DateTime? createdAt}) {
    return Project(
        id: id ?? this.id,
        profile: profile ?? this.profile,
        tasks: tasks ?? this.tasks,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt);
  }

  Project copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<Profile?>? profile,
      Wrapped<List<Task>?>? tasks,
      Wrapped<String?>? description,
      Wrapped<DateTime?>? createdAt}) {
    return Project(
        id: (id != null ? id.value : this.id),
        profile: (profile != null ? profile.value : this.profile),
        tasks: (tasks != null ? tasks.value : this.tasks),
        description:
            (description != null ? description.value : this.description),
        createdAt: (createdAt != null ? createdAt.value : this.createdAt));
  }
}

@JsonSerializable(explicitToJson: true)
class SubTask {
  const SubTask({
    this.id,
    this.description,
    this.createdAt,
    this.task,
    this.checked,
  });

  factory SubTask.fromJson(Map<String, dynamic> json) =>
      _$SubTaskFromJson(json);

  static const toJsonFactory = _$SubTaskToJson;
  Map<String, dynamic> toJson() => _$SubTaskToJson(this);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'createdAt')
  final DateTime? createdAt;
  @JsonKey(name: 'task')
  final Task? task;
  @JsonKey(name: 'checked')
  final bool? checked;
  static const fromJsonFactory = _$SubTaskFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is SubTask &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.task, task) ||
                const DeepCollectionEquality().equals(other.task, task)) &&
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
      const DeepCollectionEquality().hash(task) ^
      const DeepCollectionEquality().hash(checked) ^
      runtimeType.hashCode;
}

extension $SubTaskExtension on SubTask {
  SubTask copyWith(
      {int? id,
      String? description,
      DateTime? createdAt,
      Task? task,
      bool? checked}) {
    return SubTask(
        id: id ?? this.id,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        task: task ?? this.task,
        checked: checked ?? this.checked);
  }

  SubTask copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<String?>? description,
      Wrapped<DateTime?>? createdAt,
      Wrapped<Task?>? task,
      Wrapped<bool?>? checked}) {
    return SubTask(
        id: (id != null ? id.value : this.id),
        description:
            (description != null ? description.value : this.description),
        createdAt: (createdAt != null ? createdAt.value : this.createdAt),
        task: (task != null ? task.value : this.task),
        checked: (checked != null ? checked.value : this.checked));
  }
}

@JsonSerializable(explicitToJson: true)
class Task {
  const Task({
    this.id,
    this.state,
    this.project,
    this.creator,
    this.subTasks,
    this.title,
    this.description,
    this.priority,
    this.createdAt,
    this.deadline,
  });

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  static const toJsonFactory = _$TaskToJson;
  Map<String, dynamic> toJson() => _$TaskToJson(this);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(
    name: 'state',
    toJson: taskStateNullableToJson,
    fromJson: taskStateNullableFromJson,
  )
  final enums.TaskState? state;
  @JsonKey(name: 'project')
  final Project? project;
  @JsonKey(name: 'creator')
  final Profile? creator;
  @JsonKey(name: 'subTasks', defaultValue: <SubTask>[])
  final List<SubTask>? subTasks;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'priority')
  final String? priority;
  @JsonKey(name: 'createdAt')
  final DateTime? createdAt;
  @JsonKey(name: 'deadline')
  final String? deadline;
  static const fromJsonFactory = _$TaskFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Task &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.project, project) ||
                const DeepCollectionEquality()
                    .equals(other.project, project)) &&
            (identical(other.creator, creator) ||
                const DeepCollectionEquality()
                    .equals(other.creator, creator)) &&
            (identical(other.subTasks, subTasks) ||
                const DeepCollectionEquality()
                    .equals(other.subTasks, subTasks)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.priority, priority) ||
                const DeepCollectionEquality()
                    .equals(other.priority, priority)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.deadline, deadline) ||
                const DeepCollectionEquality()
                    .equals(other.deadline, deadline)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(project) ^
      const DeepCollectionEquality().hash(creator) ^
      const DeepCollectionEquality().hash(subTasks) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(priority) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(deadline) ^
      runtimeType.hashCode;
}

extension $TaskExtension on Task {
  Task copyWith(
      {int? id,
      enums.TaskState? state,
      Project? project,
      Profile? creator,
      List<SubTask>? subTasks,
      String? title,
      String? description,
      String? priority,
      DateTime? createdAt,
      String? deadline}) {
    return Task(
        id: id ?? this.id,
        state: state ?? this.state,
        project: project ?? this.project,
        creator: creator ?? this.creator,
        subTasks: subTasks ?? this.subTasks,
        title: title ?? this.title,
        description: description ?? this.description,
        priority: priority ?? this.priority,
        createdAt: createdAt ?? this.createdAt,
        deadline: deadline ?? this.deadline);
  }

  Task copyWithWrapped(
      {Wrapped<int?>? id,
      Wrapped<enums.TaskState?>? state,
      Wrapped<Project?>? project,
      Wrapped<Profile?>? creator,
      Wrapped<List<SubTask>?>? subTasks,
      Wrapped<String?>? title,
      Wrapped<String?>? description,
      Wrapped<String?>? priority,
      Wrapped<DateTime?>? createdAt,
      Wrapped<String?>? deadline}) {
    return Task(
        id: (id != null ? id.value : this.id),
        state: (state != null ? state.value : this.state),
        project: (project != null ? project.value : this.project),
        creator: (creator != null ? creator.value : this.creator),
        subTasks: (subTasks != null ? subTasks.value : this.subTasks),
        title: (title != null ? title.value : this.title),
        description:
            (description != null ? description.value : this.description),
        priority: (priority != null ? priority.value : this.priority),
        createdAt: (createdAt != null ? createdAt.value : this.createdAt),
        deadline: (deadline != null ? deadline.value : this.deadline));
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

String? taskStateNullableToJson(enums.TaskState? taskState) {
  return taskState?.value;
}

String? taskStateToJson(enums.TaskState taskState) {
  return taskState.value;
}

enums.TaskState taskStateFromJson(
  Object? taskState, [
  enums.TaskState? defaultValue,
]) {
  return enums.TaskState.values.firstWhereOrNull((e) => e.value == taskState) ??
      defaultValue ??
      enums.TaskState.swaggerGeneratedUnknown;
}

enums.TaskState? taskStateNullableFromJson(
  Object? taskState, [
  enums.TaskState? defaultValue,
]) {
  if (taskState == null) {
    return null;
  }
  return enums.TaskState.values.firstWhereOrNull((e) => e.value == taskState) ??
      defaultValue;
}

String taskStateExplodedListToJson(List<enums.TaskState>? taskState) {
  return taskState?.map((e) => e.value!).join(',') ?? '';
}

List<String> taskStateListToJson(List<enums.TaskState>? taskState) {
  if (taskState == null) {
    return [];
  }

  return taskState.map((e) => e.value!).toList();
}

List<enums.TaskState> taskStateListFromJson(
  List? taskState, [
  List<enums.TaskState>? defaultValue,
]) {
  if (taskState == null) {
    return defaultValue ?? [];
  }

  return taskState.map((e) => taskStateFromJson(e.toString())).toList();
}

List<enums.TaskState>? taskStateNullableListFromJson(
  List? taskState, [
  List<enums.TaskState>? defaultValue,
]) {
  if (taskState == null) {
    return defaultValue;
  }

  return taskState.map((e) => taskStateFromJson(e.toString())).toList();
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
