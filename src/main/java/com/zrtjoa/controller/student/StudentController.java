package com.zrtjoa.controller.student;

import com.github.pagehelper.PageInfo;
import com.zrtjoa.common.BaseController;
import com.zrtjoa.common.ResultUtils;
import com.zrtjoa.entity.Student;
import com.zrtjoa.entity.StudentEnter;
import com.zrtjoa.service.StudentService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.zrtjoa.constant.SysConstant.MAP_DEFAULT_SIZE;
import static com.zrtjoa.exception.ExceptionEnum.DELETE_FAILED;
import static com.zrtjoa.exception.ExceptionEnum.SUCCESS;
import static com.zrtjoa.exception.ExceptionEnum.UPDATE_FAILED;

/**
 * copyright    <a href="http://www.qaqavr.com/>中锐</a>
 * <pre>
 *     @author      zwy
 *     @date        2018/12/20 18:34
 *     email        1092478224@qq.com
 *     desc         学生管理
 * </pre>
 */
@RestController
@RequestMapping("/student")
public class StudentController extends BaseController {

    private final static Logger logger = LoggerFactory.getLogger(StudentController.class);

    @Autowired
    private StudentService studentService ;

    /**
     * 获取学生列表
     *
     * @author zwy
     * @date 2018/12/25 9:57
     */
    @RequestMapping("/list")
    @GET
    public Map studentList(){
        logger.info("===========获取学生信息============");
        List<Student> students = studentService.queryAllStudents();
        PageInfo<Student> pageInfo = new PageInfo<>();
        Map<String,Object> map = new HashMap<>(MAP_DEFAULT_SIZE);
        map.put("list",students);
        map.put("page",pageInfo);
        return ResultUtils.success(map);
    }

    /**
     * 学生报名信息录入
     *      包括报名信息表、学生信息表、花名册表
     *
     * @author zwy
     * @date 2018/12/21 9:30
     */
    @RequestMapping("/enter")
    @POST
    public Map enterStudentInfo(Student student, StudentEnter studentEnter, HttpSession httpSession){
        logger.info("......学生录入(单个)......");
        studentEnter.setTid(1);
        studentEnter.setTname("测试");
//        studentEnter.setTid(getLoginUser(httpSession).getId());
//        studentEnter.setTname(getLoginUser(httpSession).getTname());
        return studentService.enterStudentInfo(student,studentEnter);
    }

    /**
     * 更新学生基本信息
     *
     *
     * @author zwy
     * @date 2018/12/25 10:10
     */
    @RequestMapping("/update-base")
    @GET
    public Map updateStudent(Student student){
        logger.info("============更新学生信息===========");
        Integer isDelete = studentService.updateStudentInfo(student) ;
        if(isDelete>0){
            return ResultUtils.success(SUCCESS.errorCode,SUCCESS.errorMessage);
        }else {
            return ResultUtils.error(UPDATE_FAILED.errorCode,UPDATE_FAILED.errorMessage);
        }
    }

    /**
     * 更新学生报名信息
     *
     * @author zwy
     * @date 2018/12/27 9:46
     */
    @RequestMapping("/update-enter")
    @POST
    public Map updateStudent(StudentEnter studentEnter){
        return studentService.updateEnterInfo(studentEnter);
    }

    /**
     * 学生信息删除
     *
     * @author zwy
     * @date 2018/12/25 11:37
     */
    @RequestMapping("/delete")
    @DELETE
    public Map deleteStudent(Integer stuId){
        logger.info("============删除信息============");
        Integer ifDelete = studentService.deleteStuInfo(stuId);
        if(ifDelete>0) {
            return ResultUtils.success(SUCCESS);
        }else {
            return ResultUtils.error(DELETE_FAILED.errorCode,DELETE_FAILED.errorMessage);
        }
    }
}
