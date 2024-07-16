package com.h3hitema.examBack.repository;

import com.h3hitema.examBack.model.Profile;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface ProfileRepository extends JpaRepository<Profile, Long> {
    Optional<Profile> findUserByEmail(String email);

    List<Profile> findByFirstNameLikeIgnoreCase(String firstName);

}
