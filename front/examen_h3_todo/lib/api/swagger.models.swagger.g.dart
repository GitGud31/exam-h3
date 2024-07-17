// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swagger.models.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorInfo _$ErrorInfoFromJson(Map<String, dynamic> json) => ErrorInfo(
      url: json['url'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ErrorInfoToJson(ErrorInfo instance) => <String, dynamic>{
      'url': instance.url,
      'message': instance.message,
    };

ProfileDto _$ProfileDtoFromJson(Map<String, dynamic> json) => ProfileDto(
      id: (json['id'] as num?)?.toInt(),
      email: json['email'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      password: json['password'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      version: (json['version'] as num?)?.toInt(),
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
      'version': instance.version,
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
      priority: taskDtoPriorityNullableFromJson(json['priority']),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      deadline: json['deadline'] == null
          ? null
          : DateTime.parse(json['deadline'] as String),
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
      'priority': taskDtoPriorityNullableToJson(instance.priority),
      'createdAt': instance.createdAt?.toIso8601String(),
      'deadline': instance.deadline?.toIso8601String(),
      'creator': instance.creator?.toJson(),
      'subTasks': instance.subTasks?.map((e) => e.toJson()).toList(),
    };

ProfileForgetPwdDto _$ProfileForgetPwdDtoFromJson(Map<String, dynamic> json) =>
    ProfileForgetPwdDto(
      email: json['email'] as String?,
      code: json['code'] as String?,
      newPwd: json['newPwd'] as String?,
    );

Map<String, dynamic> _$ProfileForgetPwdDtoToJson(
        ProfileForgetPwdDto instance) =>
    <String, dynamic>{
      'email': instance.email,
      'code': instance.code,
      'newPwd': instance.newPwd,
    };

Response$ _$Response$FromJson(Map<String, dynamic> json) => Response$(
      status: json['status'] as String?,
    );

Map<String, dynamic> _$Response$ToJson(Response$ instance) => <String, dynamic>{
      'status': instance.status,
    };
