package com.auv.service.impl;

import com.auv.mapper.userBasicDao.UserMapper;
import com.auv.model.User;
import com.auv.service.serviceInterface.UserBasicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserBasicServiceImpl implements UserBasicService{
    @Autowired
    private UserMapper userMapper;

    public UserMapper getUserMapper() {
        return userMapper;
    }

    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    public User getByName(String name) {
        return this.getUserMapper().getByName(name);
    }
}
