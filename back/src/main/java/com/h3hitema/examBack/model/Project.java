package com.h3hitema.examBack.model;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;
import java.util.Set;

@Entity
@Table
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Project {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)

    @ManyToOne
    @JoinTable(
            name = "project_user",
            joinColumns = @JoinColumn(name = "project_id"),
            inverseJoinColumns = @JoinColumn(name = "user_id")
    )
    private Profile profile;

    @OneToMany(mappedBy = "project")
    private Set<Task> tasks;
    private Long id;
    private String description;
    private LocalDateTime createdAt;

    public Project updateProject(Project project){
        this.description = project.getDescription();
        return this;
    }
}