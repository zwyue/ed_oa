package com.zrtjoa.dao;

import com.zrtjoa.entity.Teacher;
import com.zrtjoa.entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Author: yangli
 * @Description:
 * @Date: Created in 10:56 2018/11/6
 * @Modified by:
 */
@Repository
public interface UserDao {

    int saveUser(User user);

    int updateUser(User user);

    User findUserById(Long id);

    int deleteUser(Long id);

    List<User> selectAllUser();
}
