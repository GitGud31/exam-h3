package com.h3hitema.examBack.model;

import com.h3hitema.examBack.model.commun.AbstractEntity;
import jakarta.persistence.Entity;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.*;

import java.util.Set;

@Entity
@Table
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Profile extends AbstractEntity {

    private String email;
    private String firstName;
    private String lastName;
    private String password;

    @OneToMany(mappedBy = "profile")
    private Set<Project> projects;

    public Profile updateProfile(Profile profile, String encryptedPwd){
        this.setEmail(profile.getEmail());
        this.setFirstName(profile.getFirstName());
        this.setLastName(profile.getLastName());
        this.setPassword(encryptedPwd);
        this.setCreatedAt(profile.getCreatedAt());
        this.setVersion(profile.getVersion());
        return this;
    }
}


