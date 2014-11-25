package com.toyo.gp.controller;

import com.toyo.gp.entity.User;
import com.toyo.gp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("login")
public class LoginController {

    @Autowired
    private UserService userService;

    @RequestMapping(method = RequestMethod.POST)
    public String login(@RequestParam(value = "userid") String userid,
                        @RequestParam(value = "password") String password,
                        HttpSession session,
                        ModelMap modelMap){

        User user = userService.loginByUserid(userid,password);

        if(user != null){
            session.setAttribute("user",user);
            modelMap.addAttribute("user",user);
            return "redirect:/";
        } else {
            return "login";
        }


    }

}
