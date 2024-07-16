package com.h3hitema.examBack.service;

import com.h3hitema.examBack.model.SubTask;
import com.h3hitema.examBack.model.Task;
import com.h3hitema.examBack.repository.SubTaskRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional(rollbackOn = Exception.class)
public class SubTaskService {

    private final SubTaskRepository subTaskRepository;
    private final TaskService taskService;
    public List<SubTask> getAllSubTasks() {
        return subTaskRepository.findAll();
    }

    public SubTask getSubTaskById(Long id) {
        return subTaskRepository.findById(id).orElseThrow();
    }

    public SubTask createSubTask(Long idTask, SubTask subTask) {
        Task currentTask = taskService.getTaskById(idTask);
        currentTask.getSubTasks().add(subTask);
        subTask.setTask(currentTask);
        return subTaskRepository.save(subTask);
    }

    public SubTask updateSubTask(Long id, SubTask subTaskDetails) {
       return subTaskRepository.save(this.getSubTaskById(id).updateSubTask(subTaskDetails));
    }

    public void deleteSubTask(Long id) {
        subTaskRepository.deleteById(id);
    }
}