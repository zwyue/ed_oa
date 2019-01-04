package com.zrtjoa.service.impl;

import com.zrtjoa.dao.UserDao;
import com.zrtjoa.entity.Teacher;
import com.zrtjoa.entity.User;
import com.zrtjoa.service.UserService;
import com.zrtjoa.util.DownloadFile;
import com.zrtjoa.util.GenerateWord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;

/**
 *
 * @author yangli
 * @date 2018/12/25
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;


    @Override
    public int saveUser(User user) {
        return userDao.saveUser(user);
    }

    @Override
    public int updateUser(User user) {
        return userDao.updateUser(user);
    }

    @Override
    public User findUserById(Long id) {
        return userDao.findUserById(id);
    }

    @Override
    public int deleteUser(Long id) {
        return userDao.deleteUser(id);
    }

    @Override
    public List<User> selectAllUser() {
        return userDao.selectAllUser();
    }

    @Override
    public void downLoad(HttpServletResponse response) {
        try {
            DownloadFile.downLoad(response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
