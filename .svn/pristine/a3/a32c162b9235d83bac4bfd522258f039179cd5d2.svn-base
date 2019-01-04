package com.zrtjoa.controller.log;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zrtjoa.common.BaseController;
import com.zrtjoa.entity.Teacher;
import com.zrtjoa.entity.WorkSummary;
import com.zrtjoa.service.WorkSummaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 日志管理-班主任工作总结管理
 * @author yangli
 * @date 2018/12/25
 */
@Controller
@RequestMapping("/worksummary")
public class WorkSummaryComtroller extends BaseController {

    @Autowired
    private WorkSummaryService workSummaryService;

    /**
     * 日志管理-班主任工作总结列表
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "list",method = RequestMethod.GET)
    public String list(@RequestParam(required=true,defaultValue="1") Integer page, Model model){
        PageHelper.startPage(page, 3);
        List<WorkSummary> list = workSummaryService.getList();
        PageInfo<WorkSummary> p=new PageInfo<WorkSummary>(list);
        model.addAttribute("page", p);
        model.addAttribute("list",list);
        return "log/worksummary/worksummary_list";
    }

    /**
     * 日志管理-班主任工作总结新增页面
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "add",method = RequestMethod.GET)
    public String add(){
        return "log/worksummary/worksummary_add";
    }

    /**
     * 日志管理-班主任工作总结新增保存
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "save",method = RequestMethod.POST)
    @ResponseBody
    public String save(WorkSummary record, HttpSession httpSession){
        Teacher teacher = getLoginUser(httpSession);
        record.setTid(teacher.getId());
        record.setTname(teacher.getTname());
        workSummaryService.insert(record);
        return "{ \"msg\":\"success\"}";
    }

    /**
     * 日志管理-班主任工作总结修改页面
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "query",method = RequestMethod.GET)
    public String query(Integer id,Model model){
        WorkSummary work = workSummaryService.selectByPrimaryKey(id);
        model.addAttribute("worksummary",work);
        return "log/worksummary/worksummary_update";
    }

    /**
     * 日志管理-班主任工作总结修改保存
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "update",method = RequestMethod.POST)
    @ResponseBody
    public String update(WorkSummary record,HttpSession httpSession){
        Teacher teacher = getLoginUser(httpSession);
        record.setTid(teacher.getId());
        record.setTname(teacher.getTname());
        workSummaryService.updateByPrimaryKey(record);
        return "{ \"msg\":\"success\"}";
    }

    /**
     * 日志管理-班主任工作总结删除
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "delete",method = RequestMethod.GET)
    public String delete(Integer id){
        workSummaryService.deleteByPrimaryKey(id);
        return "redirect:/worksummary/list";
    }

    /**
     * 查看详情
     * @author yangli
     * @date 2018/12/26
     */
    @RequestMapping(value = "detail",method = RequestMethod.GET)
    public String detail(Integer id,Model model){
        WorkSummary work = workSummaryService.selectByPrimaryKey(id);
        model.addAttribute("worksummary",work);
        return "";
    }
}
