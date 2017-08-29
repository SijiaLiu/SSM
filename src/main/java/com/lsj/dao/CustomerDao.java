package com.lsj.dao;

import com.lsj.model.Customer;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by LiuSijia on 2017/8/28.
 */
@Component
public interface CustomerDao {

    Customer selectOneByName(Customer customer);

    List<Customer> selectAll();

    Customer selectOneById(int id);

    void update(Customer customer);

    void delete(Integer id);

    void save(Customer customer);
}
