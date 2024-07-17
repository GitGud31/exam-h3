package com.h3hitema.examBack.dto;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ProfileForgetPwdDto {
    private String email;
    private String code;
    private String newPwd;

}
