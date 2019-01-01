package com.web.services;

import com.web.dao.CardCommentMapper;
import com.web.dao.CardUserMapper;
import com.web.entity.CardComment;
import com.web.entity.CardInfo;
import com.web.entity.CardUser;
import com.web.exception.LException;
import com.web.utils.Jiami;
import com.web.utils.MD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sun.misc.BASE64Encoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("CardCommentService")
public class CardCommentService {
    @Autowired
    private CardCommentMapper cardCommentMapper;

    /**
     * 查询全部评论
     *
     * @return
     */
    public List<CardComment> list() {
        return cardCommentMapper.list();
    }


}
