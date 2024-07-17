package com.h3hitema.examBack.model;

import com.h3hitema.examBack.model.commun.AbstractEntity;
import jakarta.persistence.*;
import lombok.*;

import java.util.HashSet;
import java.util.Set;

@Entity
@Table
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Project extends AbstractEntity {

    @ManyToOne
    @JoinTable(
            name = "project_profile",
            joinColumns = @JoinColumn(name = "project_id"),
            inverseJoinColumns = @JoinColumn(name = "profile_id")

    )
    private Profile profile;

    @OneToMany(mappedBy = "project")
    @Builder.Default
    private Set<Task> tasks = new HashSet<>();
    private String description;

    public Project updateProject(Project project){
        this.description = project.getDescription();
        return this;
    }
}