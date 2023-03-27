package com.wangpeng.controller;

import com.wangpeng.service.WelcomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("welcome")
public class WelcomeController {

    @Autowired
    WelcomeService service;

    @GetMapping("getAllCount.do")
    public Map<String, Integer> getAllCount() {
        return service.getAllCount();
    }



}
