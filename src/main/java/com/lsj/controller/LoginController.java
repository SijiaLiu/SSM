package com.lsj.controller;

import com.lsj.model.Customer;
import com.lsj.model.Msg;
import com.lsj.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by LiuSijia on 2017/8/29.
 */
@Controller
public class LoginController {

    @Autowired
    private CustomerService cs;

    //登录校验
    @RequestMapping(value = "/login")
    public String  login(Customer customer, HttpServletRequest request){
        boolean b = cs.check(customer);
        if (b){
            HttpSession session = request.getSession();
            session.setAttribute("firstName", customer.getFirstName());
            return "success";
        }
        else{
            return "";
        }
    }
}
