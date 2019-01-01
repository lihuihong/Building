package com.web.controller;

import com.web.entity.*;
import com.web.services.CardCommentService;
import com.web.services.CardInfoService;
import com.web.services.CardThemeService;
import com.web.services.CardUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/cardComment")
public class CardCommentController {
    @Autowired
    private CardCommentService cardCommentService;

    @Autowired
    private CardUserService cardUserService;

    @Autowired
    private CardInfoService cardInfoService;
    @Autowired
    private CardThemeService cardThemeService;
    /**
     * 查询所有评论
     *
     * @return
     */
    @RequestMapping("/index.action")
    @ResponseBody
    public RspDataVo<CardComment> index(HttpServletRequest request) {
        List<CardComment> list = cardCommentService.list();
        for (CardComment cardComment : list) {
            cardComment.setUserName(cardUserService.selectById(cardComment.getUserId()).getUserUsername());
            cardComment.setInfoName(cardThemeService.selectByInfoId(cardInfoService.selectByCardInfoId(cardComment.getInfoId()).getInfoId()).getThemeName());
        }
        RspDataVo<CardComment> rspDataVo= new RspDataVo<>();
        rspDataVo.setCount(list.size());
        rspDataVo.setData(list);
        return rspDataVo;
    }

    /**
     * 用户评论内容修改
     * @param cardComment
     * @return
     */
    @RequestMapping("/edit.json")
    @ResponseBody
    public Result edit(CardComment cardComment) {
        int i = cardCommentService.updateByPrimaryKeySelective(cardComment);
        if (i!=0){
            return Result.success();
        }else {
            return Result.error("修改失败");
        }
    }

    @RequestMapping("/pass.json")
    @ResponseBody
    public Result pass(String commentId,String commentType) {
        CardComment cardComment = new CardComment();
        cardComment.setCommentId(Integer.valueOf(commentId));
        cardComment.setCommentType(commentType);
        int i = cardCommentService.updateByPrimaryKeySelective(cardComment);
        if (i!=0){
            return Result.success();
        }else {
            return Result.error("修改失败");
        }
    }
}
