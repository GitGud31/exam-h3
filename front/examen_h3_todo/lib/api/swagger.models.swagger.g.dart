// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swagger.models.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileDto _$ProfileDtoFromJson(Map<String, dynamic> json) => ProfileDto(
      id: (json['id'] as num?)?.toInt(),
      email: json['email'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      password: json['password'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      projects: (json['projects'] as List<dynamic>?)
              ?.map((e) => ProjectDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ProfileDtoToJson(ProfileDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'password': instance.password,
      'createdAt': instance.createdAt?.toIso8601String(),
      'projects': instance.projects?.map((e) => e.toJson()).toList(),
    };

ProjectDto _$ProjectDtoFromJson(Map<String, dynamic> json) => ProjectDto(
      id: (json['id'] as num?)?.toInt(),
      description: json['description'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      tasks: (json['tasks'] as List<dynamic>?)
              ?.map((e) => TaskDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ProjectDtoToJson(ProjectDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'createdAt': instance.createdAt?.toIso8601String(),
      'tasks': instance.tasks?.map((e) => e.toJson()).toList(),
    };

SubTaskDto _$SubTaskDtoFromJson(Map<String, dynamic> json) => SubTaskDto(
      id: (json['id'] as num?)?.toInt(),
      description: json['description'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      checked: json['checked'] as bool?,
    );

Map<String, dynamic> _$SubTaskDtoToJson(SubTaskDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'createdAt': instance.createdAt?.toIso8601String(),
      'checked': instance.checked,
    };

TaskDto _$TaskDtoFromJson(Map<String, dynamic> json) => TaskDto(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      state: taskDtoStateNullableFromJson(json['state']),
      priority: json['priority'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      deadline: json['deadline'] as String?,
      creator: json['creator'] == null
          ? null
          : ProfileDto.fromJson(json['creator'] as Map<String, dynamic>),
      subTasks: (json['subTasks'] as List<dynamic>?)
              ?.map((e) => SubTaskDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$TaskDtoToJson(TaskDto instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'state': taskDtoStateNullableToJson(instance.state),
      'priority': instance.priority,
      'createdAt': instance.createdAt?.toIso8601String(),
      'deadline': instance.deadline,
      'creator': instance.creator?.toJson(),
      'subTasks': instance.subTasks?.map((e) => e.toJson()).toList(),
    };

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      id: (json['id'] as num?)?.toInt(),
      email: json['email'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      password: json['password'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      projects: (json['projects'] as List<dynamic>?)
              ?.map((e) => Project.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'password': instance.password,
      'createdAt': instance.createdAt?.toIso8601String(),
      'projects': instance.projects?.map((e) => e.toJson()).toList(),
    };

Project _$ProjectFromJson(Map<String, dynamic> json) => Project(
      id: (json['id'] as num?)?.toInt(),
      profile: json['profile'] == null
          ? null
          : Profile.fromJson(json['profile'] as Map<String, dynamic>),
      tasks: (json['tasks'] as List<dynamic>?)
              ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      description: json['description'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
      'id': instance.id,
      'profile': instance.profile?.toJson(),
      'tasks': instance.tasks?.map((e) => e.toJson()).toList(),
      'description': instance.description,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

SubTask _$SubTaskFromJson(Map<String, dynamic> json) => SubTask(
      id: (json['id'] as num?)?.toInt(),
      description: json['description'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      task: json['task'] == null
          ? null
          : Task.fromJson(json['task'] as Map<String, dynamic>),
      checked: json['checked'] as bool?,
    );

Map<String, dynamic> _$SubTaskToJson(SubTask instance) => <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'createdAt': instance.createdAt?.toIso8601String(),
      'task': instance.task?.toJson(),
      'checked': instance.checked,
    };

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      id: (json['id'] as num?)?.toInt(),
      state: taskStateNullableFromJson(json['state']),
      project: json['project'] == null
          ? null
          : Project.fromJson(json['project'] as Map<String, dynamic>),
      creator: json['creator'] == null
          ? null
          : Profile.fromJson(json['creator'] as Map<String, dynamic>),
      subTasks: (json['subTasks'] as List<dynamic>?)
              ?.map((e) => SubTask.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      title: json['title'] as String?,
      description: json['description'] as String?,
      priority: json['priority'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      deadline: json['deadline'] as String?,
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'id': instance.id,
      'state': taskStateNullableToJson(instance.state),
      'project': instance.project?.toJson(),
      'creator': instance.creator?.toJson(),
      'subTasks': instance.subTasks?.map((e) => e.toJson()).toList(),
      'title': instance.title,
      'description': instance.description,
      'priority': instance.priority,
      'createdAt': instance.createdAt?.toIso8601String(),
      'deadline': instance.deadline,
    };
