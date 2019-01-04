package com.zrtjoa.controller.log;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zrtjoa.common.BaseController;
import com.zrtjoa.entity.ClassSuggest;
import com.zrtjoa.entity.Teacher;
import com.zrtjoa.service.ClassSuggestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.zrtjoa.constant.SysConstant.Punctuation.COMMA;

/**
 * 日志管理-班级问题和建议清单管理
 * @author yangli
 * @date 2018/12/25
 */
@Controller
@RequestMapping("classsuggest")
public class ClassSuggestController extends BaseController {

    @Autowired
    private ClassSuggestService classSuggestService;

    /**
     * 日志管理-班级问题和建议清单列表
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "list",method = RequestMethod.GET)
    public String list(@RequestParam(required=true,defaultValue="1") Integer page, Model model,HttpSession httpSession){
        PageHelper.startPage(page, 3);
        Teacher teacher = getLoginUser(httpSession);
        Map map = new HashMap();
        map.put("classids", Arrays.asList(teacher.getClassid().split(COMMA)));
        List<ClassSuggest> list = classSuggestService.getList(map);
        PageInfo<ClassSuggest> p=new PageInfo<ClassSuggest>(list);
        model.addAttribute("page", p);
        model.addAttribute("list",list);
        return "log/classsuggest/classsuggest_list";
    }

    /**
     * 日志管理-班级问题和建议清单新增页面
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "add",method = RequestMethod.GET)
    public String add(){
        return "log/classsuggest/classsuggest_add";
    }

    /**
     * 日志管理-班级问题和建议清单新增保存
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "save",method = RequestMethod.POST)
    public String save(ClassSuggest record, HttpSession httpSession){
        Teacher teacher = getLoginUser(httpSession);
        record.setTid(teacher.getId());
        record.setTname(teacher.getTname());
        classSuggestService.insert(record);
        return "{ \"msg\":\"success\"}";
    }

    /**
     * 日志管理-班级问题和建议清单修改页面
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "query",method = RequestMethod.GET)
    public String query(Integer id,Model model){
        ClassSuggest classSuggest = classSuggestService.selectByPrimaryKey(id);
        model.addAttribute("classsuggest",classSuggest);
        return "log/classsuggest/classsuggest_update";
    }

    /**
     * 日志管理-班级问题和建议清单修改保存
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "update",method = RequestMethod.POST)
    public String update(ClassSuggest record){
        classSuggestService.updateByPrimaryKey(record);
        return "{ \"msg\":\"success\"}";
    }

    /**
     * 日志管理-班级问题和建议清单删除
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "delete",method = RequestMethod.GET)
    public String delete(Integer id){
        classSuggestService.deleteByPrimaryKey(id);
        return "redirect:/classsuggest/list";
    }
}
