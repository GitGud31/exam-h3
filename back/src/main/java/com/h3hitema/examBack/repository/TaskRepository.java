package com.h3hitema.examBack.repository;

import com.h3hitema.examBack.model.Task;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TaskRepository extends JpaRepository<Task,Long> {
}
