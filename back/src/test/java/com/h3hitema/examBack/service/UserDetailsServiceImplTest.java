package com.h3hitema.examBack.service;

import static org.mockito.Mockito.*;
import static org.junit.jupiter.api.Assertions.*;

import java.util.Optional;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.h3hitema.examBack.model.Profile;
import com.h3hitema.examBack.repository.ProfileRepository;


@SpringBootTest
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
public class UserDetailsServiceImplTest {

    @Autowired
    private UserDetailsServiceImp userDetailsServiceImp;

    @MockBean
    private ProfileRepository profileRepository;

    private Profile profile;

    @BeforeEach
    public void setUp() {
        profile = new Profile();
        profile.setEmail("test@gmail.com");
        profile.setPassword("password");
    }

    @Test
    public void testLoadUserByUsernameSuccess() {
        when(profileRepository.findUserByEmail(profile.getEmail())).thenReturn(Optional.of(profile));

        UserDetails userDetails = userDetailsServiceImp.loadUserByUsername(profile.getEmail());

        assertNotNull(userDetails);
        assertEquals(profile.getEmail(), userDetails.getUsername());
        assertEquals(profile.getPassword(), userDetails.getPassword());
        verify(profileRepository).findUserByEmail(profile.getEmail());
    }

    @Test
    public void testLoadUserByUsernameNotFound() {
        String email = "nonexistent@example.com";
        when(profileRepository.findUserByEmail(email)).thenReturn(Optional.empty());

        Exception exception = assertThrows(UsernameNotFoundException.class, () -> {
            userDetailsServiceImp.loadUserByUsername(email);
        });

        assertEquals("User with email: " + email + " not found!", exception.getMessage());
        verify(profileRepository).findUserByEmail(email);
    }
}
