package com.lsj;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @Title com.hand.BaseJunit4Test
 * @Description 单元测试基类
 * @Author ZQian
 * @date: 2017/8/2 上午11:06
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-global.xml"})
public class BaseJunit4Test extends AbstractJUnit4SpringContextTests {

}
