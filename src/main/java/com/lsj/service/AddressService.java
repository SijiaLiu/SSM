package com.lsj.service;

import com.lsj.model.Address;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by LiuSijia on 2017/8/28.
 */

public interface AddressService {

    List<Address> getAddress();
}
