package com.toyo.gp.service;

import com.toyo.gp.dao.UserMapper;
import com.toyo.gp.entity.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Lsr on 10/9/14.
 */

@Service
public class UserService {

    @Resource
    UserMapper userMapper;

    public User loginByUserid(String userid,String password) {

        User user = userMapper.findByUserId(userid);

        if(user!=null && password.equals(user.getPassword())){
            return user;
        } else {
            return null;
        }

    }
}
