package com.kjabs.springinit1;

import java.io.File;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.kjabs.springinit1.controller.AdminController;

@SpringBootApplication
public class Springinit1Application {

	public static void main(String[] args) {
		new File(AdminController.uploadDirectory).mkdir();
		SpringApplication.run(Springinit1Application.class, args);
	}

}
