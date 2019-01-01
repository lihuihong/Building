package com.web.services;

import com.web.dao.CardInfoMapper;
import com.web.entity.CardInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("CardInfoService")
public class CardInfoService {
    @Autowired
    private CardInfoMapper cardInfoMapper;

    /**
     * 查询请柬全部信息
     *
     * @return
     */
    public List<CardInfo> list() {
        return cardInfoMapper.list();
    }

    /**
     * 根据用户id查询请柬信息
     *
     * @param userId
     * @return
     */
    public List<CardInfo> selectByUserId(int userId) {
        return cardInfoMapper.selectByUserId(userId);
    }

    /**
     * 根据请柬id获取请柬信息
     * @param cardInfoId
     * @return
     */
    public CardInfo selectByCardInfoId(int cardInfoId){
        return cardInfoMapper.selectByPrimaryKey(cardInfoId);
    }

    /**
     * 根据请柬id删除请柬信息
     * @param cardInfoId
     */
    public void deleteByPrimaryKey(int cardInfoId){
        cardInfoMapper.deleteByPrimaryKey(cardInfoId);
    }

    /**
     * 新增或修改请柬信息
     * @param cardInfo
     */
    public void saveCardInfo(CardInfo cardInfo) {
        //判断修改还是新增
        if (cardInfo.getInfoId() != null || cardInfo.getInfoId() != 0) {
            //修改请柬信息
            cardInfoMapper.updateByPrimaryKeySelective(cardInfo);
        } else {
            //新增请柬信息
            cardInfoMapper.insert(cardInfo);
        }
    }



}
