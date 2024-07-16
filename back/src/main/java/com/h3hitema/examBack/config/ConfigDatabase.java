package com.h3hitema.examBack.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@Configuration
@Import(DatabaseConfig.class)
@EnableJpaAuditing(auditorAwareRef = "springSecurityAuditorAware")
public class ConfigDatabase {
}
