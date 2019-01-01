package com.web.controller;

import com.sun.net.httpserver.HttpsServer;
import com.web.entity.*;
import com.web.services.CardInfoService;
import com.web.services.CardThemeService;
import com.web.services.CardUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 请柬内容操作
 */
@Controller
@RequestMapping("/cardInfo")
public class CardInfoController {
    @Autowired
    private CardUserService cardUserService;
    @Autowired
    private CardInfoService cardInfoService;
    @Autowired
    private CardThemeService cardThemeService;

    /**
     * 查询所有请柬
     *
     * @return
     */
    @RequestMapping("/allCard.json")
    @ResponseBody
    public RspDataVo<CardInfo> allCard(HttpServletRequest request) {

        RspDataVo<CardInfo> cardThemeRspDataVo = new RspDataVo<CardInfo>();

        List<CardInfo> list = cardInfoService.list();

        cardThemeRspDataVo.setCount(list.size());
        cardThemeRspDataVo.setData(list);

        return cardThemeRspDataVo;
    }

    /**
     * 查询该用户所有请柬
     *
     * @return
     */
    @RequestMapping("/index.action")
    @ResponseBody
    public RspDataVo<CardInfo> index(HttpServletRequest request) {
        CardUser userInfo = (CardUser) request.getSession().getAttribute("userInfo");
        Integer userId = userInfo.getUserId();
        RspDataVo<CardInfo> cardThemeRspDataVo = new RspDataVo<CardInfo>();
        List<CardInfo> list = cardInfoService.selectByUserId(userId);
        for (CardInfo cardInfo : list) {
            cardInfo.setInfoName(selectByInfoId(Integer.parseInt(cardInfo.getInfoName())).getThemeName());
            cardInfo.setUserName(cardUserService.selectById(cardInfo.getUserId()).getUserUsername());
        }
        cardThemeRspDataVo.setCount(list.size());
        cardThemeRspDataVo.setData(list);
        return cardThemeRspDataVo;
    }

    /**
     * 查询该用户所有请柬
     *
     * @return
     */
    @RequestMapping("/list.action")
    @ResponseBody
    public RspDataVo<CardInfo> list(HttpServletRequest request) {
        RspDataVo<CardInfo> cardThemeRspDataVo = new RspDataVo<CardInfo>();
        List<CardInfo> list = cardInfoService.list();
        for (CardInfo cardInfo : list) {
            cardInfo.setInfoName(selectByInfoId(Integer.parseInt(cardInfo.getInfoName())).getThemeName());
            cardInfo.setUserName(cardUserService.selectById(cardInfo.getUserId()).getUserUsername());
        }
        cardThemeRspDataVo.setCount(list.size());
        cardThemeRspDataVo.setData(list);
        return cardThemeRspDataVo;
    }

    /**
     * 保存请柬
     * @param cardInfo
     */
    @RequestMapping("/saveCardInfo.json")
    @ResponseBody
    public Result saveCardInfo(CardInfo cardInfo){
        cardInfoService.saveCardInfo(cardInfo);
        return Result.success();
    }

    /**
     * 根据请柬主题id查询请柬信息
     * @return
     */
    @RequestMapping("/goCardById")
    public String cardById(@RequestParam("id") int InfoId, Model model){

        CardInfo info = cardInfoService.selectByCardInfoId(InfoId);

        model.addAttribute("cardInfo",info);
        return "cardInfo";
    }

    /**
     * 添加请柬
     * @return
     */
    @RequestMapping("/goCardAdd")
    public String goCardAdd(HttpServletRequest request){


        CardUser user = (CardUser) request.getSession().getAttribute("userInfo");

        if(user == null){
            return "/web/login";
        }else{
            List<CardTheme> cardThemes = cardThemeService.selectAllCardInfo();
            request.setAttribute("cardTheme",cardThemes);
            return "/web/cardInfoAdd";
        }
    }


    /**
     * 根据请柬主题id查询请柬信息
     * @return
     */
    @RequestMapping("/goMyCard")
    public String goMyCard(Model model, HttpServletRequest request){

        CardUser user = (CardUser) request.getSession().getAttribute("userInfo");

        List<CardInfo> list = cardInfoService.selectByUserId(user.getUserId());

        model.addAttribute("mycard",list);

        return "/web/mycard";
    }

    /**
     * 根据请柬主题id查询请柬信息
     * @return
     */
    public CardTheme selectByInfoId(int InfoId){
        return cardThemeService.selectByInfoId(InfoId);
    }

    @RequestMapping("/deleteCardInfo.json")
    @ResponseBody
    public Result deleteCardInfo(int InfoId){
         cardInfoService.deleteByPrimaryKey(InfoId);
        return Result.success();
    }

}
