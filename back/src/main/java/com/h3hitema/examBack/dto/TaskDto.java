package com.h3hitema.examBack.dto;

import com.h3hitema.examBack.model.enums.State;
import com.h3hitema.examBack.model.enums.TaskPriority;
import lombok.*;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TaskDto {
    private Long id;
    private String title;
    private String description;
    private State state;
    private TaskPriority priority;
    private LocalDateTime createdAt;
    private LocalDateTime deadline;
    private ProfileDto creator;
    @Builder.Default
    private Set<SubTaskDto> subTasks = new HashSet<>();;
}
