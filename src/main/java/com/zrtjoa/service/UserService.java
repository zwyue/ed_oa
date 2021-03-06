package com.zrtjoa.service;

import com.zrtjoa.entity.User;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author yangli
 * @date 2018/12/25
 */
public interface UserService {

    int saveUser(User user);

    int updateUser(User user);

    User findUserById(Long id);

    int deleteUser(Long id);

    List<User> selectAllUser();
}
