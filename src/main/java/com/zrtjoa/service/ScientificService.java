package com.zrtjoa.service;

import com.zrtjoa.entity.Scientific;

import java.util.List;

/**
 * 科研课题管理
 * @author yangli
 * @date 2018/12/25
 */
public interface ScientificService {
    int deleteByPrimaryKey(Integer id);

    int insert(Scientific record);

    int insertSelective(Scientific record);

    Scientific selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Scientific record);

    int updateByPrimaryKey(Scientific record);

    List<Scientific> getList();
}
