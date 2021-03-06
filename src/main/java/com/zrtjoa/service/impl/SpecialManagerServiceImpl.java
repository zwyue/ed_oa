package com.zrtjoa.service.impl;

import com.zrtjoa.annotation.PagingQuery;
import com.zrtjoa.dao.SpecialManagerDao;
import com.zrtjoa.entity.SpecialManager;
import com.zrtjoa.service.SpecialManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 特殊学员管理
 * @author yangli
 * @date 2018/12/25
 */
@Service
public class SpecialManagerServiceImpl implements SpecialManagerService {

    @Autowired
    private SpecialManagerDao specialManagerDao;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return specialManagerDao.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(SpecialManager record) {
        return specialManagerDao.insert(record);
    }

    @Override
    public int insertSelective(SpecialManager record) {
        return specialManagerDao.insertSelective(record);
    }

    @Override
    public SpecialManager selectByPrimaryKey(Integer id) {
        return specialManagerDao.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(SpecialManager record) {
        return specialManagerDao.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(SpecialManager record) {
        return specialManagerDao.updateByPrimaryKey(record);
    }

    @Override
    @PagingQuery
    public List<SpecialManager> getList(Map map) {
        return specialManagerDao.getList(map);
    }

    @Override
    @PagingQuery
    public List<SpecialManager> getNameTypes(Map map,String name, String types) {
        return specialManagerDao.getNameTypes(map, name, types);
    }
}
