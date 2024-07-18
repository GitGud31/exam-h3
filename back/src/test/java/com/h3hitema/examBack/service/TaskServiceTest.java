package com.h3hitema.examBack.service;
import static org.mockito.Mockito.*;
import static org.junit.jupiter.api.Assertions.*;

import java.util.*;
import java.util.Optional;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.dao.OptimisticLockingFailureException;

import com.h3hitema.examBack.model.Profile;
import com.h3hitema.examBack.model.Project;
import com.h3hitema.examBack.model.Task;
import com.h3hitema.examBack.repository.TaskRepository;

@SpringBootTest
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
public class TaskServiceTest {

    @Autowired
    private TaskService taskService;

    @MockBean
    private TaskRepository taskRepository;

    @MockBean
    private ProjectService projectService;

    @MockBean
    private ProfileService profileService;

    private Profile profile;
    private Project project;
    private Task task;

    @BeforeEach
    public void setUp() {
        profile = new Profile();
        profile.setId(1L);
        profile.setEmail("test@example.com");

        project = new Project();
        project.setId(1L);
        project.setDescription("Test Project");
        project.setProfile(profile);

        task = new Task();
        task.setId(1L);
        task.setDescription("Test Task");
        task.setCreator(profile);
        task.setProject(project);
        task.setVersion(1);
    }

    @Test
    public void testGetAllTasks() {
        when(taskRepository.findAllByProject_Id(project.getId())).thenReturn(Arrays.asList(task));

        List<Task> tasks = taskService.getAllTasks(project.getId());

        assertNotNull(tasks);
        assertFalse(tasks.isEmpty());
        assertEquals(1, tasks.size());
        assertEquals("Test Task", tasks.get(0).getDescription());
        verify(taskRepository).findAllByProject_Id(project.getId());
    }

    @Test
    public void testGetTaskById() {
        when(taskRepository.findById(task.getId())).thenReturn(Optional.of(task));

        Task foundTask = taskService.getTaskById(task.getId());

        assertNotNull(foundTask);
        assertEquals("Test Task", foundTask.getDescription());
        verify(taskRepository).findById(task.getId());
    }

    @Test
    public void testCreateTask() {
        when(profileService.getProfileByEmail(profile.getEmail())).thenReturn(profile);
        when(projectService.getProjectById(project.getId())).thenReturn(project);
        when(taskRepository.save(any(Task.class))).thenReturn(task);

        Task newTask = new Task();
        newTask.setDescription("New Task");

        Task createdTask = taskService.createTask(project.getId(), newTask, profile.getEmail());

        assertNotNull(createdTask);
        assertEquals(profile, createdTask.getCreator());
        assertEquals(project, createdTask.getProject());
        verify(profileService).getProfileByEmail(profile.getEmail());
        verify(projectService).getProjectById(project.getId());
        verify(taskRepository).save(any(Task.class));
    }

    @Test
    public void testUpdateTask() {
        Task updatedTaskDetails = new Task();
        updatedTaskDetails.setId(task.getId());
        updatedTaskDetails.setDescription("Updated Task");
        updatedTaskDetails.setVersion(1);

        when(taskRepository.findById(task.getId())).thenReturn(Optional.of(task));
        when(taskRepository.save(any(Task.class))).thenReturn(task);

        Task updatedTask = taskService.updateTask(task.getId(), updatedTaskDetails);

        assertNotNull(updatedTask);
        assertEquals("Updated Task", updatedTask.getDescription());
        verify(taskRepository).findById(task.getId());
        verify(taskRepository).save(any(Task.class));
    }

    @Test
    public void testUpdateTaskOptimisticLockingFailure() {
        Task updatedTaskDetails = new Task();
        updatedTaskDetails.setId(task.getId());
        updatedTaskDetails.setDescription("Updated Task");
        updatedTaskDetails.setVersion(2); // different version

        when(taskRepository.findById(task.getId())).thenReturn(Optional.of(task));

        Exception exception = assertThrows(OptimisticLockingFailureException.class, () -> {
            taskService.updateTask(task.getId(), updatedTaskDetails);
        });

        assertEquals("Conflict", exception.getMessage());
        verify(taskRepository).findById(task.getId());
    }

    @Test
    public void testUpdateTaskGuests() {
        Profile guestProfile = new Profile();
        guestProfile.setId(2L);
        guestProfile.setEmail("guest@example.com");

        when(profileService.getProfileById(guestProfile.getId())).thenReturn(guestProfile);
        when(taskRepository.findById(task.getId())).thenReturn(Optional.of(task));
        when(taskRepository.save(any(Task.class))).thenReturn(task);

        Task updatedTask = taskService.updateTaskGuests(task.getId(), guestProfile.getId());

        assertNotNull(updatedTask);
        assertTrue(updatedTask.getTaskGuests().contains(guestProfile));
        verify(profileService).getProfileById(guestProfile.getId());
        verify(taskRepository).findById(task.getId());
        verify(taskRepository).save(any(Task.class));
    }

    /*
    @Test
    public void testDeleteTask() {
        when(taskRepository.findById(task.getId())).thenReturn(Optional.of(task));

        taskService.deleteTask(task.getId());

        verify(taskRepository).findById(task.getId());
        verify(taskRepository).deleteById(task.getId());
    }*/
}

