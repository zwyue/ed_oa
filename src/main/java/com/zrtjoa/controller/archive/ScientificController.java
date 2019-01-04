package com.zrtjoa.controller.archive;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import com.zrtjoa.common.BaseController;
import com.zrtjoa.common.ResultUtils;
import com.zrtjoa.common.TimeUtil;
import com.zrtjoa.entity.Scientific;
import com.zrtjoa.entity.Teacher;
import com.zrtjoa.service.ScientificService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 科研课题管理
 * @author yangli
 * @date 2018/12/25
 */
@RestController
@RequestMapping("/scientific")
public class ScientificController extends BaseController {

    @Autowired
    private ScientificService scientificService;

    /**
     * 科研课题列表
     * @author yangli
     * @date 2018/11/28 14:10
     */
    @RequestMapping(value = "list" ,method = RequestMethod.GET)
    public Map getList(){
        PageInfo<Scientific> pageInfo = new PageInfo<>(scientificService.getList());
        return ResultUtils.success(pageInfo);
    }

    /**
     * 科研课题保存
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "save" ,method = RequestMethod.POST)
    @ResponseBody
    public Map save(Scientific scientific, HttpSession httpSession){
        Teacher teacher = getLoginUser(httpSession);
        scientific.setUserid(teacher.getId());
        scientific.setUsername(teacher.getTname());
        scientific.setCrttime(TimeUtil.dateToStrLong(new Date()));
        scientificService.insert(scientific);
        if(scientificService.insert(scientific)>0){
            return ResultUtils.success("保存成功");
        }else{
            return ResultUtils.error("保存失败");
        }
    }

    /**
     * 科研课题修改
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "update" ,method = RequestMethod.POST)
    @ResponseBody
    public Map update(Scientific scientific,HttpSession httpSession){
        Teacher teacher = getLoginUser(httpSession);
        scientific.setUserid(teacher.getId());
        scientific.setUsername(teacher.getTname());
        scientificService.updateByPrimaryKey(scientific);
        if(scientificService.updateByPrimaryKey(scientific)>0){
            return ResultUtils.success("保存成功");
        }else{
            return ResultUtils.error("保存失败");
        }
    }

    /**
     * 删除
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "delete" ,method = RequestMethod.GET)
    public Map delete(Integer id){
        Integer delete = scientificService.deleteByPrimaryKey(id);
        if(delete>0){
            return ResultUtils.success("删除失败");
        }else {
            return ResultUtils.error("删除成功");
        }
    }

    /**
     * 查询
     * @author yangli
     * @date 2018/12/25
     */
    @RequestMapping(value = "query" ,method = RequestMethod.GET)
    public Map query(Integer id){
        Scientific scientific = scientificService.selectByPrimaryKey(id);
        return ResultUtils.success(scientific);
    }
}