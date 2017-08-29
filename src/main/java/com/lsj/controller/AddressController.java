package com.lsj.controller;

import com.lsj.model.Address;
import com.lsj.model.Msg;
import com.lsj.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by LiuSijia on 2017/8/28.
 */
@Controller
public class AddressController {

    @Autowired
    private AddressService as;

    @ResponseBody
    @RequestMapping(value = "/address")
    public Msg getAddress(){
        List<Address> list = as.getAddress();
        return Msg.success().add("add", list);
    }
}
