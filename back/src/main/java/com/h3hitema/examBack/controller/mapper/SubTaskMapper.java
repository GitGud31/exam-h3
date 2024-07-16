package com.h3hitema.examBack.controller.mapper;

import com.h3hitema.examBack.dto.SubTaskDto;
import com.h3hitema.examBack.model.SubTask;

public class SubTaskMapper {

    public static SubTaskDto toDto(SubTask subTask){
        return SubTaskDto.builder()
                .description(subTask.getDescription())
                .isChecked(subTask.isChecked())
                .id(subTask.getId())
                .build();
    }

    public static SubTask toEntity(SubTaskDto dto){
        return SubTask.builder()
                .description(dto.getDescription())
                .isChecked(dto.isChecked())
                .build();
    }
}
