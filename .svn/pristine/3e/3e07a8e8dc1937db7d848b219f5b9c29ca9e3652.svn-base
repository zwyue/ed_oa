package com.zrtjoa.service.impl;

import com.zrtjoa.annotation.PagingQuery;
import com.zrtjoa.dao.CoursesDao;
import com.zrtjoa.entity.Courses;
import com.zrtjoa.entity.WeekClass;
import com.zrtjoa.enums.WeekEnum;
import com.zrtjoa.service.CourseService;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import static com.zrtjoa.constant.SysConstant.Punctuation.COMMA;

/**
 * copyright    <a href="http://www.qaqavr.com/>中锐</a>
 * <pre>
 *     @author      zwy
 *     @date        2018/12/6 15:33
 *     email        1092478224@qq.com
 *     desc         课程管理接口实现类
 * </pre>
 */
@Service
public class CourseServiceImpl implements CourseService {

    @Autowired
    private CoursesDao coursesDao ;


    @Override
    @PagingQuery
    public List<WeekClass> queryCourseList(Courses courses) {

        List<Courses> coursesList = coursesDao.queryCourseList(courses);

        List<WeekClass> weekList = new ArrayList<>();

        //按教室分组，以教室名作为map的key
        Map<String,List<Courses>> courseMapList = coursesList.stream().collect(Collectors.groupingBy(c->c.getClassroom()));

        courseMapList.keySet().forEach(key->{
            WeekClass wc = new WeekClass();
            courseMapList.get(key).forEach(value->{
                if(StringUtils.isBlank(wc.getClassroom())){
                    wc.setClassroom(value.getClassroom());
                }
                switch (WeekEnum.returnDayByCode(value.getWeek())){
                    case MONDAY:wc.setMonday(value.getClasses()+ COMMA +value.getTeacher());break;
                    case TUESDAY:wc.setTuesday(value.getClasses()+ COMMA +value.getTeacher());break;
                    case WEDNESDAY:wc.setWednesday(value.getClasses()+ COMMA +value.getTeacher());break;
                    case THURSDAY:wc.setThursday(value.getClasses()+ COMMA +value.getTeacher());break;
                    case FRIDAY:wc.setFriday(value.getClasses()+ COMMA +value.getTeacher());break;
                    default:case SATURDAY:
                }
            });
            weekList.add(wc);
        });
        return weekList ;
    }
}
