package com.zrtjoa.dao;

import com.zrtjoa.entity.InforRemind;
import org.springframework.stereotype.Repository;

@Repository
public interface InforRemindDao {
    int deleteByPrimaryKey(Integer id);

    int insert(InforRemind record);

    int insertSelective(InforRemind record);

    InforRemind selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(InforRemind record);

    int updateByPrimaryKey(InforRemind record);
}