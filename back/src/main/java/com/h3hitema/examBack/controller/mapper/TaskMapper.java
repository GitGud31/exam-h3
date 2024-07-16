package com.h3hitema.examBack.controller.mapper;

import com.h3hitema.examBack.dto.TaskDto;
import com.h3hitema.examBack.model.Task;

public class TaskMapper {

    public static TaskDto toDto(Task task){
        return TaskDto.builder()
                .description(task.getDescription())
                .createdAt(task.getCreatedAt())
                .id(task.getId())
                .build();
    }

    public static Task toEntity(TaskDto dto){
        return Task.builder()
                .description(dto.getDescription())
                .createdAt(dto.getCreatedAt())
                .id(dto.getId())
                .build();
    }
}
