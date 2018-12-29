package com.web.dao;

import com.web.entity.CardUser;
import org.apache.ibatis.annotations.Param;


public interface CardUserMapper {
    /**
     * 根据主键删除用户信息
     * @param userId
     * @return
     */
    int deleteByPrimaryKey(Integer userId);

    /**
     * 插入用户信息
     * @param cardUser
     * @return
     */
    int insert(CardUser cardUser);

    int insertSelective(CardUser record);

    /**
     * 根据主键查询用户信息
     * @param userId
     * @return
     */
    CardUser selectByPrimaryKey(Integer userId);

    /**
     * 根据主键更新用户信息
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(CardUser record);

    int updateByPrimaryKey(CardUser record);
    /**
     * 校验用户
     * @param userName 登录名
     * @param passWord 登录密码
     * @return
     */
    CardUser checkUser(@Param("userName") String userName, @Param("passWord") String passWord);
    /**
     * 根据旧密码，判断查询用户
     * @param password
     * @return
     */
    CardUser selectByPassword(@Param("password") String password, @Param("id")int id);

    /**
     * 根据用户id查询信息
     * @param id
     * @return
     */
    CardUser selectById(int id);

}