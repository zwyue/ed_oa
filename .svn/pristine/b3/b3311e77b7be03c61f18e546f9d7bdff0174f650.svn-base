package com.zrtjoa.controller;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zrtjoa.common.BaseController;
import com.zrtjoa.common.ResultUtils;
import com.zrtjoa.entity.*;
import com.zrtjoa.service.CategoryService;
import com.zrtjoa.service.ClassesService;
import com.zrtjoa.service.ProfessionService;
import com.zrtjoa.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

import static com.zrtjoa.constant.SysConstant.MAP_DEFAULT_SIZE;
import static com.zrtjoa.exception.ExceptionEnum.SUCCESS;

/**
 * 班级管理
 * @author yangli
 * @date 2018/12/25
 */
@Controller
@RequestMapping("classes")
public class ClassesController extends BaseController {

    @Autowired
    private ClassesService classesService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private ProfessionService professionService;
    @Autowired
    private TeacherService teacherService;

    /**
     * 班级管理列表
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "list",method = RequestMethod.GET)
    public String getList(@RequestParam(required=true,defaultValue="1") Integer page, Model model){
        PageHelper.startPage(page, 3);
        List<Classes> list = classesService.getList();
        PageInfo<Classes> p=new PageInfo<Classes>(list);
        model.addAttribute("page", p);
        model.addAttribute("list",list);
        return "classes/classes_list";
    }

    /**
     * 查询类别列表
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "catelist",method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> getcateList(){
        //获取从service传来的list数据
        List<Category> list = categoryService.getcatelist();
        JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(list));
        Map<String,Object> returnMap = new HashMap<>(MAP_DEFAULT_SIZE);
        returnMap.put("catelist",jsonArray);
        return ResultUtils.success(returnMap,SUCCESS.errorMessage);
    }

    /**
     * 查询专业列表
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "prolist",method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> getprolist(Integer cateid){
        //获取从service传来的list数据
        //cateid=1;
        List<Profession> list = professionService.getprolist(cateid);
        JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(list));
        Map<String,Object> returnMap = new HashMap<>(MAP_DEFAULT_SIZE);
        returnMap.put("prolist",jsonArray);
        return ResultUtils.success(returnMap,SUCCESS.errorMessage);
    }

    /**
     * 查询班级列表
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "clist")
    @ResponseBody
    public Map<String,Object> getclist(Integer majorid){
        //majorid=1;
        List<Classes> list = classesService.getCList(majorid);
        JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(list));
        Map<String,Object> returnMap = new HashMap<>(MAP_DEFAULT_SIZE);
        returnMap.put("clist",jsonArray);
        return ResultUtils.success(returnMap,SUCCESS.errorMessage);
    }

    /**
     * 查询教师列表
     * @author yangli
     * @date 2019/1/3
     */
    @RequestMapping(value = "tealist")
    @ResponseBody
    public Map<String,Object> gettealist(Integer majorid){
        List<Teacher> list = teacherService.getteaList(majorid);
        JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(list));
        Map<String,Object> returnMap = new HashMap<>(MAP_DEFAULT_SIZE);
        returnMap.put("tealist",jsonArray);
        return ResultUtils.success(returnMap,SUCCESS.errorMessage);
    }

    /**
     * 班级管理查询
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "serarch")
    public String serarch(String name,Model model){
        List<Classes> list = classesService.byNameList(name);
        model.addAttribute("list",list);
        return "{ \"msg\":\"success\"}";
    }

    /**
     * 班级管理新增页面
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "add",method = RequestMethod.GET)
    public String add(){
        return "/classes/classes_add";
    }

    /**
     * 班级管理新增信息保存
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "save",method = RequestMethod.POST)
    @ResponseBody
    public String save(Classes classes){
        int sorts = 1;
        List<Classes> list = classesService.getCList(classes.getMajorid());
        if(list.size()<1){
            sorts=1;
        }else{
            List<Integer> lisst=new ArrayList<Integer>();
            for(int i=0;i<list.size();i++){
                int edition = Integer.parseInt(list.get(i).getNumber());
                lisst.add(edition);
            }
            int max = Collections.max(lisst);
            int sort1=max+1;
            sorts=sort1;
        }
        classes.setNumber(String.valueOf(sorts));
        classes.setActualsize(0);
        classesService.insert(classes);
        return "{ \"msg\":\"success\"}";
    }

    /**
     * 班级管理修改页面
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "query",method = RequestMethod.GET)
    public String query(Integer id,Model model){
        Classes classes = classesService.selectByPrimaryKey(id);
        model.addAttribute("classes",classes);
        return "/classes/classes_update";
    }

    /**
     * 班级管理修改
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "update",method = RequestMethod.POST)
    @ResponseBody
    public String update(Classes classes){
        classesService.updateByPrimaryKey(classes);
        return "{ \"msg\":\"success\"}";
    }

    /**
     * 班级管理删除
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "delete",method =RequestMethod.GET)
    public String delete(Integer id){
        classesService.deleteByPrimaryKey(id);
        return "redirect:/classes/list";
    }
}
