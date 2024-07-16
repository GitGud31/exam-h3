package com.h3hitema.examBack.dto;


import lombok.*;

import java.time.LocalDateTime;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SubTaskDto {
    private Long id;

    private String description;
    private boolean isChecked;
    private LocalDateTime createdAt;

}
