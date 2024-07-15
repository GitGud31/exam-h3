package com.h3hitema.examBack.service;

import com.h3hitema.examBack.model.Project;
import com.h3hitema.examBack.repository.ProjectRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProjectService {
    @Autowired
    private ProjectRepository projectRepository;

    public List<Project> getAllProjects() {
        return projectRepository.findAll();
    }

    public Project getProjectById(Long id) {
        return projectRepository.findById(id).orElse(null);
    }

    public Project saveProject(Project project) {
        return projectRepository.save(project);
    }

    public Project updateProject(Long id, Project projectDetails) {
        return projectRepository.findById(id)
                .map(project -> {
                    project.setDescription(projectDetails.getDescription());
                    project.setCreatedAt(projectDetails.getCreatedAt());
                    return projectRepository.save(project);
                })
                .orElseGet(() -> {
                    projectDetails.setId(id);
                    return projectRepository.save(projectDetails);
                });
    }

    public void deleteProject(Long id) {
        projectRepository.deleteById(id);
    }
}

