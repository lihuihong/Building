package com.web.controller;

import com.web.entity.CardInfo;
import com.web.entity.CardTheme;
import com.web.entity.CardUser;
import com.web.services.CardInfoService;
import com.web.services.CardThemeService;
import com.web.services.CardUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/web")
public class WebController {

    @Autowired
    private CardInfoService cardInfoService;
    @Autowired
    private CardThemeService cardThemeService;
    @Autowired
    private CardUserService cardUserService;

    //通过请柬id获取请柬信息
    @RequestMapping("/fromInfo.action")
    public String fromDelete(ModelMap map, HttpServletRequest request){
        //获取
        int id = Integer.parseInt(request.getParameter("id"));
        CardInfo cardInfo = cardInfoService.selectByCardInfoId(id);
        cardInfo.setInfoName(cardThemeService.selectByInfoId(Integer.parseInt(cardInfo.getInfoName())).getThemeName());
        cardInfo.setUserName(cardUserService.selectById(cardInfo.getUserId()).getUserUsername());
        map.put("data",cardInfo);
        return "/from/fromList";
    }
    //通过请柬id获取请柬信息
    @RequestMapping("/fromEdit.action")
    public String fromEdit(ModelMap map, HttpServletRequest request){
        //获取
        int id = Integer.parseInt(request.getParameter("id"));
        CardInfo cardInfo = cardInfoService.selectByCardInfoId(id);
        cardInfo.setInfoName(cardThemeService.selectByInfoId(Integer.parseInt(cardInfo.getInfoName())).getThemeName());
        cardInfo.setUserName(cardUserService.selectById(cardInfo.getUserId()).getUserUsername());
        map.put("data",cardInfo);
        return "/from/fromEdit";
    }

    //添加请柬信息
    @RequestMapping("/fromSend.action")
    public String fromSend(ModelMap map){
        List<CardTheme> cardThemes = cardThemeService.selectAllCardInfo();
        List<CardUser> cardUsers = cardUserService.selectAllCardUser();
        map.put("cardTheme",cardThemes);
        map.put("cardUsers",cardUsers);
        return "/from/fromSend";
    }

    //通过用户id获取用户信息(修改)
    @RequestMapping("/fromUserInfoEdit.action")
    public String cardUserInfo(ModelMap map, HttpServletRequest request){
        //获取
        int userId = Integer.parseInt(request.getParameter("userId"));
        CardUser cardUser = cardUserService.selectById(userId);
        map.put("cardUser",cardUser);
        return "/from/fromUserInfoEdit";
    }

    //用户管理跳转
    @RequestMapping("/userInfo.action")
    public String userInfo(){
        return "/userInfo";
    }
    //请柬管理跳转
    @RequestMapping("/index.action")
    public String index(){
        return "/index";
    }
    //请柬主题管理跳转
    @RequestMapping("/cardTheme.action")
    public String cardTheme(){
        return "/cardTheme";
    }
    //评论管理跳转
    @RequestMapping("/cardComment.action")
    public String cardComment(){
        return "/cardComment";
    }
}
