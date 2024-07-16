package com.h3hitema.examBack.controller;

import com.h3hitema.examBack.controller.mapper.ProfileMapper;
import com.h3hitema.examBack.dto.ProfileDto;
import com.h3hitema.examBack.service.ProfileService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/profiles")
public record ProfileController(ProfileService profileService) {

    @GetMapping
    public List<ProfileDto> getAllProfiles() {
        return profileService.getAllProfiles().stream().map(ProfileMapper::toDto).toList();
    }

    @GetMapping("/{id}")
    public ProfileDto getProfileById(@PathVariable Long id) {
        return ProfileMapper.toDto(profileService.getProfileById(id));
    }

    @PostMapping
    public ProfileDto createProfile(@RequestBody ProfileDto profileDto) {
        return ProfileMapper.toDto(profileService.createProfile(ProfileMapper.toEntity(profileDto)));
    }

    @PutMapping("/{id}")
    public ProfileDto updateProfile(@PathVariable Long id, @RequestBody ProfileDto profileDetailsDto) {
        return ProfileMapper.toDto(profileService.updateProfile(id, ProfileMapper.toEntity(profileDetailsDto)));
    }

    @DeleteMapping("/{id}")
    public void deleteProfile(@PathVariable Long id) {
        profileService.deleteProfile(id);
    }
}
