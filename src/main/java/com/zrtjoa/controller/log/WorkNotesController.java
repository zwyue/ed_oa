package com.zrtjoa.controller.log;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zrtjoa.common.BaseController;
import com.zrtjoa.entity.Teacher;
import com.zrtjoa.entity.WorkNotes;
import com.zrtjoa.service.WorkNotesService;
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
 * 日志管理-班主任工作手记管理
 * @author yangli
 * @date 2018/12/25
 */
@Controller
@RequestMapping("worknotes")
public class WorkNotesController extends BaseController {

    @Autowired
    private WorkNotesService workNotesService;

    /**
     * 日志管理-班主任工作手记管理列表
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "list",method = RequestMethod.GET)
    public String list(@RequestParam(required=true,defaultValue="1") Integer page, Model model){
        PageHelper.startPage(page, 3);
        List<WorkNotes> list = workNotesService.getList();
        PageInfo<WorkNotes> p=new PageInfo<WorkNotes>(list);
        model.addAttribute("page", p);
        model.addAttribute("list",list);
        return "log/worknotes/worknotes_list";
    }

    /**
     * 日志管理-班主任工作手记新增页面
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "add",method = RequestMethod.GET)
    public String add(){
        return "log/worknotes/worknotes_add";
    }

    /**
     * 日志管理-班主任工作手记新增保存
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "save",method = RequestMethod.POST)
    @ResponseBody
    public String save(WorkNotes record, HttpSession httpSession){
        Teacher teacher = getLoginUser(httpSession);
        record.setTid(teacher.getId());
        record.setTname(teacher.getTname());
        workNotesService.insert(record);
        return "{ \"msg\":\"success\"}";
    }

    /**
     * 日志管理-班主任工作手记修改页面
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "query",method = RequestMethod.GET)
    public String query(Integer id,Model model){
        WorkNotes workNotes = workNotesService.selectByPrimaryKey(id);
        model.addAttribute("record",workNotes);
        return "log/worknotes/worknotes_update";
    }

    /**
     * 日志管理-班主任工作手记修改保存
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "update",method = RequestMethod.POST)
    @ResponseBody
    public String update(WorkNotes workNotes){
        workNotesService.updateByPrimaryKey(workNotes);
        return "{ \"msg\":\"success\"}";
    }

    /**
     * 日志管理-班主任工作手记删除
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "delete",method = RequestMethod.GET)
    public String delete(Integer id){
        workNotesService.deleteByPrimaryKey(id);
        return "redirect:/worknotes/list";
    }
}