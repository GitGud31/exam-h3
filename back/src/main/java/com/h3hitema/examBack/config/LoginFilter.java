package com.h3hitema.examBack.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.h3hitema.examBack.config.objects.UserCredentials;
import jakarta.servlet.FilterChain;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AbstractAuthenticationProcessingFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import java.io.IOException;
import java.util.Collections;

public class LoginFilter extends AbstractAuthenticationProcessingFilter {
    private final Logger log = LoggerFactory.getLogger(LoginFilter.class);

    public LoginFilter(String url, AuthenticationManager authManager) {
        super(new AntPathRequestMatcher(url));
        setAuthenticationManager(authManager);
    }

    @Override
    public Authentication attemptAuthentication(
            HttpServletRequest req, HttpServletResponse res)
            throws AuthenticationException, IOException {
        UserCredentials userCredentials = new ObjectMapper()
                .readValue(req.getInputStream(), UserCredentials.class);
        String decryptedPassword = decryptPassword(userCredentials.getPassword());
        return getAuthenticationManager().authenticate(
                new UsernamePasswordAuthenticationToken(
                        userCredentials.getEmail(),
                        decryptedPassword,
                        Collections.emptyList()
                )
        );
    }

    @Override
    protected void successfulAuthentication(
            HttpServletRequest req,
            HttpServletResponse res, FilterChain chain,
            Authentication auth) throws IOException {
        AuthenticationService.addJWTToken(res, auth.getName(), auth.getAuthorities());
    }

    private String decryptPassword(String encryptedPwd) {
        try {
            return new String(java.util.Base64.getDecoder().decode(encryptedPwd));
        } catch (IllegalArgumentException e) {
            log.error(e.getMessage());
            return encryptedPwd;
        }
    }
}
