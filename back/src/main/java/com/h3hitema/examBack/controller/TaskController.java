package com.h3hitema.examBack.controller;

import com.h3hitema.examBack.config.SecurityUtils;
import com.h3hitema.examBack.controller.mapper.TaskMapper;
import com.h3hitema.examBack.dto.TaskDto;
import com.h3hitema.examBack.service.TaskService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/profiles/projects/")
public record TaskController(TaskService taskService) {
    @GetMapping("tasks")
    public List<TaskDto> getAllTasks() {
        return taskService.getAllTasks().stream().map(TaskMapper::toDto).toList();
    }

    @GetMapping("tasks/{id}")
    public TaskDto getTaskById(@PathVariable Long id) {
        return TaskMapper.toDto(taskService.getTaskById(id));
    }

    @PostMapping("{idProject}/tasks")
    public TaskDto createTask(@PathVariable Long idProject, @RequestBody TaskDto task) {
        String currentUserLogin = SecurityUtils.getCurrentUserLogin();
        return TaskMapper.toDto(taskService.createTask(idProject, TaskMapper.toEntity(task), currentUserLogin));
    }

    @PutMapping("tasks/{id}")
    public TaskDto updateTask(@PathVariable Long id, @RequestBody TaskDto taskDetails) {
        return TaskMapper.toDto(taskService.updateTask(id, TaskMapper.toEntity(taskDetails)));
    }

    @PutMapping("tasks/{id}/profile_guest/{idProfile}")
    public TaskDto updateTaskGuest(@PathVariable Long id, @PathVariable Long idProfile) {
        return TaskMapper.toDto(taskService.updateTaskGuests(id, idProfile));
    }

    @DeleteMapping("tasks{id}")
    public void deleteTask(@PathVariable Long id) {
        taskService.deleteTask(id);
    }
}
