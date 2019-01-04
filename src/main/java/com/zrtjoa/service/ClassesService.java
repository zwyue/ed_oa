package com.zrtjoa.service;

import com.zrtjoa.entity.Classes;

import java.util.List;

/**
 * 班级管理
 * @author yangli
 * @date 2018/12/25
 */
public interface ClassesService {
    int deleteByPrimaryKey(Integer id);

    int insert(Classes record);

    int insertSelective(Classes record);

    Classes selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Classes record);

    int updateByPrimaryKey(Classes record);

    List<Classes> getList();

    List<Classes> byNameList(String name);

    List<Classes> getCList(Integer majorid);

    List<Classes> getTeaClasslist(Integer headmaster);

}
