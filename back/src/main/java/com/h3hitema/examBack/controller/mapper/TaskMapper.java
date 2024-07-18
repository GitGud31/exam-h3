package com.h3hitema.examBack.controller.mapper;

import com.h3hitema.examBack.dto.TaskDto;
import com.h3hitema.examBack.model.Task;

import java.util.stream.Collectors;

public class TaskMapper {

    public static TaskDto toDto(Task task){
        return TaskDto.builder()
                .description(task.getDescription())
                .title(task.getTitle())
                .state(task.getState())
                .deadline(task.getDeadline())
                .id(task.getId())
                .version(task.getVersion())
                .priority(task.getPriority())
                .subTasks(task.getSubTasks().stream().map(SubTaskMapper::toDto).collect(Collectors.toSet()))
                .build();
    }

    public static Task toEntity(TaskDto dto){
        Task entity = Task.builder()
                .description(dto.getDescription())
                .title(dto.getTitle())
                .state(dto.getState())
                .deadline(dto.getDeadline())
                .priority(dto.getPriority())
                .subTasks(dto.getSubTasks().stream().map(SubTaskMapper::toEntity).collect(Collectors.toSet()))
                .build();
        entity.setVersion(dto.getVersion());
        return entity;
    }
}
