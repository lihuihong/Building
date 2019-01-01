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
@RequestMapping("/cardUserInfo")
public class CardUserInfoController {
    @Autowired
    private CardUserService cardUserService;

    /**
     * 查询所有用户
     *
     * @return
     */
    @RequestMapping("/index.action")
    @ResponseBody
    public RspDataVo<CardUser> index(HttpServletRequest request) {
        RspDataVo<CardUser> cardUserRspDataVo = new RspDataVo<CardUser>();
        List<CardUser> list = cardUserService.selectAllCardUser();
        cardUserRspDataVo.setCount(list.size());
        cardUserRspDataVo.setData(list);
        return cardUserRspDataVo;
    }

    /**
     * 修改该用户信息
     *
     * @return
     */
    @RequestMapping("/userEdit.json")
    @ResponseBody
    public Result userEdit(CardUser cardUser) {
        int i = cardUserService.updateByPrimaryKeySelective(cardUser);
        if (i!=0){
            return Result.success();
        }else {
            return Result.error("修改失败");
        }
    }

    /**
     * 根据用户主键删除用户
     * @param userId
     * @return
     */
    @RequestMapping("/userDelete.json")
    @ResponseBody
    public Result userDelete(Integer userId) {
        int i = cardUserService.deleteByPrimaryKey(userId);
        if (i!=0){
            return Result.success();
        }else {
            return Result.error("删除失败");
        }
    }

}
