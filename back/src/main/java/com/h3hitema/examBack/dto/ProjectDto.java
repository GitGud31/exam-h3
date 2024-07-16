package com.h3hitema.examBack.dto;

import lombok.*;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ProjectDto {
    private Long id;
    private String description;
    private LocalDateTime createdAt;
    @Builder.Default
    private Set<TaskDto> tasks = new HashSet<>();;
}
