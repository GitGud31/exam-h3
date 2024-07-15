package com.h3hitema.examBack.controller;

import com.h3hitema.examBack.model.SubTask;
import com.h3hitema.examBack.service.SubTaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/subtasks")
public class SubTaskController {
    @Autowired
    private SubTaskService subTaskService;

    @GetMapping
    public List<SubTask> getAllSubTasks() {
        return subTaskService.getAllSubTasks();
    }

    @GetMapping("/{id}")
    public SubTask getSubTaskById(@PathVariable Long id) {
        return subTaskService.getSubTaskById(id);
    }

    @PostMapping
    public SubTask createSubTask(@RequestBody SubTask subTask) {
        return subTaskService.saveSubTask(subTask);
    }

    @PutMapping("/{id}")
    public SubTask updateSubTask(@PathVariable Long id, @RequestBody SubTask subTaskDetails) {
        return subTaskService.updateSubTask(id, subTaskDetails);
    }

    @DeleteMapping("/{id}")
    public void deleteSubTask(@PathVariable Long id) {
        subTaskService.deleteSubTask(id);
    }

    // Additional endpoints
}
