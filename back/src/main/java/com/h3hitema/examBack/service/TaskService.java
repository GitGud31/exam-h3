package com.h3hitema.examBack.service;

import com.h3hitema.examBack.model.Task;
import com.h3hitema.examBack.repository.TaskRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional(rollbackOn = Exception.class)
public class TaskService {
    private final TaskRepository taskRepository;
    private final ProjectService projectService;
    public List<Task> getAllTasks() {
        return taskRepository.findAll();
    }

    public Task getTaskById(Long id) {
        return taskRepository.findById(id).orElseThrow();
    }

    public Task createTask(Long idProject, Task task) {
        if (taskRepository.existsById(task.getId())) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Task already exists !");
        }
        projectService.getProjectById(idProject);
        return taskRepository.save(task);
    }

    public Task updateTask(Long id, Task taskDetails) {
        return taskRepository.save(this.getTaskById(id).updateTask(taskDetails));
    }

    public void deleteTask(Long id) {
        taskRepository.deleteById(id);
    }
}


