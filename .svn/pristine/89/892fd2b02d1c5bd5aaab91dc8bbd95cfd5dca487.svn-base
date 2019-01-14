package com.zrtjoa.service.impl;

import com.zrtjoa.annotation.PagingQuery;
import com.zrtjoa.dao.ActivitiesDao;
import com.zrtjoa.entity.Activities;
import com.zrtjoa.service.ActivitiesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 校园活动管理
 * @author yangli
 * @date 2018/12/25
 */
@Service
public class ActivitiesServiceImpl implements ActivitiesService {

    @Autowired
    private ActivitiesDao activitiesDao;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return activitiesDao.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Activities record) {
        return activitiesDao.insert(record);
    }

    @Override
    public int insertSelective(Activities record) {
        return activitiesDao.insertSelective(record);
    }

    @Override
    public Activities selectByPrimaryKey(Integer id) {
        return activitiesDao.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(Activities record) {
        return activitiesDao.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Activities record) {
        return activitiesDao.updateByPrimaryKey(record);
    }

    @Override
    @PagingQuery
    public List<Activities> getList() {
        return activitiesDao.getList();
    }

    @Override
    @PagingQuery
    public List<Activities> getTitleList(String title) {
        return activitiesDao.getTitleList(title);
    }
}
