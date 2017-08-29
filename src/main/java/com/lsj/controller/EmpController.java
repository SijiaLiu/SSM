package com.lsj.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lsj.model.Emp;
import com.lsj.model.Msg;
import com.lsj.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by LiuSijia on 2017/8/26.
 */
@Controller
public class EmpController {

    @Autowired
    private EmpService empService;


    //@RequestMapping(value = "/emps", method = RequestMethod.GET)
    public ModelAndView findAllEmp(@RequestParam(value = "pn",defaultValue = "1") Integer pn,
                                    HttpServletRequest request){
        String pageNum = request.getParameter("pn");
        String pageSize =request.getParameter("pageSize");

        int size = 10;
        if (pageNum != null && !"".equals(pageNum)) {
            pn = Integer.parseInt(pageNum);
        }
        if (pageSize != null && !"".equals(pageSize)) {
            size = Integer.parseInt(pageSize);
        }
        //传入页码 以及每页数据的size
        PageHelper.startPage(pn, size);
        List<Emp> empList = empService.FindAll();
        //使用PageInfo包装查出来的List PageIno里面会包含你需要的信息 传入你需要连续显示的页数
        PageInfo<Emp> empPageInfo = new PageInfo<>(empList, 5);
        ModelAndView view = new ModelAndView();
        view.setViewName("empList");
        view.addObject("empList", empPageInfo);
        return view;
    }

    //需要导入jackson包
    @ResponseBody
    @RequestMapping(value = "/emps")
    public Msg getEmpWithJson(
            @RequestParam(value = "pn",defaultValue = "1") Integer pn){
        int size = 10;
        PageHelper.startPage(pn, size);
        List<Emp> empList = empService.FindAll();
        //使用PageInfo包装查出来的List PageIno里面会包含你需要的信息 传入你需要连续显示的页数
        PageInfo<Emp> empPageInfo = new PageInfo<>(empList, 5);
        return Msg.success().add("empList", empPageInfo);
    }

    //员工保存
    @RequestMapping(value = "/emp", method = RequestMethod.POST)
    @ResponseBody
    public Msg saveEmp(Emp emp){
        empService.save(emp);
        return Msg.success();
    }

    //更新员工保存
//    注意这个ID 有毒
    //配置一个过滤器可以让ajax直接发送PUT请求
    @RequestMapping(value = "/emp/{empId}", method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateEmp(Emp emp){
        System.out.println(emp);
        empService.update(emp);
        return Msg.success();
    }

//    通过Id查询员工数据
    @RequestMapping(value = "/emp/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Msg findOne(@PathVariable("id") Integer id){
        Emp emp =empService.findOneById(id);
        return Msg.success().add("emp", emp);
    }

//    根据ID删除员工
    @ResponseBody
    @RequestMapping(value = "/emp/{id}", method = RequestMethod.DELETE)
    public Msg deleteOne(@PathVariable("id") Integer id){
        empService.delete(id);
        return Msg.success();
    }
}
