package com.web.services;

import com.web.dao.CardThemeMapper;
import com.web.entity.CardTheme;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CardThemeService {
    @Autowired
    private CardThemeMapper cardThemeMapper;

    /**
     * 根据请柬id查询请柬主题
     * @param cardInfoId
     * @return
     */
    public CardTheme selectByInfoId(int cardInfoId ){
        return cardThemeMapper.selectByInfoId(cardInfoId);
    }

    /**
     * 添加请柬主题
     * @param cardTheme
     * @return
     */
    public int insert(CardTheme cardTheme ){
        if (cardTheme.getThemeId()!=0||cardTheme.getThemeId()!=null){
            //修改请柬主题
            return cardThemeMapper.updateByPrimaryKeySelective(cardTheme);
        }else {
            //添加请柬主题
            return cardThemeMapper.insert(cardTheme);
        }

    }

    /**
     * 根据请柬主题id修改请柬主题
     * @param cardTheme
     * @return
     */
    public int updateByPrimaryKey(CardTheme cardTheme){
        return cardThemeMapper.updateByPrimaryKey(cardTheme);
    }

    /**
     * 根据请柬主题id删除请柬主题
     * @param themeId
     */
    public void deleteByPrimaryKey(Integer themeId){
        cardThemeMapper.deleteByPrimaryKey(themeId);
    }
}
