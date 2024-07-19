package com.h3hitema.examBack.service;

import com.h3hitema.examBack.model.Profile;
import com.h3hitema.examBack.provider.EmailSenderProxy;
import com.h3hitema.examBack.repository.ProfileRepository;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.NoSuchElementException;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
public class ProfileServiceTest {

    ProfileService profileService;
    @Mock
    ProfileRepository profileRepository;
    @Mock
    PasswordEncoder oauthClientPasswordEncoder;
    @Mock
    EmailSenderProxy emailSenderProxy;
    @BeforeEach
    void setUp() {
        profileService = new ProfileService(profileRepository, oauthClientPasswordEncoder, emailSenderProxy);
    }

    @Test
    void should_create_profile_when_call_method_and_user_not_exist() {
        // Given
        Profile profile = new Profile();
        profile.setPassword("aaa");
        profile.setFirstName("test");
        profile.setEmail("all@gmail.com");
        when(profileRepository.findUserByEmail(profile.getEmail())).thenReturn(Optional.empty());
        // When
        profileService.createProfile(profile);
        // Then
        verify(profileRepository).save(profile);
    }

    @Test
    void should_throw_exception_when_call_method_and_user_exist() {
        // Given
        Profile profile = new Profile();
        profile.setPassword("aaa");
        profile.setFirstName("test");
        profile.setEmail("all@gmail.com");
        when(profileRepository.findUserByEmail(profile.getEmail())).thenReturn(Optional.of(profile));
        // When Then
        IllegalArgumentException illegalArgumentException = assertThrows(IllegalArgumentException.class,
                () -> profileService.createProfile(profile));
        Assertions.assertThat(illegalArgumentException.getMessage()).isEqualTo("The user already exist");
    }



    @Test
    void should_return_profile_when_call_getProfileById_and_profile_exists() {
        Long profileId = 1L;
        Profile profile = new Profile();
        profile.setId(profileId);
        profile.setPassword("aaa");
        profile.setFirstName("test");
        profile.setEmail("all@gmail.com");
        when(profileRepository.findById(profileId)).thenReturn(Optional.of(profile));

        Profile result = profileService.getProfileById(profileId);

        assertNotNull(result);
        assertEquals(profileId, result.getId());
        verify(profileRepository).findById(profileId);
    }


    @Test
    void should_return_profile_when_call_getProfileByEmail_and_profile_exists() {
        // Given
        String email = "all@gmail.com";
        Profile profile = new Profile();
        profile.setPassword("aaa");
        profile.setFirstName("test");
        profile.setEmail(email);
        when(profileRepository.findUserByEmail(email)).thenReturn(Optional.of(profile));

        Profile result = profileService.getProfileByEmail(email);

        assertNotNull(result);
        assertEquals(email, result.getEmail());
        verify(profileRepository).findUserByEmail(email);
    }

    @Test
    void should_update_profile_when_call_updateProfile_and_profile_exists() {
        Long profileId = 1L;
        Profile existingProfile = new Profile();
        existingProfile.setId(profileId);
        existingProfile.setPassword("oldPassword");
        existingProfile.setFirstName("oldName");
        existingProfile.setEmail("old@gmail.com");

        Profile updatedProfile = new Profile();
        updatedProfile.setId(profileId);
        updatedProfile.setPassword("newPassword");
        updatedProfile.setFirstName("newName");
        updatedProfile.setEmail("new@gmail.com");

        when(profileRepository.findById(profileId)).thenReturn(Optional.of(existingProfile));
        when(profileRepository.save(any(Profile.class))).thenReturn(updatedProfile);

        // When
        Profile result = profileService.updateProfile(profileId, updatedProfile);

        // Then
        assertNotNull(result);
        assertEquals(updatedProfile.getPassword(), result.getPassword());
        assertEquals(updatedProfile.getFirstName(), result.getFirstName());
        assertEquals(updatedProfile.getEmail(), result.getEmail());
        verify(profileRepository).findById(profileId);
        verify(profileRepository).save(existingProfile);
    }

    @Test
    void should_throw_exception_when_call_updateProfile_and_profile_does_not_exist() {
        // Given
        Long profileId = 1L;
        Profile updatedProfile = new Profile();
        updatedProfile.setId(profileId);
        updatedProfile.setPassword("newPassword");
        updatedProfile.setFirstName("newName");
        updatedProfile.setEmail("new@gmail.com");

        when(profileRepository.findById(profileId)).thenReturn(Optional.empty());

        // When
        Exception exception = assertThrows(Exception.class, () -> {
            profileService.updateProfile(profileId, updatedProfile);
        });

        verify(profileRepository).findById(profileId);
        verify(profileRepository, never()).save(any(Profile.class));
    }


    @Test
    void should_delete_profile_when_call_deleteProfile_and_profile_exists() {
        Long profileId = 1L;
        doNothing().when(profileRepository).deleteById(profileId);

        // When
        profileService.deleteProfile(profileId);

        // Then
        verify(profileRepository).deleteById(profileId);
    }

    @Test
    void should_throw_exception_when_call_deleteProfile_and_profile_does_not_exist() {
        // Given
        Long profileId = 1L;
        doThrow(new EmptyResultDataAccessException(1)).when(profileRepository).deleteById(profileId);

        // When
        Exception exception = assertThrows(Exception.class, () -> {
            profileService.deleteProfile(profileId);
        });

        // Then
        verify(profileRepository).deleteById(profileId);
    }



}
