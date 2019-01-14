package com.zrtjoa.controller;

import com.github.pagehelper.PageInfo;
import com.zrtjoa.common.BaseController;
import com.zrtjoa.common.ResultUtils;
import com.zrtjoa.constant.SysConstant;
import com.zrtjoa.entity.Courses;
import com.zrtjoa.entity.WeekClass;
import com.zrtjoa.service.CourseService;
import com.zrtjoa.util.ExcelUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.tagext.PageData;
import javax.ws.rs.GET;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;
import java.util.stream.Collectors;

import static com.zrtjoa.constant.SysConstant.MAP_DEFAULT_SIZE;
import static com.zrtjoa.util.FileUtil.setResponseHeader;

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

    /**
     * 导出课程表到excel
     *
     * @author zwy
     * @date 2019/1/7 9:14
     */
    @RequestMapping("export")
    @GET
    @ResponseBody
    public Map exportExcel(HttpServletResponse response,Courses courses){
        try {
            courseService.exportCourse(response,courses);
        }catch (Exception e){
            return ResultUtils.error(e);
        }
        return ResultUtils.success();
    }
}
