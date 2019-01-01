package com.web.controller;

import com.web.entity.CardInfo;
import com.web.services.CardInfoService;
import com.web.services.CardThemeService;
import com.web.services.CardUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/page")
public class PageController {

    @RequestMapping("/{name}")
    public String go(@PathVariable("name") String name){

        return name;
    }

    @RequestMapping("/{name}/{forwd}")
    public String go(@PathVariable("name") String name,@PathVariable("forwd") String forwd){
        return name+"/"+forwd;
    }

    @RequestMapping("/{name}/{forwd}/{pg}")
    public String go(@PathVariable("name") String name,@PathVariable("forwd") String forwd,@PathVariable("pg") String pg){
        return name+"/"+forwd+"/"+pg;
    }

}
