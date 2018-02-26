package com.auv.mapper.userBasicDao;

import com.auv.model.User;

import java.util.List;
import java.util.Map;

public interface UserMapper {
    public User getByName(String name);
    public List<User> pageQuery(Map<String,Object> params);
}
