package com.web.dao;

import com.web.entity.CardTheme;

public interface CardThemeMapper {
    int deleteByPrimaryKey(Integer themeId);

    int insert(CardTheme record);

    int insertSelective(CardTheme record);

    CardTheme selectByPrimaryKey(Integer themeId);

    int updateByPrimaryKeySelective(CardTheme record);

    int updateByPrimaryKey(CardTheme record);
}