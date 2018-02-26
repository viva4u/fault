package com.auv.service.serviceInterface;

import com.auv.model.User;

import java.util.List;
import java.util.Map;

public interface UserBasicService {
    public User getByName(String name);
    public Map pageQuery(Map<String,Object> params);
}
