package com.h3hitema.examBack.controller;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.h3hitema.examBack.config.SecurityUtils;
import com.h3hitema.examBack.dto.ProjectDto;
import com.h3hitema.examBack.model.Project;
import com.h3hitema.examBack.service.ProjectService;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import java.util.Collections;
import java.util.List;

import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@WebMvcTest(ProjectController.class)
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
public class ProjectControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private ObjectMapper objectMapper;

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
    @WithMockUser(username = "test@example.com")
    public void testGetAllProjectsForUser() throws Exception {
        String currentUserLogin = "test@example.com";
        when(projectService.getAllProjectsForUser(currentUserLogin)).thenReturn(Collections.singletonList(project));

        MvcResult mvcResult = mockMvc.perform(MockMvcRequestBuilders.get("/profiles/projects"))
                .andExpect(status().isOk())
                .andReturn();
        String json = mvcResult.getResponse().getContentAsString();
        List<ProjectDto> projectDtoMappingIterator = objectMapper.readValue(json, new TypeReference<>() {
        });
        Assertions.assertThat(projectDtoMappingIterator.get(0).getDescription()).isEqualTo("Test Project");
        verify(projectService).getAllProjectsForUser(currentUserLogin);
    }

    @Test
    @WithMockUser(username = "test@example.com")
    public void testGetProjectById() throws Exception {
        when(projectService.getProjectById(project.getId())).thenReturn(project);
        mockMvc.perform(MockMvcRequestBuilders.get("/profiles/projects/{id}", project.getId()))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.description").value("Test Project"));

        verify(projectService).getProjectById(project.getId());
    }

    @Test
    @WithMockUser(username = "test@example.com")
    public void testCreateProject() throws Exception {
        when(projectService.createProject(anyString(), any(Project.class))).thenReturn(project);
        mockMvc.perform(MockMvcRequestBuilders.post("/profiles/projects")
                        .with(SecurityMockMvcRequestPostProcessors.csrf())
                        .contentType("application/json")
                        .content(objectMapper.writeValueAsString(projectDto)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.description").value("Test Project"));

        verify(projectService).createProject(anyString(), any(Project.class));
    }

    @Test
    @WithMockUser(username = "test@example.com")
    public void testUpdateProject() throws Exception {
        when(projectService.updateProject(anyLong(), any(Project.class))).thenReturn(project);

        mockMvc.perform(MockMvcRequestBuilders.put("/profiles/projects/{idProject}", project.getId())
                        .with(SecurityMockMvcRequestPostProcessors.csrf())
                        .contentType("application/json")
                        .content(new ObjectMapper().writeValueAsString(projectDto)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.description").value("Test Project"));

        verify(projectService).updateProject(anyLong(), any(Project.class));
    }

    @Test
    @WithMockUser

    public void testDeleteProject() throws Exception {
        doNothing().when(projectService).deleteProject(project.getId());
        mockMvc.perform(MockMvcRequestBuilders.delete("/profiles/projects/{id}", project.getId())
                        .with(SecurityMockMvcRequestPostProcessors.csrf()))
                .andExpect(status().isOk());
        verify(projectService).deleteProject(project.getId());
    }
}

