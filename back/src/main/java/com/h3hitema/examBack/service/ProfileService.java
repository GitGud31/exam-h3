package com.h3hitema.examBack.service;

import com.h3hitema.examBack.model.Profile;
import com.h3hitema.examBack.repository.ProfileRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProfileService {

    @Autowired
    private ProfileRepository profileRepository;

    public List<Profile> getAllProfiles() {
        return profileRepository.findAll();
    }

    public Optional<Profile> getProfileById(Long id) {
        return profileRepository.findById(id);
    }

    public Profile saveProfile(Profile profile) {
        return profileRepository.save(profile);
    }

    public Profile updateProfile(Long id, Profile profileDetails) {
        return profileRepository.findById(id)
                .map(profile -> {
                    profile.setEmail(profileDetails.getEmail());
                    profile.setFirstName(profileDetails.getFirstName());
                    profile.setLastName(profileDetails.getLastName());
                    profile.setPassword(profileDetails.getPassword());
                    profile.setCreatedAt(profileDetails.getCreatedAt());
                    return profileRepository.save(profile);
                })
                .orElseGet(() -> {
                    profileDetails.setId(id);
                    return profileRepository.save(profileDetails);
                });
    }

    public void deleteProfile(Long id) {
        profileRepository.deleteById(id);
    }
}

