package com.zrtjoa.dao;

import com.zrtjoa.entity.MeetRecord;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface MeetRecordDao {
    int deleteByPrimaryKey(Integer id);

    int insert(MeetRecord record);

    int insertSelective(MeetRecord record);

    MeetRecord selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MeetRecord record);

    int updateByPrimaryKey(MeetRecord record);

    List<MeetRecord> getList(Map map);

    List<MeetRecord> getTitleList(Map map,String content);
}