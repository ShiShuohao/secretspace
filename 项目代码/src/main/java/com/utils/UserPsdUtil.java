package com.utils;

import com.dao.UserDao;
import com.pojo.User;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UserPsdUtil {
    public static Map<String,String> username_password() throws Exception{
        List<User> list = UserDao.selectUser();
        Map<String,String> map = new HashMap<>();
        for (User user:list){
            map.put(user.getUsername(),user.getPassword());
        }
        return map;
    }
}
