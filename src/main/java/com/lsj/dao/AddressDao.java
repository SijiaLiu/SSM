package com.lsj.dao;

import com.lsj.model.Address;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by LiuSijia on 2017/8/28.
 */

@Component
public interface AddressDao {
    List<Address> selectAll();
}
