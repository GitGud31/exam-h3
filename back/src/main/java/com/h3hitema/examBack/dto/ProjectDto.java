package com.h3hitema.examBack.dto;

import lombok.*;

import java.time.LocalDateTime;
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
    private Set<TaskDto> tasks;

}
