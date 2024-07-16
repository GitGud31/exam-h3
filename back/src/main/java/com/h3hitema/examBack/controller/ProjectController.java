package com.h3hitema.examBack.controller;

import com.h3hitema.examBack.controller.mapper.ProjectMapper;
import com.h3hitema.examBack.dto.ProjectDto;
import com.h3hitema.examBack.service.ProjectService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/profiles/projects/")
public record ProjectController(ProjectService projectService) {
    @GetMapping("")
    public List<ProjectDto> getAllProjects() {
        return projectService.getAllProjects().stream().map(ProjectMapper::toDto).toList();
    }

    @GetMapping("/{id}")
    public ProjectDto getProjectById(@PathVariable Long id) {
        return ProjectMapper.toDto(projectService.getProjectById(id));
    }

    @PostMapping("profile/{idProfile}")
    public ProjectDto createProject(@PathVariable Long idProfile,
                                    @RequestBody ProjectDto projectDto) {
        return ProjectMapper.toDto(projectService.saveProject(idProfile, ProjectMapper.toEntity(projectDto)));
    }

    @PutMapping("profile/{idProject}")
    public ProjectDto updateProject(@PathVariable Long idProject,
                                    @RequestBody ProjectDto projectDetailsDto) {
        return ProjectMapper.toDto(projectService.updateProject(idProject, ProjectMapper.toEntity(projectDetailsDto)));
    }

    @DeleteMapping("/{id}")
    public void deleteProject(@PathVariable Long id) {
        projectService.deleteProject(id);
    }
}