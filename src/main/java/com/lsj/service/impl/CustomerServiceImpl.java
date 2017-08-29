package com.lsj.service.impl;

import com.lsj.dao.CustomerDao;
import com.lsj.model.Customer;
import com.lsj.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by LiuSijia on 2017/8/28.
 */
@Service("customerService")
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerDao customerDao;

    @Override
    public boolean check(Customer customer) {
        Customer customer1 = customerDao.selectOneByName(customer);
        if (customer1 != null){
            return true;
        }else {
            return false;
        }
    }

    @Override
    public List<Customer> findAllCustomer() {
        return customerDao.selectAll();
    }

    @Override
    public Customer findById(int id) {
        return customerDao.selectOneById(id);
    }

    @Override
    public void update(Customer customer) {
        customerDao.update(customer);
    }

    @Override
    public void deleteById(Integer id) {
        customerDao.delete(id);
    }

    @Override
    public void save(Customer customer) {
        customerDao.save(customer);
    }
}
