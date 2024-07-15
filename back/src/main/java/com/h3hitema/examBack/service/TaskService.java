package com.h3hitema.examBack.service;

import com.h3hitema.examBack.model.Task;
import com.h3hitema.examBack.repository.TaskRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TaskService {
    @Autowired
    private TaskRepository taskRepository;

    public List<Task> getAllTasks() {
        return taskRepository.findAll();
    }

    public Task getTaskById(Long id) {
        return taskRepository.findById(id).orElse(null);
    }

    public Task saveTask(Task task) {
        return taskRepository.save(task);
    }

    public Task updateTask(Long id, Task taskDetails) {
        return taskRepository.findById(id)
                .map(task -> {
                    task.setTitle(taskDetails.getTitle());
                    task.setDescription(taskDetails.getDescription());
                    task.setState(taskDetails.getState());
                    task.setPriority(taskDetails.getPriority());
                    task.setCreatedAt(taskDetails.getCreatedAt());
                    task.setDeadline(taskDetails.getDeadline());
                    return taskRepository.save(task);
                })
                .orElseGet(() -> {
                    taskDetails.setId(id);
                    return taskRepository.save(taskDetails);
                });
    }

    public void deleteTask(Long id) {
        taskRepository.deleteById(id);
    }
}


