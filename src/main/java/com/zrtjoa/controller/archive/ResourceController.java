package com.zrtjoa.controller.archive;

import com.github.pagehelper.PageInfo;
import com.zrtjoa.common.BaseController;
import com.zrtjoa.common.ResultUtils;
import com.zrtjoa.entity.Resource;
import com.zrtjoa.entity.Teacher;
import com.zrtjoa.service.ResourceService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * ResourceController class
 *
 * @author zwy
 * @date 2018/11/28 15:43
 */
@RestController
@RequestMapping("resource")
public class ResourceController extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger(ResourceController.class) ;

    @Autowired
    private ResourceService resourceService ;

    /**
     * 保存资源建设
     *
     * @author zwy
     * @date 2018/11/28 16:10
     */
    @RequestMapping(value = "saveResource",method = RequestMethod.POST)
    @ResponseBody
    public Map saveResouce(Resource resource, HttpSession httpSession){
        Teacher teacher = getLoginUser(httpSession);
        resource.setUserid(teacher.getId());
        resource.setUsername(teacher.getTname());
        resourceService.saveResouce(resource);
        return ResultUtils.success("保存成功");
    }

    /**
     * 获取资源建设列表
     *
     * @author zwy
     * @date 2018/11/28 16:32
     */
    @RequestMapping("list")
    public Map list(){
        PageInfo<Resource> pageInfo = new PageInfo<>(resourceService.queryResourceList());
        return ResultUtils.success(pageInfo);
    }

    /**
     * 档案查询
     *
     * @author zwy
     * @date 2018/11/28 14:09
     */
    @RequestMapping(value = "queryResourceById" ,method = RequestMethod.GET)
    public Map queryMemorabilia(Integer id){
        logger.info("========查询id为{}的资源========",id);
        Resource resource = resourceService.queryResourceById(id);
        return ResultUtils.success(resource);
    }

    /**
     * 资源建设更新
     *
     * @author zwy
     * @date 2018/11/28 14:09
     */
    @RequestMapping(value = "update" ,method = RequestMethod.POST)
    @ResponseBody
    public Map updateResource(Resource resource){
        logger.info("=========资源建设更新=========");
        resourceService.updateResource(resource);
        return ResultUtils.success("更新成功") ;
    }

    /**
     * 删除资源建设
     *
     * @author zwy
     * @date 2018/11/28 17:37
     */
    @RequestMapping(value = "delete" ,method = RequestMethod.POST)
    public Map deleteMemorabilia(@RequestParam(value = "idList[]") List<Integer> idList){
        logger.info("======删除{}条资源建设======",idList.size());
        int delete = resourceService.deleteResouece(idList);
        if(delete>0){
            return ResultUtils.success("删除失败");
        }else {
            return ResultUtils.error("删除成功");
        }
    }
}