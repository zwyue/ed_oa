package com.zrtjoa.dao;

import com.zrtjoa.entity.AwardRecord;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AwardRecordDao {
    int deleteByPrimaryKey(Integer id);

    int insert(AwardRecord record);

    int insertSelective(AwardRecord record);

    AwardRecord selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AwardRecord record);

    int updateByPrimaryKey(AwardRecord record);

    List<AwardRecord> getList();

    List<AwardRecord> getTitleList(String title);
}