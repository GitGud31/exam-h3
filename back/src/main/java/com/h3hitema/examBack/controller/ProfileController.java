package com.h3hitema.examBack.controller;

import com.h3hitema.examBack.config.SecurityUtils;
import com.h3hitema.examBack.controller.mapper.ProfileMapper;
import com.h3hitema.examBack.dto.ProfileDto;
import com.h3hitema.examBack.dto.ProfileForgetPwdDto;
import com.h3hitema.examBack.dto.Response;
import com.h3hitema.examBack.service.ProfileService;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.enums.ParameterIn;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Objects;

@RestController
@RequestMapping("/profiles")
public record ProfileController(ProfileService profileService) {

    @GetMapping
    @SecurityRequirement(name = "Authorization")
    @Parameter(name = "Authorization", description = "Bearer token", required = true, in = ParameterIn.HEADER)
    public List<ProfileDto> getAllProfiles(
            @RequestParam(value = "firstName", required = false) String firstName
    ) {
        if (Objects.isNull(firstName)) {
            return profileService.getAllProfiles()
                    .stream().map(ProfileMapper::toDto).toList();
        }
        return profileService.getProfileByFirstName(firstName)
                .stream().map(ProfileMapper::toDto).toList();
    }

    @GetMapping("/{id}")
    @SecurityRequirement(name = "Authorization")
    @Parameter(name = "Authorization", description = "Bearer token", required = true, in = ParameterIn.HEADER)
    public ProfileDto getProfileById(@PathVariable Long id) {
        return ProfileMapper.toDto(profileService.getProfileById(id));
    }

    @GetMapping("/current")
    @SecurityRequirement(name = "Authorization")
    @Parameter(name = "Authorization", description = "Bearer token", required = true, in = ParameterIn.HEADER)
    public ProfileDto getProfileByEmail() {
        String email = SecurityUtils.getCurrentUserLogin();
        return ProfileMapper.toDto(profileService.getProfileByEmail(email));
    }

    @PostMapping
    public ProfileDto createProfile(@RequestBody @Validated ProfileDto profileDto) {
        return ProfileMapper.toDto(profileService.createProfile(ProfileMapper.toEntity(profileDto)));
    }

    @PutMapping("/{id}")
    @SecurityRequirement(name = "Authorization")
    @Parameter(name = "Authorization", description = "Bearer token", required = true, in = ParameterIn.HEADER)
    public ProfileDto updateProfile(@PathVariable Long id, @RequestBody ProfileDto profileDetailsDto) {
        return ProfileMapper.toDto(profileService.updateProfile(id, ProfileMapper.toEntity(profileDetailsDto)));
    }

    @DeleteMapping("/{id}")
    @SecurityRequirement(name = "Authorization")
    @Parameter(name = "Authorization", description = "Bearer token", required = true, in = ParameterIn.HEADER)
    public void deleteProfile(@PathVariable Long id) {
        profileService.deleteProfile(id);
    }

    @GetMapping("/forget_pwd")
    public Response forgetPwd(@RequestParam("email") String email,
                              @RequestHeader(value="Origin") String origin) {
        profileService.forgetPwd(email, origin);
        return new Response("OK");
    }

    @PostMapping("/reset_pwd")
    public ProfileDto resetPwd(@RequestBody ProfileForgetPwdDto profileForgetPwdDto) {
        return ProfileMapper.toDto(profileService.resetPwd(profileForgetPwdDto));
    }

}
