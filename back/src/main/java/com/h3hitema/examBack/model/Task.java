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
public class Task {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

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
    private LocalDateTime createdAt;
    private String deadline;

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