package com.h3hitema.examBack.service;


import static org.mockito.Mockito.*;
import static org.junit.jupiter.api.Assertions.*;

import java.util.List;
import java.util.Optional;
import java.util.Arrays;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.dao.OptimisticLockingFailureException;

import com.h3hitema.examBack.model.Profile;
import com.h3hitema.examBack.model.Project;
import com.h3hitema.examBack.repository.ProjectRepository;
import com.h3hitema.examBack.service.ProfileService;
import com.h3hitema.examBack.service.ProjectService;

@SpringBootTest
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
public class ProjectServiceTest {

    @Autowired
    private ProjectService projectService;

    @MockBean
    private ProjectRepository projectRepository;

    @MockBean
    private ProfileService profileService;

    private Profile profile;
    private Project project;

    @BeforeEach
    public void setUp() {
        profile = new Profile();
        profile.setEmail("test@example.com");

        project = new Project();
        project.setId(1L);
        project.setDescription("Test Project");
        project.setProfile(profile);
        project.setVersion(1);
    }

    @Test
    public void testGetAllProjectsForUser() {
        when(projectRepository.findAllByProfile_Email(profile.getEmail())).thenReturn(Arrays.asList(project));

        List<Project> projects = projectService.getAllProjectsForUser(profile.getEmail());

        assertNotNull(projects);
        assertFalse(projects.isEmpty());
        assertEquals(1, projects.size());
        assertEquals("Test Project", projects.get(0).getDescription());
        verify(projectRepository).findAllByProfile_Email(profile.getEmail());
    }

    @Test
    public void testGetProjectById() {
        when(projectRepository.findById(project.getId())).thenReturn(Optional.of(project));

        Project foundProject = projectService.getProjectById(project.getId());

        assertNotNull(foundProject);
        assertEquals("Test Project", foundProject.getDescription());
        verify(projectRepository).findById(project.getId());
    }

    @Test
    public void testCreateProject() {
        when(profileService.getProfileByEmail(profile.getEmail())).thenReturn(profile);
        when(projectRepository.save(any(Project.class))).thenReturn(project);

        Project newProject = new Project();
        newProject.setDescription("New Project");

        Project createdProject = projectService.createProject(profile.getEmail(), newProject);

        assertNotNull(createdProject);
        assertEquals(profile, createdProject.getProfile());
        verify(profileService).getProfileByEmail(profile.getEmail());
        verify(projectRepository).save(any(Project.class));
    }

    @Test
    public void testUpdateProject() {
        Project updatedProjectDetails = new Project();
        updatedProjectDetails.setId(project.getId());
        updatedProjectDetails.setDescription("Updated Project");
        updatedProjectDetails.setVersion(1);

        when(projectRepository.findById(project.getId())).thenReturn(Optional.of(project));
        when(projectRepository.save(any(Project.class))).thenReturn(project);

        Project updatedProject = projectService.updateProject(project.getId(), updatedProjectDetails);

        assertNotNull(updatedProject);
        assertEquals("Updated Project", updatedProject.getDescription());
        verify(projectRepository).findById(project.getId());
        verify(projectRepository).save(any(Project.class));
    }

    @Test
    public void testUpdateProjectOptimisticLockingFailure() {
        Project updatedProjectDetails = new Project();
        updatedProjectDetails.setId(project.getId());
        updatedProjectDetails.setDescription("Updated Project");
        updatedProjectDetails.setVersion(2); // different version

        when(projectRepository.findById(project.getId())).thenReturn(Optional.of(project));

        Exception exception = assertThrows(OptimisticLockingFailureException.class, () -> {
            projectService.updateProject(project.getId(), updatedProjectDetails);
        });

        assertEquals("Conflict", exception.getMessage());
        verify(projectRepository).findById(project.getId());
    }

    @Test
    public void testDeleteProject() {
        when(projectRepository.findById(project.getId())).thenReturn(Optional.of(project));

        projectService.deleteProject(project.getId());

        verify(projectRepository).findById(project.getId());
        verify(projectRepository).delete(any(Project.class));
    }
}
