package com.h3hitema.examBack.controller;

import com.h3hitema.examBack.controller.mapper.SubTaskMapper;
import com.h3hitema.examBack.dto.SubTaskDto;
import com.h3hitema.examBack.service.SubTaskService;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.enums.ParameterIn;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("profiles/projects/tasks/")
@SecurityRequirement(name = "Authorization")
public record SubTaskController(SubTaskService subTaskService) {

    @GetMapping("subtasks")
    @Parameter(name = "Authorization", description = "Bearer token", required = true, in = ParameterIn.HEADER)
    public List<SubTaskDto> getAllSubTasks() {
        return subTaskService.getAllSubTasks().stream().map(SubTaskMapper::toDto).toList();
    }

    @GetMapping("subtasks/{id}")
    @Parameter(name = "Authorization", description = "Bearer token", required = true, in = ParameterIn.HEADER)
    public SubTaskDto getSubTaskById(@PathVariable Long id) {
        return SubTaskMapper.toDto(subTaskService.getSubTaskById(id));
    }

    @PostMapping("{idTask}/subtasks")
    @Parameter(name = "Authorization", description = "Bearer token", required = true, in = ParameterIn.HEADER)
    public SubTaskDto createSubTask(
            @PathVariable Long idTask,
            @RequestBody SubTaskDto subTask) {
        return SubTaskMapper.toDto(subTaskService.createSubTask(idTask, SubTaskMapper.toEntity(subTask)));
    }

    @PutMapping("subtasks/{id}")
    @Parameter(name = "Authorization", description = "Bearer token", required = true, in = ParameterIn.HEADER)
    public SubTaskDto updateSubTask(@PathVariable Long id, @RequestBody SubTaskDto subTaskDetails) {
        return SubTaskMapper.toDto(subTaskService.updateSubTask(id, SubTaskMapper.toEntity(subTaskDetails)));
    }

    @DeleteMapping("subtasks/{id}")
    @Parameter(name = "Authorization", description = "Bearer token", required = true, in = ParameterIn.HEADER)
    public void deleteSubTask(@PathVariable Long id) {
        subTaskService.deleteSubTask(id);
    }
}
