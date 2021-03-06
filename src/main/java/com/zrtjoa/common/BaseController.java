package com.zrtjoa.common;

import com.zrtjoa.entity.Power;
import com.zrtjoa.entity.Role;
import com.zrtjoa.entity.Teacher;

import javax.servlet.http.HttpSession;
import java.util.List;

import static com.zrtjoa.constant.SysConstant.*;

/**
 * BaseController class
 *
 * @author zwy
 * @date 2018/11/22 13:46
 */
public class BaseController {

    /**
     * 获取session用户
     *
     * @author zwy
     * @date 2018/11/29 15:59
     */
    protected Teacher getLoginUser(HttpSession httpSession){
        return (Teacher) httpSession.getAttribute(CACHE_USER);
    }

    /**
     * 获取当前登陆人角色
     *
     * @author zwy
     * @date 2018/12/1 12:04
     */
    protected List<Role> getLoginRole(HttpSession httpSession){
        return (List<Role>) httpSession.getAttribute(CACHE_ROLE);
    }

    /**
     * 获取当前登陆人权限
     *
     * @author zwy
     * @date 2018/12/1 12:05
     */
    protected List<Power> getLoginPower(HttpSession httpSession) {
        return (List<Power>) httpSession.getAttribute(CACHE_PERMISSION);
    }

    protected List<Power> getMenuPower (HttpSession httpSession){
        return (List<Power>) httpSession.getAttribute(CACHE_MENU);
    }
}
