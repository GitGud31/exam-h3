package com.h3hitema.examBack.controller;

import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.h3hitema.examBack.dto.ProjectDto;
import com.h3hitema.examBack.model.Project;
import com.h3hitema.examBack.service.ProjectService;
import com.h3hitema.examBack.controller.mapper.ProjectMapper;
import com.h3hitema.examBack.config.SecurityUtils;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.*;


import java.util.Arrays;

@WebMvcTest(ProjectController.class)
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
public class ProjectControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private ProjectService projectService;

    @MockBean
    private SecurityUtils securityUtils;

    private Project project;
    private ProjectDto projectDto;

    @BeforeEach
    public void setUp() {
        project = new Project();
        project.setId(1L);
        project.setDescription("Test Project");

        projectDto = new ProjectDto();
        projectDto.setId(1L);
        projectDto.setDescription("Test Project");
    }

    @Test
    @WithMockUser
    public void testGetAllProjectsForUser() throws Exception {
        String currentUserLogin = "test@example.com";
        when(SecurityUtils.getCurrentUserLogin()).thenReturn(currentUserLogin);
        when(projectService.getAllProjectsForUser(currentUserLogin)).thenReturn(Arrays.asList(project));

        mockMvc.perform(MockMvcRequestBuilders.get("/profiles/projects")
                        .header("Authorization", "Bearer token"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$[0].name").value("Test Project"));

        verify(projectService).getAllProjectsForUser(currentUserLogin);
    }

    @Test
    @WithMockUser
    public void testGetProjectById() throws Exception {
        when(projectService.getProjectById(project.getId())).thenReturn(project);

        mockMvc.perform(MockMvcRequestBuilders.get("/profiles/projects/{id}", project.getId())
                        .header("Authorization", "Bearer token"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.name").value("Test Project"));

        verify(projectService).getProjectById(project.getId());
    }

    @Test
    @WithMockUser
    public void testCreateProject() throws Exception {
        String currentUserLogin = "test@example.com";
        when(SecurityUtils.getCurrentUserLogin()).thenReturn(currentUserLogin);
        when(projectService.createProject(currentUserLogin, ProjectMapper.toEntity(projectDto))).thenReturn(project);

        mockMvc.perform(MockMvcRequestBuilders.post("/profiles/projects")
                        .header("Authorization", "Bearer token")
                        .contentType("application/json")
                        .content(new ObjectMapper().writeValueAsString(projectDto)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.name").value("Test Project"));

        verify(projectService).createProject(currentUserLogin, ProjectMapper.toEntity(projectDto));
    }

    @Test
    @WithMockUser
    public void testUpdateProject() throws Exception {
        when(projectService.updateProject(project.getId(), ProjectMapper.toEntity(projectDto))).thenReturn(project);

        mockMvc.perform(MockMvcRequestBuilders.put("/profiles/projects/{idProject}", project.getId())
                        .header("Authorization", "Bearer token")
                        .contentType("application/json")
                        .content(new ObjectMapper().writeValueAsString(projectDto)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.name").value("Test Project"));

        verify(projectService).updateProject(project.getId(), ProjectMapper.toEntity(projectDto));
    }

    @Test
    @WithMockUser
    public void testDeleteProject() throws Exception {
        doNothing().when(projectService).deleteProject(project.getId());

        mockMvc.perform(MockMvcRequestBuilders.delete("/profiles/projects/{id}", project.getId())
                        .header("Authorization", "Bearer token"))
                .andExpect(status().isOk());

        verify(projectService).deleteProject(project.getId());
    }
}

