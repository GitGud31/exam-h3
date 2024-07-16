package com.h3hitema.examBack.controller.mapper;

import com.h3hitema.examBack.dto.ProjectDto;
import com.h3hitema.examBack.model.Project;

public class ProjectMapper {

    public static ProjectDto toDto(Project entity) {
        return ProjectDto.builder()
                .description(entity.getDescription())
                .createdAt(entity.getCreatedAt())
                .id(entity.getId())
                .build();
    }

    public static Project toEntity(ProjectDto dto) {
        return Project.builder()
                .id(dto.getId())
                .description(dto.getDescription())
                .createdAt(dto.getCreatedAt())
                .build();
    }
}
