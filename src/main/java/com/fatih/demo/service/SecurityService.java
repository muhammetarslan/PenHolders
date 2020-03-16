package com.fatih.demo.service;

public interface SecurityService {
    String findLoggedInUsername();

    void autoLogin(String username, String password);
}
