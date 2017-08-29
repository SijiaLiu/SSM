package com.lsj.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lsj.model.Customer;
import com.lsj.model.Msg;
import com.lsj.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by LiuSijia on 2017/8/28.
 */
@Controller
public class CustomerController {

    @Autowired
    private CustomerService cs;

    //获取全部员工信息
    @ResponseBody
    @RequestMapping(value = "/customer")
    public Msg getAll(
            @RequestParam(value = "pn",defaultValue = "1") Integer pn){
        int size = 10;
        PageHelper.startPage(pn, size);
        List<Customer> customerList = cs.findAllCustomer();
        PageInfo<Customer> pageInfo = new PageInfo<>(customerList, 5);
        return Msg.success().add("cusList", pageInfo);
    }

    //    通过Id查询员工数据
    @RequestMapping(value = "/cus/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Msg findOne(@PathVariable("id") Integer id){
        Customer cus = cs.findById(id);
        return Msg.success().add("cus", cus);
    }

    //更新用户
    @ResponseBody
    @RequestMapping(value = "/cus/{customerId}", method = RequestMethod.PUT)
    public Msg update(Customer customer){
        cs.update(customer);
        return Msg.success();
    }

    //删除用户
    @ResponseBody
    @RequestMapping(value = "/cus/{id}", method = RequestMethod.DELETE)
    public Msg delete(@PathVariable("id") Integer id){
        cs.deleteById(id);
        return Msg.success();
    }

    //添加用户
    @ResponseBody
    @RequestMapping(value = "/cus", method = RequestMethod.POST)
    public Msg save(Customer customer){
        cs.save(customer);
        return Msg.success();
    }

    @RequestMapping(value = "/add")
    public String add(){
        return "add";
    }
}
