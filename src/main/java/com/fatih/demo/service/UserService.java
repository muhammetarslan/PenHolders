package com.fatih.demo.service;

import com.fatih.demo.model.User;

public interface UserService {
    void save(User user);
    User findByUsername(String username);
}
