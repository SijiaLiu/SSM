package com.lsj.controller;

import com.lsj.model.Dept;
import com.lsj.model.Msg;
import com.lsj.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by LiuSijia on 2017/8/27.
 */
@Controller
public class DeptController {

    @Autowired
    private DeptService deptService;


    @ResponseBody
    @RequestMapping(value = "/depts")
    public Msg getDepts(){
        List<Dept> list = deptService.getDepts();

        return Msg.success().add("depts", list);
    }
}
