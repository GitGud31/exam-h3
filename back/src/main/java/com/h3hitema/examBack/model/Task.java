package com.h3hitema.examBack.model;

import com.h3hitema.examBack.model.commun.AbstractEntity;
import com.h3hitema.examBack.model.enums.State;
import jakarta.persistence.*;
import lombok.*;

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
public class Task  extends AbstractEntity {
    @Enumerated(EnumType.STRING)
    private State state;

    @ManyToOne
    @JoinColumn(name = "project_id")
    private Project project;

    @ManyToOne
    @JoinColumn(name = "creator_id")
    private Profile creator;

    @OneToMany(mappedBy = "task")
    private Set<SubTask> subTasks;

    private String title;
    private String description;
    private String priority;
    private String deadline;

    @ManyToMany
    @JoinTable(
            name = "task_guests",
            joinColumns = @JoinColumn(name = "task_guest_id"),
            inverseJoinColumns = @JoinColumn(name = "id")
    )
    @Builder.Default
    private List<Profile> taskGuests = new ArrayList<>();

    //TODO
    public Task updateTask(Task task){
        this.description = task.getDescription();
        this.title = task.getTitle();
        this.priority = task.getPriority();
        this.deadline = task.getDeadline();
        this.state = task.getState();
        return this;
    }

}