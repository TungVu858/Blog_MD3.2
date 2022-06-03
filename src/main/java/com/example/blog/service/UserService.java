package com.example.blog.service;

import com.example.blog.model.User;

import java.sql.SQLException;

public interface UserService extends GeneralService<User> {
    boolean unlock(User user) throws SQLException;
}
