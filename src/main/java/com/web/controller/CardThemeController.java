package com.web.controller;

import com.web.entity.CardComment;
import com.web.entity.CardTheme;
import com.web.entity.RspDataVo;
import com.web.services.CardThemeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/cardTheme")
public class CardThemeController {
    @Autowired
    private CardThemeService cardThemeService;

    /**
     * 根据请柬主题id查询请柬主题
     *
     * @param cardInfoId
     * @return
     */
    @RequestMapping("/selectByInfoId.action")
    @ResponseBody
    public CardTheme selectByInfoId(int cardInfoId) {
        return cardThemeService.selectByInfoId(cardInfoId);
    }

    /**
     * 添加或修改请柬主题
     *
     * @param cardTheme
     * @return
     */
    @RequestMapping("/saveCardTheme.action")
    @ResponseBody
    public int saveCardTheme(CardTheme cardTheme) {
        return cardThemeService.insert(cardTheme);
    }

    /**
     * 根据请柬主题id删除请柬主题
     *
     * @param cardInfoId
     */
    @RequestMapping("/deleteCardTheme.json")
    @ResponseBody
    public void deleteCardTheme(int cardInfoId) {
        cardThemeService.deleteByPrimaryKey(cardInfoId);
    }

    /**
     * 查询所有请柬主题
     *
     * @return
     */
    @RequestMapping("/cardThemeInfo.action")
    @ResponseBody
    public RspDataVo<CardTheme> cardThemeInfo() {
        List<CardTheme> cardThemes = cardThemeService.selectAllCardInfo();
        RspDataVo<CardTheme> rspDataVo= new RspDataVo<>();
        rspDataVo.setCount(cardThemes.size());
        rspDataVo.setData(cardThemes);
        return rspDataVo;
    }
}
