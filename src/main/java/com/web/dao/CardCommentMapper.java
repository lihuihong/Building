package com.web.dao;

import com.web.entity.CardComment;

import java.util.List;

public interface CardCommentMapper {
    int deleteByPrimaryKey(Integer commentId);

    int insert(CardComment record);

    int insertSelective(CardComment record);

    CardComment selectByPrimaryKey(Integer commentId);

    int updateByPrimaryKeySelective(CardComment record);

    int updateByPrimaryKey(CardComment record);

    List<CardComment> list();
}