package com.github.cheng6563.springcloudconfigsftp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.config.server.EnableConfigServer;

@EnableConfigServer
@SpringBootApplication
public class SpringCloudConfigSftpApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringCloudConfigSftpApplication.class, args);
	}

}
