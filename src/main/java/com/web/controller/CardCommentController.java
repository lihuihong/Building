package com.web.controller;

import com.web.entity.CardComment;
import com.web.entity.CardInfo;
import com.web.entity.CardUser;
import com.web.entity.RspDataVo;
import com.web.services.CardCommentService;
import com.web.services.CardInfoService;
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
            cardComment.setInfoName(cardInfoService.selectByCardInfoId(cardComment.getInfoId()).getInfoName());
        }
        RspDataVo<CardComment> rspDataVo= new RspDataVo<>();
        rspDataVo.setCount(list.size());
        rspDataVo.setData(list);
        return rspDataVo;
    }
}
