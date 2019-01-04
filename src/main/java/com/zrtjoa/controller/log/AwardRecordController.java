package com.zrtjoa.controller.log;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zrtjoa.common.BaseController;
import com.zrtjoa.entity.AwardRecord;
import com.zrtjoa.entity.Teacher;
import com.zrtjoa.service.AwardRecordService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
 * 日志管理-获奖情况记录
 * @author yangli
 * @date 2018/12/25
 */
@Controller
@RequestMapping("/awardrecord")
public class AwardRecordController extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger(WorkPlanController.class);

    @Autowired
    private AwardRecordService awardRecordService;

    /**
     * 日志管理-获奖情况记录列表
     * @author yangli
     * @date 2018/11/28 14:10
     */
    @RequestMapping(value = "list" ,method = RequestMethod.GET)
    public String getList(@RequestParam(required=true,defaultValue="1") Integer page,Model model){
        PageHelper.startPage(page, 3);
        List<AwardRecord> list = awardRecordService.getList();
        PageInfo<AwardRecord> p=new PageInfo<AwardRecord>(list);
        model.addAttribute("page", p);
        model.addAttribute("list",list);
        return "log/awardrecord/awardrecord_list";
    }

    /**
     * 日志管理-获奖情况新增
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "add",method = RequestMethod.GET)
    public String add(){
        return "log/awardrecord/awardrecord_add";
    }

    /**
     * 日志管理-获奖情记录保存
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "save",method = RequestMethod.POST)
    @ResponseBody
    public String save(AwardRecord record, HttpSession httpSession){
        Teacher teacher = getLoginUser(httpSession);
        record.setTid(teacher.getId());
        record.setTname(teacher.getTname());
        awardRecordService.insert(record);
        return "{ \"msg\":\"success\"}";
    }

    /**
     * 日志管理-获奖情记录修改页面
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "query",method = RequestMethod.GET)
    public String query(Integer id,Model model){
        AwardRecord record = awardRecordService.selectByPrimaryKey(id);
        model.addAttribute("awardrecord",record);
        return "log/awardrecord/awardrecord_update";
    }

    /**
     * 日志管理-获奖情况记录修改
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "update",method = RequestMethod.POST)
    @ResponseBody
    public String update(AwardRecord record, HttpSession httpSession){
        Teacher teacher = getLoginUser(httpSession);
        record.setTid(teacher.getId());
        record.setTname(teacher.getTname());
        awardRecordService.updateByPrimaryKey(record);
        return "{ \"msg\":\"success\"}";
    }

    /**
     * 日志管理-获奖情况记录删除
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "delete",method = RequestMethod.GET)
    public String delete(Integer id){
        awardRecordService.deleteByPrimaryKey(id);
        return "redirect:/awardrecord/list";
    }
}