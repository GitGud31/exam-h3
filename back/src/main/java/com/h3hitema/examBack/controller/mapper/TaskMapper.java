package com.h3hitema.examBack.controller.mapper;

import com.h3hitema.examBack.dto.TaskDto;
import com.h3hitema.examBack.model.Task;

public class TaskMapper {

    public static TaskDto toDto(Task task){
        return TaskDto.builder()
                .description(task.getDescription())
                .title(task.getTitle())
                .state(task.getState())
                .deadline(task.getDeadline())
                .id(task.getId())
                .build();
    }

    public static Task toEntity(TaskDto dto){
        return Task.builder()
                .description(dto.getDescription())
                .title(dto.getTitle())
                .state(dto.getState())
                .deadline(dto.getDeadline())
                .build();
    }
}
