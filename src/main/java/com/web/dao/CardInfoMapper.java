package com.web.dao;

import com.web.entity.CardInfo;

public interface CardInfoMapper {
    int deleteByPrimaryKey(Integer infoId);

    int insert(CardInfo record);

    int insertSelective(CardInfo record);

    CardInfo selectByPrimaryKey(Integer infoId);

    int updateByPrimaryKeySelective(CardInfo record);

    int updateByPrimaryKey(CardInfo record);
}