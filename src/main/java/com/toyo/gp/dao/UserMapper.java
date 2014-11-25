package com.toyo.gp.dao;

import com.toyo.gp.entity.User;
import org.apache.ibatis.annotations.Select;

/**
 * Created by Lsr on 10/9/14.
 */
public interface UserMapper {

    @Select("select * from user where userId=#{userId}")
    public User findByUserId(String userid);


    public void updateUser(User user);

    void updateUserWithoutProfile(User user);

    void updateUserProfileById(String userid, String profile);

    void updateUserProfileByUser(User user);
}