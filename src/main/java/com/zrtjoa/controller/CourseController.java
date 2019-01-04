package com.zrtjoa.controller;

import com.github.pagehelper.PageInfo;
import com.zrtjoa.common.BaseController;
import com.zrtjoa.entity.Courses;
import com.zrtjoa.entity.WeekClass;
import com.zrtjoa.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;
import java.util.Map;

/**
 * copyright    <a href="http://www.qaqavr.com/>中锐</a>
 * <pre>
 *     @author      zwy
 *     @date        2018/12/6 15:30
 *     email        1092478224@qq.com
 *     desc         课程管理
 * </pre>
 */
@Controller
@RequestMapping("course")
public class CourseController extends BaseController {

    @Autowired
    private CourseService courseService ;

    /**
     * 查看课程表
     *
     * @author zwy
     * @date 2018/12/6 15:36
     */
    @RequestMapping(value = "scanCurriculum",method = RequestMethod.GET)
    public String scanCurriculum(Model model, Courses courses){
        List<WeekClass> weekClasses = courseService.queryCourseList(courses);
        model.addAttribute("list",weekClasses);
//        model.addAttribute("page",new PageInfo<Courses>((List<Courses>) map.get("courses")));
        return "/course/course_schedule";
    }
}
