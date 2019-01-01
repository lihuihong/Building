package com.web.dao;

import com.web.entity.CardTheme;

import java.util.List;

public interface CardThemeMapper {
    /**
     * 根据请柬主题id删除请柬主题
     * @param themeId
     * @return
     */
    int deleteByPrimaryKey(Integer themeId);

    int insert(CardTheme record);

    int insertSelective(CardTheme record);

    CardTheme selectByPrimaryKey(Integer themeId);

    int updateByPrimaryKeySelective(CardTheme record);

    int updateByPrimaryKey(CardTheme record);

    /**
     * 根据请柬id查询请柬主题
     * @param cardInfoId
     * @return
     */
    CardTheme selectByInfoId(int cardInfoId);

    /**
     * 查询所有请柬主题
     * @return
     */
    List<CardTheme> selectAllCardInfo();
}