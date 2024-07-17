package com.h3hitema.examBack.controller;

import com.h3hitema.examBack.config.SecurityUtils;
import com.h3hitema.examBack.controller.mapper.ProjectMapper;
import com.h3hitema.examBack.dto.ProjectDto;
import com.h3hitema.examBack.service.ProjectService;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.enums.ParameterIn;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/profiles/")
@SecurityRequirement(name = "Authorization")
public record ProjectController(ProjectService projectService) {
    @GetMapping("projects")
    @Parameter(name = "Authorization", description = "Bearer token", required = true, in = ParameterIn.HEADER)
    public List<ProjectDto> getAllProjectsForUser() {
        String currentUserLogin = SecurityUtils.getCurrentUserLogin();
        return projectService.getAllProjectsForUser(currentUserLogin).stream().map(ProjectMapper::toDto).toList();
    }

    @GetMapping("projects/{id}")
    @Parameter(name = "Authorization", description = "Bearer token", required = true, in = ParameterIn.HEADER)
    public ProjectDto getProjectById(@PathVariable Long id) {
        return ProjectMapper.toDto(projectService.getProjectById(id));
    }

    @PostMapping("projects")
    @Parameter(name = "Authorization", description = "Bearer token", required = true, in = ParameterIn.HEADER)
    public ProjectDto createProject(@RequestBody ProjectDto projectDto) {
        String currentUserLogin = SecurityUtils.getCurrentUserLogin();
        return ProjectMapper.toDto(projectService.createProject(currentUserLogin, ProjectMapper.toEntity(projectDto)));
    }

    @PutMapping("projects/{idProject}")
    @Parameter(name = "Authorization", description = "Bearer token", required = true, in = ParameterIn.HEADER)
    public ProjectDto updateProject(@PathVariable Long idProject,
                                    @RequestBody ProjectDto projectDetailsDto) {
        return ProjectMapper.toDto(projectService.updateProject(idProject, ProjectMapper.toEntity(projectDetailsDto)));
    }

    @DeleteMapping("projects/{id}")
    @Parameter(name = "Authorization", description = "Bearer token", required = true, in = ParameterIn.HEADER)
    public void deleteProject(@PathVariable Long id) {
        projectService.deleteProject(id);
    }
}