package com.h3hitema.examBack.controller;

import com.h3hitema.examBack.controller.mapper.TaskMapper;
import com.h3hitema.examBack.dto.TaskDto;
import com.h3hitema.examBack.model.Task;
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

    // TODO: id project
    @PostMapping("{idProject}/tasks")
    public TaskDto createTask(@PathVariable Long idProject, @RequestBody Task task) {
        return TaskMapper.toDto(taskService.createTask(idProject, task));
    }

    @PutMapping("tasks/{id}")
    public TaskDto updateTask(@PathVariable Long id, @RequestBody TaskDto taskDetails) {
        return TaskMapper.toDto(taskService.updateTask(id, TaskMapper.toEntity(taskDetails)));
    }

    @DeleteMapping("tasks{id}")
    public void deleteTask(@PathVariable Long id) {
        taskService.deleteTask(id);
    }
}
