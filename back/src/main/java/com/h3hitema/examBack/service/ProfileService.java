package com.h3hitema.examBack.service;

import com.h3hitema.examBack.model.Profile;
import com.h3hitema.examBack.repository.ProfileRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;


@Service
@RequiredArgsConstructor
@Transactional(rollbackOn = Exception.class)
public class ProfileService {

    private final ProfileRepository profileRepository;

    public List<Profile> getAllProfiles() {
        return profileRepository.findAll();
    }

    public Profile getProfileById(Long id) {
        return profileRepository.findById(id).orElseThrow();
    }

    public Profile createProfile(Profile profile) {
        if (profileRepository.existsByEmail(profile.getEmail())) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Email must be unique");
        }
        return profileRepository.save(profile);
    }

    public Profile updateProfile(Long id, Profile profileDetails) {
        return profileRepository.save(this.getProfileById(id).updateProfile(profileDetails));
    }

    public void deleteProfile(Long id) {
        profileRepository.deleteById(id);
    }
}

