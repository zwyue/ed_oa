package com.zrtjoa.dao;

import com.zrtjoa.entity.Scientific;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ScientificDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Scientific record);

    int insertSelective(Scientific record);

    Scientific selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Scientific record);

    int updateByPrimaryKey(Scientific record);

    List<Scientific> getList();
}