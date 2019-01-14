package com.zrtjoa.service.impl;

import com.zrtjoa.annotation.PagingQuery;
import com.zrtjoa.dao.ScientificDao;
import com.zrtjoa.entity.Scientific;
import com.zrtjoa.service.ScientificService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 科研课题管理
 * @author yangli
 * @date 2018/12/25
 */
@Service
public class ScientificServiceImpl implements ScientificService {

    @Autowired
    private ScientificDao scientificDao;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return scientificDao.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Scientific record) {
        return scientificDao.insert(record);
    }

    @Override
    public int insertSelective(Scientific record) {
        return scientificDao.insertSelective(record);
    }

    @Override
    public Scientific selectByPrimaryKey(Integer id) {
        return scientificDao.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(Scientific record) {
        return scientificDao.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Scientific record) {
        return scientificDao.updateByPrimaryKey(record);
    }

    @Override
    @PagingQuery
    public List<Scientific> getList() {
        return scientificDao.getList();
    }

    @Override
    @PagingQuery
    public List<Scientific> getTitleList(String title) {
        return scientificDao.getTitleList(title);
    }
}
