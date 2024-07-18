package com.h3hitema.examBack.controller;

import com.h3hitema.examBack.config.SecurityUtils;
import com.h3hitema.examBack.controller.mapper.TaskMapper;
import com.h3hitema.examBack.dto.TaskDto;
import com.h3hitema.examBack.service.TaskService;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.enums.ParameterIn;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/profiles/projects/")
@SecurityRequirement(name = "Authorization")
public record TaskController(TaskService taskService) {
    @GetMapping("{idProject}/tasks")
    @Parameter(name = "Authorization", description = "Bearer token", required = true, in = ParameterIn.HEADER)
    public List<TaskDto> getAllTasks(@PathVariable Long idProject) {
        return taskService.getAllTasks(idProject).stream().map(TaskMapper::toDto).toList();
    }

    @GetMapping("tasks/{id}")
    @Parameter(name = "Authorization", description = "Bearer token", required = true, in = ParameterIn.HEADER)
    public TaskDto getTaskById(@PathVariable Long id) {
        return TaskMapper.toDto(taskService.getTaskById(id));
    }

    @PostMapping("{idProject}/tasks")
    @Parameter(name = "Authorization", description = "Bearer token", required = true, in = ParameterIn.HEADER)
    public TaskDto createTask(@PathVariable Long idProject, @RequestBody TaskDto task) {
        String currentUserLogin = SecurityUtils.getCurrentUserLogin();
        return TaskMapper.toDto(taskService.createTask(idProject, TaskMapper.toEntity(task), currentUserLogin));
    }

    @PutMapping("tasks/{id}")
    @Parameter(name = "Authorization", description = "Bearer token", required = true, in = ParameterIn.HEADER)
    public TaskDto updateTask(@PathVariable Long id, @RequestBody TaskDto taskDetails) {
        return TaskMapper.toDto(taskService.updateTask(id, TaskMapper.toEntity(taskDetails)));
    }

    @PutMapping("tasks/{id}/profile_guest/{idProfile}")
    @Parameter(name = "Authorization", description = "Bearer token", required = true, in = ParameterIn.HEADER)
    public TaskDto updateTaskGuest(@PathVariable Long id, @PathVariable Long idProfile) {
        return TaskMapper.toDto(taskService.updateTaskGuests(id, idProfile));
    }

    @DeleteMapping("tasks{id}")
    @Parameter(name = "Authorization", description = "Bearer token", required = true, in = ParameterIn.HEADER)
    public void deleteTask(@PathVariable Long id) {
        taskService.deleteTask(id);
    }
}
