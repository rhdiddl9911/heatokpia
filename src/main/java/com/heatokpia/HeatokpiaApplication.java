package com.heatokpia;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackageClasses = HeatokpiaApplication.class)
public class HeatokpiaApplication {

	public static void main(String[] args) {
		SpringApplication.run(HeatokpiaApplication.class, args);
	}

}
