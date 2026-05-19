package com.example.cloudrundemo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class CloudrunDemoApplication {

    public static void main(String[] args) {
        SpringApplication.run(CloudrunDemoApplication.class, args);
    }

    @GetMapping("/")
    public String hello() {
        return "Hello from Java running on Google Cloud Run!";
    }
}
