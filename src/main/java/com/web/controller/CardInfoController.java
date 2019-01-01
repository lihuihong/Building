package com.web.controller;

import com.web.entity.*;
import com.web.services.CardInfoService;
import com.web.services.CardThemeService;
import com.web.services.CardUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
            cardInfo.setInfoName(selectByInfoId(cardInfo.getInfoId()).getThemeName());
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
    public Result saveCardInfo(CardInfo cardInfo){
        cardInfoService.saveCardInfo(cardInfo);
        return Result.success();
    }

    /**
     * 根据请柬主题id查询请柬信息
     * @return
     */
    public CardTheme selectByInfoId(int InfoId){
        return cardThemeService.selectByInfoId(InfoId);
    }

}
