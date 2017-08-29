package com.lsj.service;

import com.lsj.model.Customer;

import java.util.List;

/**
 * Created by LiuSijia on 2017/8/28.
 */
public interface CustomerService {

    boolean check(Customer customer);

    List<Customer> findAllCustomer();

    Customer  findById(int id);

    void update(Customer customer);

    void deleteById(Integer id);

    void save(Customer customer);
}
