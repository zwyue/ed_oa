package com.zrtjoa.controller.log;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zrtjoa.common.BaseController;
import com.zrtjoa.entity.ActivityRecord;
import com.zrtjoa.entity.Teacher;
import com.zrtjoa.service.ActivityRecordService;
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
 * 日志管理-校园活动记录管理
 * @author yangli
 * @date 2018/12/25
 */
@Controller
@RequestMapping("/activityrecord")
public class ActivityReordController extends BaseController {

    @Autowired
    private ActivityRecordService recordService;

    /**
     * 日志管理-校园活动记录列表
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "list",method = RequestMethod.GET)
    public String list(@RequestParam(required=true,defaultValue="1") Integer page, Model model){
        PageHelper.startPage(page, 3);
        List<ActivityRecord> list = recordService.getList();
        PageInfo<ActivityRecord> p=new PageInfo<ActivityRecord>(list);
        model.addAttribute("page", p);
        model.addAttribute("list",list);
        return "log/activityrecord/activityrecord_list";
    }

    /**
     * 日志管理-校园活动记录新增页面
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "add",method = RequestMethod.GET)
    public String add(){
        return "log/activityrecord/activityrecord_add";
    }

    /**
     * 日志管理-校园活动记录新增保存
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "save",method = RequestMethod.POST)
    @ResponseBody
    public String save(ActivityRecord record, HttpSession httpSession){
        Teacher teacher = getLoginUser(httpSession);
        record.setTid(teacher.getId());
        record.setTname(teacher.getTname());
        recordService.insert(record);
        return "{ \"msg\":\"success\"}";
    }

    /**
     * 日志管理-校园活动记录修改页面
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "query",method = RequestMethod.GET)
    public String query(Integer id,Model model){
        ActivityRecord record = recordService.selectByPrimaryKey(id);
        model.addAttribute("record",record);
        return "log/activityrecord/activityrecord_update";
    }

    /**
     * 日志管理-校园活动记录修改提交
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "update",method = RequestMethod.POST)
    @ResponseBody
    public String update(ActivityRecord record,HttpSession httpSession){
        Teacher teacher = getLoginUser(httpSession);
        record.setTid(teacher.getId());
        record.setTname(teacher.getTname());
        recordService.updateByPrimaryKey(record);
        return "{ \"msg\":\"success\"}";
    }

    /**
     * 日志管理-校园活动记录删除
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "delete",method = RequestMethod.GET)
    public String delete(Integer id){
        recordService.deleteByPrimaryKey(id);
        return "redirect:/activityrecord/list";
    }
}