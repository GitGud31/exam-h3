package com.h3hitema.examBack.dto;

import com.h3hitema.examBack.model.State;
import lombok.*;

import java.time.LocalDateTime;
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
    private String priority;
    private LocalDateTime createdAt;
    private String deadline;
    private ProfileDto creator;
    private Set<SubTaskDto> subTasks;
}
