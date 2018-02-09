package com.auv.mapper.userBasicDao;

import com.auv.model.User;

public interface UserMapper {
    public User getByName(String name);
}
