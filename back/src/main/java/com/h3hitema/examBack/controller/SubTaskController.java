package com.h3hitema.examBack.controller;

import com.h3hitema.examBack.controller.mapper.SubTaskMapper;
import com.h3hitema.examBack.dto.SubTaskDto;
import com.h3hitema.examBack.service.SubTaskService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("profiles/projects/tasks/")
public record SubTaskController(SubTaskService subTaskService) {

    @GetMapping("subtasks")
    public List<SubTaskDto> getAllSubTasks() {
        return subTaskService.getAllSubTasks().stream().map(SubTaskMapper::toDto).toList();
    }

    @GetMapping("subtasks/{id}")
    public SubTaskDto getSubTaskById(@PathVariable Long id) {
        return SubTaskMapper.toDto(subTaskService.getSubTaskById(id));
    }

    @PostMapping("{idTask}/subtasks")
    public SubTaskDto createSubTask(
            @PathVariable Long idTask,
            @RequestBody SubTaskDto subTask) {
        return SubTaskMapper.toDto(subTaskService.createSubTask(idTask, SubTaskMapper.toEntity(subTask)));
    }

    @PutMapping("subtasks/{id}")
    public SubTaskDto updateSubTask(@PathVariable Long id, @RequestBody SubTaskDto subTaskDetails) {
        return SubTaskMapper.toDto(subTaskService.updateSubTask(id, SubTaskMapper.toEntity(subTaskDetails)));
    }

    @DeleteMapping("/{id}")
    public void deleteSubTask(@PathVariable Long id) {
        subTaskService.deleteSubTask(id);
    }
}
