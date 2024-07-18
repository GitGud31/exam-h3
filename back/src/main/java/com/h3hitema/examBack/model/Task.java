package com.h3hitema.examBack.model;

import com.h3hitema.examBack.model.commun.AbstractEntity;
import com.h3hitema.examBack.model.enums.State;
import com.h3hitema.examBack.model.enums.TaskPriority;
import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;


@Entity
@Table
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Task extends AbstractEntity {
    @Enumerated(EnumType.STRING)
    private State state;

    @ManyToOne
    @JoinColumn(name = "project_id")
    private Project project;

    @ManyToOne
    @JoinColumn(name = "creator_id")
    private Profile creator;

    @OneToMany(mappedBy = "task", cascade = CascadeType.ALL)
    private Set<SubTask> subTasks;

    @Enumerated(EnumType.STRING)
    private TaskPriority priority;

    private String title;
    private String description;
    private LocalDateTime deadline;

    @ManyToMany
    @JoinTable(
            name = "task_guests",
            joinColumns = @JoinColumn(name = "task_guest_id"),
            inverseJoinColumns = @JoinColumn(name = "id")
    )
    @Builder.Default
    private List<Profile> taskGuests = new ArrayList<>();

    public Task updateTask(Task task) {
        this.description = task.getDescription();
        this.title = task.getTitle();
        this.priority = task.getPriority();
        this.deadline = task.getDeadline();
        this.state = task.getState();
        return this;
    }

}