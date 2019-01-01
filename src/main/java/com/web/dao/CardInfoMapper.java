package com.web.dao;

import com.web.entity.CardInfo;

import java.util.List;


public interface CardInfoMapper {
    /**
     * 根据请柬表id删除请柬信息
     * @param infoId
     * @return
     */
    int deleteByPrimaryKey(Integer infoId);

    /**
     * 插入请柬信息
     * @param record
     * @return
     */
    int insert(CardInfo record);

    /**
     * 选择性插入请柬信息
     * @param record
     * @return
     */
    int insertSelective(CardInfo record);

    /**
     * 根据请柬表id查询请柬信息
     * @param infoId
     * @return
     */
    CardInfo selectByPrimaryKey(Integer infoId);

    /**
     * 根据请柬表id更新请柬信息 选择性
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(CardInfo record);

    /**
     * 根据请柬表id更新请柬信息
     * @param record
     * @return
     */
    int updateByPrimaryKey(CardInfo record);

    /**
     * 查询请柬全部信息
     * @return
     */
    List<CardInfo> list();

    /**
     * 通过用户id查询请柬信息
     * @return
     */
    List<CardInfo> selectByUserId(int userId);

    /**
     * 根据请柬主题id查询请柬信息
     * @param InfoId
     * @return
     */
    List<CardInfo> selectByInfoId(int InfoId);
}