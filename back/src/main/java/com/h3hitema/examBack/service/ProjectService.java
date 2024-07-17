package com.h3hitema.examBack.service;

import com.h3hitema.examBack.model.Profile;
import com.h3hitema.examBack.model.Project;
import com.h3hitema.examBack.repository.ProjectRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.dao.OptimisticLockingFailureException;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

@Service
@RequiredArgsConstructor
@Transactional(rollbackOn = Exception.class)
public class ProjectService {

    private final ProjectRepository projectRepository;
    private final ProfileService profileService;
    public List<Project> getAllProjectsForUser(String email) {
        return projectRepository.findAllByProfile_Email(email);
    }

    public Project getProjectById(Long id) {
        return projectRepository.findById(id).orElseThrow();
    }

    public Project createProject(String currentUserLogin, Project project) {
        Profile currentProfile = profileService.getProfileByEmail(currentUserLogin);
        project.setProfile(currentProfile);
        return projectRepository.save(project);
    }

    public Project updateProject(Long id, Project projectDetails) {
        Project project = this.getProjectById(id);
        if (!Objects.equals(project.getVersion(), projectDetails.getVersion())) {
            throw new OptimisticLockingFailureException("Conflict");
        }
        return projectRepository.save(project.updateProject(projectDetails));
    }

    public void deleteProject(Long id) {
        Project project = getProjectById(id);
        project.setProfile(null);
        projectRepository.delete(project);
    }
}

