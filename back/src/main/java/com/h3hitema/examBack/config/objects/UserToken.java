package com.h3hitema.examBack.config.objects;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@Builder
public class UserToken {
    String token;
    String email;
    String profiles;
    Date expiration;
}
