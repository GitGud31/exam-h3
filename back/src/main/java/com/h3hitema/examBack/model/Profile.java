package com.h3hitema.examBack.model;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;
import java.util.Set;

@Entity
@Table
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Profile {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String email;
    private String firstName;
    private String lastName;
    private String password;
    private LocalDateTime createdAt;

    @OneToMany(mappedBy = "profile")
    private Set<Project> projects;

    public Profile updateProfile(Profile profile){
        this.setEmail(profile.getEmail());
        this.setFirstName(profile.getFirstName());
        this.setLastName(profile.getLastName());
        this.setPassword(profile.getPassword());
        this.setCreatedAt(profile.getCreatedAt());
        return this;
    }
}


