import 'package:json_annotation/json_annotation.dart';

enum TaskDtoState {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('TODO')
  todo('TODO'),
  @JsonValue('IN_PROGRESS')
  inProgress('IN_PROGRESS'),
  @JsonValue('DONE')
  done('DONE');

  final String? value;

  const TaskDtoState(this.value);
}

enum TaskDtoPriority {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('LOW')
  low('LOW'),
  @JsonValue('NORMAL')
  normal('NORMAL'),
  @JsonValue('HIGH')
  high('HIGH');

  final String? value;

  const TaskDtoPriority(this.value);
}
