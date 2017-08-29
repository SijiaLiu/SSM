package com.lsj;

import com.lsj.dao.AddressDao;
import com.lsj.dao.CustomerDao;
import com.lsj.dao.DeptDao;
import com.lsj.dao.EmpDao;
import com.lsj.model.Address;
import com.lsj.model.Customer;
import com.lsj.model.Dept;
import com.lsj.model.Emp;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.UUID;

/**
 * Created by LiuSijia on 2017/8/26.
 */
public class DaoTest extends BaseJunit4Test {

    @Autowired
    private EmpDao empDao;

    @Autowired
    private DeptDao deptDao;

    @Autowired
    private SqlSession sqlSession;

    @Autowired
    private CustomerDao customerDao;

    @Autowired
    private AddressDao ad;

    @Test
    public void testSelectAll(){
        List<Emp> list = empDao.selectAll();
        System.out.println(list);
    }

    @Test
    public void testInsertEmp(){
        EmpDao empDao1 = sqlSession.getMapper(EmpDao.class);
        for (int i = 0; i < 500 ; i++) {
            String uid = UUID.randomUUID().toString().substring(0,4)+i;
            empDao1.insertEmp(new Emp(null, uid,uid+"@qq.com","M", 1));
        }
        System.out.println("批量完成");
    }

    @Test
    public void testI(){
        for (int i = 0; i < 200 ; i++) {
            String uid = UUID.randomUUID().toString().substring(0,4)+i;
            empDao.insertEmp(new Emp(null, uid,uid+"@qq.com","M", 1));
        }
        //empDao.insertEmp(new Emp(null, "lsj","lsj@qq.com","M", 1) );
    }

    @Test
    public void testS(){
        List<Dept> list = deptDao.getDepts();
        System.out.println(list);
    }

    @Test
    public void testSS(){
        List<Emp> list = empDao.select();
        System.out.println(list);
    }

    @Test
    public void testSelectOneById(){
        int id = 1;
        Emp emp = empDao.selectOneById(id);
        System.out.println(emp);
    }

    @Test
    public void selectOneByName(){
        Customer a = new Customer();
        a.setFirstName("MARY");
        Customer customer = customerDao.selectOneByName(a);
        System.out.println(customer);
    }

    @Test
    public void selectALLc(){
        List<Customer> list = customerDao.selectAll();
        System.out.println(list);
    }

    @Test
    public void selectAllA(){
        List<Address> list = ad.selectAll();
        System.out.println(list);
    }
}
