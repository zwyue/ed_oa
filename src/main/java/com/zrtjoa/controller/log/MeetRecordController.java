package com.zrtjoa.controller.log;

import com.zrtjoa.common.BaseController;
import com.zrtjoa.entity.MeetRecord;
import com.zrtjoa.entity.Teacher;
import com.zrtjoa.service.MeetRecordService;
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
 * 班会记录管理
 * @author yangli
 * @date 2018/12/26
 */
@Controller
@RequestMapping("/meetrecord")
public class MeetRecordController extends BaseController {

    @Autowired
    private MeetRecordService meetRecordService;

    /**
     * 查询班会记录列表
     * @author yangli
     * @date 2018/12/26
     */
    @RequestMapping(value = "list",method = RequestMethod.GET)
    public String list(Model model, HttpSession httpSession){
        Teacher teacher = getLoginUser(httpSession);
        Map map = new HashMap();
        map.put("classids", Arrays.asList(teacher.getClassid().split(COMMA)));
        List<MeetRecord> list = meetRecordService.getList(map);
        model.addAttribute("list",list);
        return "";
    }

    /**
     * 跳转进入班会记录新增页面
     * @author yangli
     * @date 2018/12/26
     */
    @RequestMapping(value = "add",method = RequestMethod.GET)
    public String add(){
        return "";
    }

    /**
     * 保存班会记录
     * @author yangli
     * @date 2018/12/26
     */
    @RequestMapping(value = "save",method = RequestMethod.POST)
    @ResponseBody
    public String save(MeetRecord record,HttpSession httpSession){
        Teacher teacher = getLoginUser(httpSession);
        record.setTid(teacher.getId());
        record.setTname(teacher.getTname());
        meetRecordService.insert(record);
        return "";
    }

    /**
     * 查询一条班会记录详情
     * @author yangli
     * @date 2018/12/27
     */
    @RequestMapping(value = "query",method = RequestMethod.GET)
    public String query(Integer id,Model model){
        MeetRecord record = meetRecordService.selectByPrimaryKey(id);
        model.addAttribute("record",record);
        return "";
    }

    /**
     * 班会记录修改保存
     * @author yangli
     * @date 2018/12/27
     */
    @RequestMapping(value = "update",method = RequestMethod.POST)
    public String update(MeetRecord record){
        meetRecordService.updateByPrimaryKey(record);
        return "";
    }

    /**
     * 删除一条班会记录
     * @author yangli
     * @date 2018/12/27
     */
    @RequestMapping(value = "delete",method = RequestMethod.GET)
    public String delete(Integer id){
        meetRecordService.deleteByPrimaryKey(id);
        return "";
    }

    
}
