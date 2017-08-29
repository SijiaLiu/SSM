package com.lsj;

import com.github.pagehelper.PageInfo;
import com.lsj.model.Emp;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;

import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

/**
 * Created by LiuSijia on 2017/8/26.
 */
@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-global.xml"})
public class MvcTest{

    @Autowired
    WebApplicationContext context;

    MockMvc mockMvc;

    @Before
    public void initMockMvc(){
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void testPage() throws Exception {
        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn", "1")).andReturn();

        MockHttpServletRequest request = result.getRequest();
        PageInfo pi = (PageInfo) request.getAttribute("empList");
        System.out.println("当前页"+pi.getPageNum());
        int[] num = pi.getNavigatepageNums();
        for (int i:num) {
            System.out.println(i);
        }

        
        List<Emp> list =  pi.getList();
        for (Emp emp:list) {
            System.out.println("ID:"+emp.getEmpId());
            System.out.println(emp.getEmpName());
            System.out.println(emp.getEmail());
            System.out.println(emp.getDeptName().getDeptName());
        }
    }

}
