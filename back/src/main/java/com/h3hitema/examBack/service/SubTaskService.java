package com.h3hitema.examBack.service;

import com.h3hitema.examBack.model.SubTask;
import com.h3hitema.examBack.repository.SubTaskRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SubTaskService {
    @Autowired
    private SubTaskRepository subTaskRepository;

    public List<SubTask> getAllSubTasks() {
        return subTaskRepository.findAll();
    }

    public SubTask getSubTaskById(Long id) {
        return subTaskRepository.findById(id).orElse(null);
    }

    public SubTask saveSubTask(SubTask subTask) {
        return subTaskRepository.save(subTask);
    }

    public SubTask updateSubTask(Long id, SubTask subTaskDetails) {
        return subTaskRepository.findById(id)
                .map(subTask -> {
                    subTask.setDescription(subTaskDetails.getDescription());
                    subTask.setChecked(subTaskDetails.isChecked());
                    subTask.setCreatedAt(subTaskDetails.getCreatedAt());
                    return subTaskRepository.save(subTask);
                })
                .orElseGet(() -> {
                    subTaskDetails.setId(id);
                    return subTaskRepository.save(subTaskDetails);
                });
    }

    public void deleteSubTask(Long id) {
        subTaskRepository.deleteById(id);
    }
}