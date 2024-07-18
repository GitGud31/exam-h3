package com.h3hitema.examBack.service;

import com.h3hitema.examBack.dto.MailDataDto;
import static org.mockito.Mockito.*;

import com.h3hitema.examBack.dto.ProfileDto;
import com.h3hitema.examBack.dto.SendMailStatus;
import com.h3hitema.examBack.model.Profile;
import com.h3hitema.examBack.provider.EmailSenderProxy;
import com.h3hitema.examBack.repository.ProfileRepository;
import com.h3hitema.examBack.util.Utils;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.ResponseEntity;

import java.time.LocalDateTime;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.when;

@SpringBootTest
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
public class ProfileServiceTest {

    @Autowired
    ProfileService profileService;

    @BeforeEach
    void setUp() {
        // Any setup code goes here
    }

    @Test
    void testGetAllProfiles() {
        Profile profile = new Profile();
        profile.setPassword("aaa");
        profile.setFirstName("test");
        profile.setEmail("all@gmail.com");

        Profile savedProfile = profileService.createProfile(profile);
        assertNotNull(savedProfile.getId());

        List<Profile> profiles = profileService.getAllProfiles();
        assertEquals(profiles.stream().count(),2);

        profileService.deleteProfile(savedProfile.getId());
    }

    @Test
    void testCreateProfile() {
        Profile profile = new Profile();
        profile.setPassword("aaa");
        profile.setFirstName("test");
        profile.setEmail("create@gmail.com");
        Profile savedProfile = profileService.createProfile(profile);
        assertNotNull(savedProfile.getId());
        assertEquals("test", savedProfile.getFirstName());
        profileService.deleteProfile(savedProfile.getId());
    }

    @Test
    void testGetProductById() {
        Profile profile = new Profile();
        profile.setPassword("aaa");
        profile.setEmail("byid@gmail.com");
        profile.setLastName("rahhouti");
        Profile savedProfile = profileService.createProfile(profile);
        Profile fetchedProfile = profileService.getProfileById(savedProfile.getId());
        assertEquals(savedProfile.getId(), fetchedProfile.getId());
        assertEquals("rahhouti", fetchedProfile.getLastName());
        profileService.deleteProfile(savedProfile.getId());
    }

    @Test
    void testGetProfileByEmail()
    {
        Profile profile = new Profile();
        profile.setPassword("aaa");
        profile.setEmail("byemail@gmail.com");
        profileService.createProfile(profile);
        assertNotNull(profileService.getProfileByEmail("byemail@gmail.com"));
        profileService.deleteProfile(profile.getId());
    }


    @Test
    void testUpdateProfile() {
        Profile profile = new Profile();
        profile.setPassword("aaa");
        profile.setEmail("unupdated@gmail.com");
        Profile savedProfile = profileService.createProfile(profile);
        savedProfile.setEmail("updated@gmail.com");
        Profile updatedProfile = profileService.updateProfile(savedProfile.getId(),savedProfile);
        assertEquals("updated@gmail.com", updatedProfile.getEmail());
        profileService.deleteProfile(savedProfile.getId());
    }

    @Test
    void testDeleteProfile() {
        Profile profile = new Profile();
        profile.setPassword("aaa");
        profile.setEmail("delete@gmail.com");
        Profile savedProfile = profileService.createProfile(profile);
        long profileId = savedProfile.getId();
        profileService.deleteProfile(savedProfile.getId());
        assertThrows(NoSuchElementException.class, () -> {
            profileService.getProfileById(profileId);
        });
    }

    /*
    @Test
    public void testForgetPwdSuccess() {
        String email = "test@example.com";
        Profile profile = new Profile();
        profile.setEmail(email);

        when(profileRepository.findUserByEmail(email)).thenReturn(Optional.of(profile));

        String forgetCode = "123456";
        LocalDateTime expiration = LocalDateTime.now().plusHours(1);
        when(Utils.getRondomNumber(999999)).thenReturn(forgetCode);

        MailDataDto mailData = MailDataDto.builder()
                .to(email)
                .model(profileService.buildMailData(expiration, forgetCode))
                .build();
        ResponseEntity<SendMailStatus> response = ResponseEntity.ok(SendMailStatus.OK);

        when(emailSenderProxy.sendConfirmationMail(mailData));

        profileService.forgetPwd(email);

        verify(profileRepository).save(profile);
        verify(emailSenderProxy).sendConfirmationMail(mailData);
        assertEquals(forgetCode, profile.getCodeForgetPwd());
        assertTrue(profile.getCodeExpirationForgetPwd().isAfter(LocalDateTime.now()));
    }*/


}
