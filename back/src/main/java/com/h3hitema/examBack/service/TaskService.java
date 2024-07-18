package com.h3hitema.examBack.service;

import com.h3hitema.examBack.model.Profile;
import com.h3hitema.examBack.model.Project;
import com.h3hitema.examBack.model.Task;
import com.h3hitema.examBack.repository.TaskRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.dao.OptimisticLockingFailureException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Objects;

@Service
@RequiredArgsConstructor
@Transactional(rollbackOn = Exception.class)
public class TaskService {
    private final TaskRepository taskRepository;
    private final ProjectService projectService;
    private final ProfileService profileService;
    public List<Task> getAllTasks(Long idProject) {
        return taskRepository.findAllByProject_Id(idProject);
    }

    public Task getTaskById(Long id) {
        return taskRepository.findById(id).orElseThrow();
    }

    public Task createTask(Long idProject, Task task, String creatorEmail) {
        task.setCreator( profileService.getProfileByEmail(creatorEmail));
        Project project = projectService.getProjectById(idProject);
        if(Objects.isNull(project.getTasks())){
            project.setTasks(new HashSet<>());
        }
        project.getTasks().add(task);
        task.setProject(project);
        return taskRepository.save(task);
    }

    public Task updateTask(Long id, Task taskDetails) {
        Task task = this.getTaskById(id);
        if (!Objects.equals(task.getVersion(), taskDetails.getVersion())) {
            throw new OptimisticLockingFailureException("Conflict");
        }
        return taskRepository.save(task.updateTask(taskDetails));
    }

    public Task updateTaskGuests(Long id, Long idProfile) {
        Profile profile = profileService.getProfileById(idProfile);
        Task currentTask = this.getTaskById(id);
        if(currentTask.getTaskGuests() == null){
            currentTask.setTaskGuests(new ArrayList<>());
        }
        currentTask.getTaskGuests().add(profile);
        return taskRepository.save(currentTask);
    }
    public void deleteTask(Long id) {
        taskRepository.deleteById(id);
    }
}


