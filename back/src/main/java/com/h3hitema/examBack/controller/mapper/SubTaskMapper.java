package com.h3hitema.examBack.controller.mapper;

import com.h3hitema.examBack.dto.SubTaskDto;
import com.h3hitema.examBack.model.SubTask;

public class SubTaskMapper {

    public static SubTaskDto toDto(SubTask subTask){
        return SubTaskDto.builder()
                .description(subTask.getDescription())
                .isChecked(subTask.isChecked())
                .createdAt(subTask.getCreatedAt())
                .id(subTask.getId())
                .build();
    }

    public static SubTask toEntity(SubTaskDto dto){
        return SubTask.builder()
                .description(dto.getDescription())
                .createdAt(dto.getCreatedAt())
                .isChecked(dto.isChecked())
                .id(dto.getId())
                .build();
    }
}
