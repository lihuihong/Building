package com.web.services;

import com.web.dao.CardUserMapper;
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

@Service("CardUserService")
public class CardUserService {
    @Autowired
    private CardUserMapper cardUserMapper;

    /**
     * 用户登录
     *
     * @param request
     * @return
     * @throws LException
     */
    public Map<String, Object> selectUser(HttpServletRequest request) throws LException {
        //获取登录参数
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        //校验用户名、密码是否正确
        CardUser user = selectUser(username, MD5.md5(password));
        if (user == null) {
            throw new LException("账号或密码错误");
        }

        //将用户信息保存进session
        request.getSession().setAttribute("userInfo", user);
        //对用户信息进行加密，用于cookie存储
        // 用户的登录名和密码
        String userToken = Jiami.getInstance().encrypt(username) + "&&" + Jiami.getInstance().encrypt(password);
        // 将用户名转为没有特殊字符的base64编码
        BASE64Encoder encoder = new BASE64Encoder();
        userToken = encoder.encode(userToken.getBytes());

        Map<String, Object> info = new HashMap<String, Object>();
        info.put("userToken", userToken);
        return info;
    }

    /**
     * 校验用户登录
     *
     * @param username 登录名
     * @param password 登录密码
     * @return
     */
    public CardUser selectUser(String username, String password) {
        return cardUserMapper.checkUser(username, password);
    }

    /**
     * 用户注册
     *
     * @param request
     * @return
     */
    public Map<String, Object> regist(HttpServletRequest request) {
        //获取注册参数
        String username = request.getParameter("userName");
        String password = request.getParameter("passWord");
        String userTel = request.getParameter("userTel");
        CardUser cardUser = new CardUser();
        cardUser.setUserUsername(username);
        cardUser.setUserPassword(MD5.md5(password));
        if (userTel != null){
            cardUser.setUserTel(userTel);
        }
        //设置用户类型（0，普通用户 1，管理员用户）
        cardUser.setUserType(0);
        cardUserMapper.insertSelective(cardUser);
        // 对用户信息进行加密，用于cookie存储
        // 用户的登录名和密码
        String userToken = Jiami.getInstance().encrypt(username) + "&&" + Jiami.getInstance().encrypt(password);
        // 将用户名转为没有特殊字符的base64编码
        BASE64Encoder encoder = new BASE64Encoder();
        userToken = encoder.encode(userToken.getBytes());

        Map<String, Object> info = new HashMap<String, Object>();
        info.put("userToken", userToken);
        return info;
    }

    /**
     * 用户修改密码
     *
     * @param oldPassword
     * @param newPassword1
     * @param newPassword2
     */
    public void updateNewPassword(HttpServletRequest request, String oldPassword, String newPassword1, String newPassword2) throws LException {
        //得到当前用户登录的id
        String userId = String.valueOf(request.getSession().getAttribute("user"));
        if (oldPassword == null && oldPassword == "") {
            throw new LException("输入旧密码不能为空");
        }
        if (newPassword1 == null && newPassword1 == "") {
            throw new LException("输入新密码不能为空");
        }
        if (newPassword2 == null && newPassword2 == "") {
            throw new LException("再次输入新密码不能为空");
        }
        // 从session中取用户信息
        // 判断session
        HttpSession session = request.getSession();
        // 从session中取出用户身份信息
        CardUser user1 = (CardUser) session.getAttribute("userInfo");
        //根据旧密码，判断查询用户
        CardUser user = cardUserMapper.selectByPassword(MD5.md5(oldPassword), user1.getUserId());
        if (user == null) {
            throw new LException("旧密码错误");
        }
        //校验新密码
        newPassword1 = newPassword1.replaceAll("\\s*", "");
        if (newPassword1.length() < 6 || newPassword1.length() > 16) {
            throw new LException("密码长度应为6到16个字符");
        }
        //校验新密码两次输入是否一致
        if (!newPassword1.equals(newPassword2)) {
            throw new LException("两次新密码不一致");
        }
        //更新新密码
        user.setUserUsername(MD5.md5(newPassword1));
        user.setUserId(Integer.valueOf(userId));
        cardUserMapper.updateByPrimaryKeySelective(user);
    }

    /**
     * 根据用户id查询信息
     *
     * @param id
     * @return
     */
    public CardUser selectById(int id) {
        return cardUserMapper.selectByPrimaryKey(id);
    }

    /**
     * 查询所有用户
     * @return
     */
    public List<CardUser> selectAllCardUser(){
        List<CardUser> cardUsers = cardUserMapper.selectAllCardUser();
        return cardUsers;
    }

    /**
     * 根据用户id修改用户信息
     * @return
     */
    public int updateByPrimaryKeySelective(CardUser cardUser){
        return cardUserMapper.updateByPrimaryKeySelective(cardUser);
    }

    /**
     * 根据主键删除用户
     * @param userId
     * @return
     */
    public int deleteByPrimaryKey(Integer userId){
        return cardUserMapper.deleteByPrimaryKey(userId);
    }

}
