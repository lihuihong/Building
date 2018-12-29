package com.web.controller;

import com.web.entity.Result;
import com.web.services.CardUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller("/user")
public class LoginController {

    @Autowired
    private CardUserService userService;
    /**
     * 登录界面跳转
     */
    @RequestMapping("/login.action")
    public String to_login(HttpServletRequest request){
        request.setAttribute("select","login");
        request.setAttribute("refererUrl",request.getHeader("Referer"));
        return "/login";
    }
    /**
     * 注册界面跳转
     */
    @RequestMapping("/register.action")
    public String to_register(HttpServletRequest request){
        request.setAttribute("select","register");
        request.setAttribute("refererUrl",request.getHeader("Referer"));
        return "/register";
    }
    /**
     * 用户登录
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/login.json",method = RequestMethod.POST)
    @ResponseBody
    public Result login(HttpServletRequest request) throws Exception {
        Map<String, Object> info = userService.selectUser(request);
        return Result.success().add("info", info);
    }
    /**
     * 用户注册
     * @throws Exception
     */
    @RequestMapping(value = "/register.json",method = RequestMethod.POST)
    @ResponseBody
    public Result show_register(HttpServletRequest request) throws Exception {
        Map<String, Object> info = userService.regist(request);
        return Result.success().add("info", info);
    }


}
