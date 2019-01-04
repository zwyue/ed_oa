package com.zrtjoa.controller.log;

import com.zrtjoa.common.BaseController;
import com.zrtjoa.entity.Teacher;
import com.zrtjoa.entity.WorkPlan;
import com.zrtjoa.service.WorkPlanService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.zrtjoa.constant.SysConstant.Punctuation.COMMA;

/**
 * 日志管理-工作计划管理
 * @author yangli
 * @date 2018/12/25
 */
@Controller
@RequestMapping("/workplan")
public class WorkPlanController extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger(WorkPlanController.class);

    @Autowired
    private WorkPlanService workPlanService;

    /**
     * 日志管理-工作计划列表
     * @author yangli
     * @date 2018/11/28 14:10
     */
    @RequestMapping(value = "list" ,method = RequestMethod.GET)
    public String getList(Model model,HttpSession httpSession){
        Teacher teacher = getLoginUser(httpSession);
        Map map = new HashMap();
        map.put("classids", Arrays.asList(teacher.getClassid().split(COMMA)));
        List<WorkPlan> list = workPlanService.getList(map);
        model.addAttribute("list",list);
        return "log/workplan/workplan_list";
    }

    /**
     * 日志管理-工作计划新增页面
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "add" ,method = RequestMethod.GET)
    public String add(){
        return "log/workplan/workplan_add";
    }

    /**
     * 工作计划新增保存
     * @author yangli
     * @date 2018/11/28 14:10
     */
    @RequestMapping(value = "save" ,method = RequestMethod.POST)
    @ResponseBody
    public String save(WorkPlan workPlan, HttpSession httpSession){
        Teacher teacher = getLoginUser(httpSession);
        workPlan.setTid(teacher.getId());
        workPlan.setTname(teacher.getTname());
        workPlanService.insert(workPlan);
        return "{ \"msg\":\"success\"}";
    }

    /**
     * 日志管理-工作计划修改页面
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "query" ,method = RequestMethod.GET)
    public String query(Integer id,Model model){
        WorkPlan workPlan = workPlanService.selectByPrimaryKey(id);
        model.addAttribute("workplan",workPlan);
        return "log/workplan/workplan_update";
    }

    /**
     * 日志管理-工作计划修改
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "update" ,method = RequestMethod.POST)
    @ResponseBody
    public String update(WorkPlan workPlan){
        workPlan.setTid(1);
        workPlan.setTname("username");
        workPlanService.updateByPrimaryKey(workPlan);
        return "{ \"msg\":\"success\"}";
    }

    /**
     * 日志管理-工作计划删除
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "delete",method = RequestMethod.GET)
    public String delete(Integer id){
        workPlanService.deleteByPrimaryKey(id);
        return "redirect:/workplan/list";
    }
}