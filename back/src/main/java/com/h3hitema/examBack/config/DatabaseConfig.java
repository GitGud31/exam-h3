package com.h3hitema.examBack.config;

import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.transaction.annotation.EnableTransactionManagement;


@Configuration
@EnableJpaRepositories("com.h3hitema.examBack.repository")
@EntityScan("com.h3hitema.examBack.model")
@EnableTransactionManagement
public class DatabaseConfig {
}
