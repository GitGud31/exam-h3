package com.h3hitema.examBack.repository;

import com.h3hitema.examBack.model.Project;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProjectRepository extends JpaRepository<Project,Long> {

    List<Project> findAllByProfile_Email(String email);
}
