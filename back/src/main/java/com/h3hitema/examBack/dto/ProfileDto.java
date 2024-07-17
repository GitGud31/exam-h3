package com.h3hitema.examBack.dto;

import jakarta.validation.constraints.Email;
import lombok.*;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ProfileDto {
    private Long id;
    @Email(message = "Email not correct")
    private String email;
    private String firstName;
    private String lastName;
    private String password;
    private LocalDateTime createdAt;
    private Integer version;
    @Builder.Default
    private Set<ProjectDto> projects = new HashSet<>();
}
