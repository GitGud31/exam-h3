package com.h3hitema.examBack.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.h3hitema.examBack.config.objects.UserToken;
import io.jsonwebtoken.SignatureAlgorithm;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import io.jsonwebtoken.Jwts;

import java.io.IOException;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.stream.Collectors;

public class AuthenticationService {


    static final long EXPIRATION = 864_000_00;
    static final String SIGNINGS = "signingKey";
    static final String BEARER_PREFIX = "Bearer";


    public static void addJWTToken(HttpServletResponse response, String email,
                                   Collection<? extends GrantedAuthority> authorities) throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        Date expirationDate = new Date(System.currentTimeMillis() + EXPIRATION);

        final String res = authorities.stream()
                .map(item ->
                        item.getAuthority().startsWith("ROLE_") ? item.getAuthority() :
                                "ROLE_" + item.getAuthority())
                .collect(Collectors.joining(","));

        String JwtToken = Jwts.builder().setSubject(email)
                .setExpiration(expirationDate)
                .claim("roles", res)
                .setIssuedAt(new Date())
                .signWith(SignatureAlgorithm.HS512, SIGNINGS)
                .compact();
        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        UserToken build =
                UserToken.builder().email(email).token(JwtToken).expiration(expirationDate).
                        profiles(authorities.stream().map(Object::toString)
                                .collect(Collectors.joining(", "))).build();
        response.getWriter().write(mapper.writeValueAsString(build));
        response.getWriter().flush();
    }

    public static UsernamePasswordAuthenticationToken getAuthentication(HttpServletRequest request) {
        String token = request.getHeader("Authorization");
        if (token != null) {
            String user = Jwts.parser()
                    .setSigningKey(SIGNINGS)
                    .parseClaimsJws(token.replace(BEARER_PREFIX, ""))
                    .getBody()
                    .getSubject();

            if (user != null) {
                return new UsernamePasswordAuthenticationToken(user, null, Collections.emptyList());
            } else {
                throw new RuntimeException("Authentication failed");
            }
        }
        return null;
    }
}

