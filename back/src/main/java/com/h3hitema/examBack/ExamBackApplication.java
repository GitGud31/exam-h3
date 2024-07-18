package com.h3hitema.examBack;

import com.h3hitema.examBack.config.ApplicationProperties;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.liquibase.LiquibaseProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication
@EnableConfigurationProperties({LiquibaseProperties.class, ApplicationProperties.class})
@EnableFeignClients
public class ExamBackApplication {

	public static void main(String[] args) {
		SpringApplication.run(ExamBackApplication.class, args);
	}

}
