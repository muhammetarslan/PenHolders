package com.fatih.demo.web;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import com.fatih.demo.model.User;
import com.fatih.demo.service.SecurityService;
import com.fatih.demo.service.UserService;
import com.fatih.demo.validator.UserValidator;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    @GetMapping("/registration")
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @PostMapping("/registration")
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userService.save(userForm);

        securityService.autoLogin(userForm.getUsername(), userForm.getPasswordConfirm());

        return "redirect:/welcome"; 
    }

    @GetMapping("/login")
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }
    
    @GetMapping(value="/{profile}/{contentTitle}/search")
    public String search(@RequestParam(value="search",required = false)String search, Model model) {
    	List<User> userList=userService.findAllUsers();
    	List<String> usersFound=userList.stream().map(x->x.getUsername())
    	.filter(x->x.contains(search)).collect(Collectors.toList());  	
    	model.addAttribute("usersFound", usersFound);
    	return "searchresults";
    }

    @GetMapping(value="/search")
    public String commonSearch(@RequestParam(value="search",required = false)String search, Model model) {
        List<User> userList=userService.findAllUsers();
        List<String> usersFound=userList.stream().map(x->x.getUsername())
                .filter(x->x.contains(search)).collect(Collectors.toList());
        model.addAttribute("usersFound", usersFound);
        return "usersearchresults";
    }
}
