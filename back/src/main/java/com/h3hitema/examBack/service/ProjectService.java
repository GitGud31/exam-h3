package com.h3hitema.examBack.service;

import com.h3hitema.examBack.model.Profile;
import com.h3hitema.examBack.model.Project;
import com.h3hitema.examBack.repository.ProjectRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional(rollbackOn = Exception.class)
public class ProjectService {

    private final ProjectRepository projectRepository;
    private final ProfileService profileService;
    public List<Project> getAllProjects() {
        return projectRepository.findAll();
    }

    public Project getProjectById(Long id) {
        return projectRepository.findById(id).orElseThrow();
    }

    public Project saveProject(Long idProfile, Project project) {
        if (projectRepository.existsById(project.getId())) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Project already exists !");
        }
        Profile currentProfile = profileService.getProfileById(idProfile);
        // currentProfile.getProjects().add(project);
        project.setProfile(currentProfile);
        return projectRepository.save(project);
    }

    public Project updateProject(Long id, Project projectDetails) {
        return projectRepository.save(this.getProjectById(id).updateProject(projectDetails));
    }

    public void deleteProject(Long id) {
        projectRepository.deleteById(id);
    }
}

