package com.fatih.demo.service;

import java.util.List;

import com.fatih.demo.model.User;

public interface UserService {
    void save(User user);
    User findByUsername(String username);
    List<User> findAllUsers();
}
