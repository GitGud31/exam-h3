package com.h3hitema.examBack.controller.mapper;

import com.h3hitema.examBack.dto.ProfileDto;
import com.h3hitema.examBack.model.Profile;

import java.util.stream.Collectors;

public class ProfileMapper {

    public static ProfileDto toDto(Profile entity) {
        return ProfileDto.builder()
                .id(entity.getId())
                .firstName(entity.getFirstName())
                .lastName(entity.getLastName())
                .email(entity.getEmail())
                .password(entity.getPassword())
                .createdAt(entity.getCreatedAt())
                .projects(entity.getProjects().stream().map(ProjectMapper::toDto).collect(Collectors.toSet()))
                .build();
    }

    public static Profile toEntity(ProfileDto dto) {
        return Profile.builder()
                .id(dto.getId())
                .firstName(dto.getFirstName())
                .lastName(dto.getLastName())
                .email(dto.getEmail())
                .password(dto.getPassword())
                .createdAt(dto.getCreatedAt())
                .projects(dto.getProjects().stream().map(ProjectMapper::toEntity).collect(Collectors.toSet()))
                .build();
    }
}
