package com.drivz.commonLibrary;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
@EnableJpaAuditing
public class DrivzCommonLibraryApplication {

	public static void main(String[] args) {
		SpringApplication.run(DrivzCommonLibraryApplication.class, args);
	}

}
