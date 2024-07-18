package com.h3hitema.examBack.service;

import com.h3hitema.examBack.config.ApplicationProperties;
import com.h3hitema.examBack.dto.MailDataDto;
import com.h3hitema.examBack.dto.ProfileForgetPwdDto;
import com.h3hitema.examBack.dto.Response;
import com.h3hitema.examBack.dto.SendMailStatus;
import com.h3hitema.examBack.model.Profile;
import com.h3hitema.examBack.provider.EmailSenderProxy;
import com.h3hitema.examBack.repository.ProfileRepository;
import com.h3hitema.examBack.util.Utils;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.dao.OptimisticLockingFailureException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;


@Service
@RequiredArgsConstructor
@Transactional(rollbackOn = Exception.class)
public class ProfileService {

    private final ProfileRepository profileRepository;
    private final PasswordEncoder oauthClientPasswordEncoder;
    private final EmailSenderProxy emailSenderProxy;
    private final ApplicationProperties applicationProperties;
    public List<Profile> getAllProfiles() {
        return profileRepository.findAll();
    }

    public Profile getProfileById(Long id) {
        return profileRepository.findById(id).orElseThrow();
    }

    public Profile getProfileByEmail(String email) {
        return profileRepository.findUserByEmail(email).orElseThrow();
    }
    public List<Profile> getProfileByFirstName(String firstName){
        return profileRepository.findByFirstNameLikeIgnoreCase(firstName);
    }
    public Profile createProfile(Profile profile) {
        if(profileRepository.findUserByEmail(profile.getEmail()).isPresent()){
            throw new IllegalArgumentException("The user already exist");
        }
        String password = profile.getPassword();
        profile.setPassword(oauthClientPasswordEncoder.encode(password));
        return profileRepository.save(profile);
    }

    public Profile updateProfile(Long id, Profile profileDetails) {
        Profile profile = this.getProfileById(id);
        if (!Objects.equals(profile.getVersion(), profileDetails.getVersion())) {
            throw new OptimisticLockingFailureException("Conflict");
        }
        return profileRepository.save(profile.updateProfile(profileDetails));
    }

    public void deleteProfile(Long id) {
        profileRepository.deleteById(id);
    }

    public void forgetPwd(String email){
        Profile profile = this.getProfileByEmail(email);
        LocalDateTime expiration = LocalDateTime.now().plusHours(1);
        String forgetCode = Utils.getRondomNumber(999999);
        profile.setCodeForgetPwd(forgetCode);
        profile.setCodeExpirationForgetPwd(expiration);
        profileRepository.save(profile);
        Response response = emailSenderProxy
                .sendConfirmationMail(MailDataDto.builder().to(email).model(buildMailData(expiration, forgetCode)).build());
        if(response.status().equals(SendMailStatus.Failed.name())){
            throw new IllegalArgumentException("Erreur d'envoi de mail");
        }
    }

    public Profile resetPwd(ProfileForgetPwdDto profileForget){
        Profile profile = profileRepository.findUserByEmail(profileForget.getEmail()).orElseThrow();
        boolean after = LocalDateTime.now().isAfter(profile.getCodeExpirationForgetPwd());
        if(!profile.getCodeForgetPwd().equals(profileForget.getCode()) || after){
            throw new IllegalArgumentException("Error in code or code is expire");
        }
        profile.setPassword(oauthClientPasswordEncoder.encode(profileForget.getNewPwd()));
        return profileRepository.save(profile);
    }

    private Map<String, Object> buildMailData(LocalDateTime expiration, String forgetCode){
        Map<String, Object> model = new HashMap<>();
        model.put("expirationDate", expiration);
        model.put("code", forgetCode);
        return model;
    }
}

