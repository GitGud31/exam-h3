package com.h3hitema.examBack.model;

import com.h3hitema.examBack.model.commun.AbstractEntity;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.*;


@Entity
@Table
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SubTask extends AbstractEntity {
    private String description;
    private boolean isChecked;
    @ManyToOne
    @JoinColumn(name = "task_id")
    private Task task;

    public SubTask updateSubTask(SubTask subTask){
        this.description = subTask.getDescription();
        this.isChecked = subTask.isChecked;
        return this;
    }
}