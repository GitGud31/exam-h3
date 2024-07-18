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
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.NoSuchElementException;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

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
