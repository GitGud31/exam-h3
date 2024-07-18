package com.h3hitema.examBack.repository;

import com.h3hitema.examBack.model.Task;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TaskRepository extends JpaRepository<Task,Long> {

    List<Task> findAllByProject_Id(Long projectId);
}
