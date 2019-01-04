package com.zrtjoa.controller;

import com.zrtjoa.common.BaseController;
import com.zrtjoa.entity.SpecialManager;
import com.zrtjoa.entity.Teacher;
import com.zrtjoa.service.SpecialManagerService;
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
 * 特殊学员管理
 * @author yangli
 * @date 2018/12/25
 */
@Controller
@RequestMapping("/specialmanager")
public class SpecialManagerController extends BaseController {

    @Autowired
    private SpecialManagerService specialManagerService;

    /**
     * 查询特殊学员列表
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "list",method = RequestMethod.GET)
    public String list(Model model,HttpSession httpSession){
        Teacher teacher = getLoginUser(httpSession);
        Map map = new HashMap();
        map.put("classids", Arrays.asList(teacher.getClassid().split(COMMA)));
        List<SpecialManager> list = specialManagerService.getList(map);
        model.addAttribute("list",list);
        return "";
    }

    /**
     * 特殊学员新增页面
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "add",method = RequestMethod.GET)
    public String add(){
        return "";
    }

    /**
     * 特殊学员新增保存
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "save",method = RequestMethod.POST)
    @ResponseBody
    public String save(SpecialManager record, HttpSession httpSession){
        Teacher teacher = getLoginUser(httpSession);
        record.setTid(teacher.getId());
        record.setTname(teacher.getTname());
        specialManagerService.insert(record);
        return "{ \"msg\":\"success\"}";
    }

    /**
     * 查询某一条的特殊学员信息
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "query",method = RequestMethod.GET)
    public String query(Model model,Integer id){
        SpecialManager record = specialManagerService.selectByPrimaryKey(id);
        model.addAttribute("record",record);
        return "";
    }

    /**
     * 修改特殊学员信息
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "update",method = RequestMethod.POST)
    @ResponseBody
    public String update(SpecialManager record){
        specialManagerService.updateByPrimaryKey(record);
        return "{ \"msg\":\"success\"}";
    }

    /**
     * 删除一条特殊学员
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "delete",method = RequestMethod.GET)
    public String delete(Integer id){
        specialManagerService.deleteByPrimaryKey(id);
        return "";
    }

}
