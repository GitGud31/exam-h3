package com.h3hitema.examBack.service;

import com.h3hitema.examBack.model.Profile;
import com.h3hitema.examBack.repository.ProfileRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.dao.OptimisticLockingFailureException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;


@Service
@RequiredArgsConstructor
@Transactional(rollbackOn = Exception.class)
public class ProfileService {

    private final ProfileRepository profileRepository;
    private final PasswordEncoder oauthClientPasswordEncoder;
    public List<Profile> getAllProfiles() {
        return profileRepository.findAll();
    }

    public Profile getProfileById(Long id) {
        return profileRepository.findById(id).orElseThrow();
    }

    public List<Profile> getProfileByFirstName(String firstName){
        return profileRepository.findByFirstNameLikeIgnoreCase(firstName);
    }
    public Profile createProfile(Profile profile) {
        String password = profile.getPassword();
        profile.setPassword(oauthClientPasswordEncoder.encode(password));
        return profileRepository.save(profile);
    }

    public Profile updateProfile(Long id, Profile profileDetails) {
        String password = profileDetails.getPassword();
        Profile profile = this.getProfileById(id);
        if (!Objects.equals(profile.getVersion(), profileDetails.getVersion())) {
            throw new OptimisticLockingFailureException("Conflict");
        }
        return profileRepository.save(profile.updateProfile(profileDetails,
                oauthClientPasswordEncoder.encode(password)));
    }

    public void deleteProfile(Long id) {
        profileRepository.deleteById(id);
    }
}

