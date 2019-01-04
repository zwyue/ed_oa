package com.zrtjoa.service.impl;

import com.zrtjoa.dao.ClassesDao;
import com.zrtjoa.entity.Category;
import com.zrtjoa.entity.Classes;
import com.zrtjoa.service.ClassesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 班级管理
 * @author yangli
 * @date 2018/12/25
 */
@Service
public class ClassesServiceImpl implements ClassesService {

    @Autowired
    private ClassesDao classesDao;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return classesDao.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Classes record) {
        return classesDao.insert(record);
    }

    @Override
    public int insertSelective(Classes record) {
        return classesDao.insertSelective(record);
    }

    @Override
    public Classes selectByPrimaryKey(Integer id) {
        return classesDao.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(Classes record) {
        return classesDao.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Classes record) {
        return classesDao.updateByPrimaryKey(record);
    }

    @Override
    public List<Classes> getList() {
        return classesDao.getList();
    }

    @Override
    public List<Classes> byNameList(String name) {
        return classesDao.byNameList(name);
    }

    @Override
    public List<Classes> getCList(Integer majorid) {
        return classesDao.getCList(majorid);
    }

    @Override
    public List<Classes> getTeaClasslist(Integer headmaster) {
        return classesDao.getTeaClasslist(headmaster);
    }


}
