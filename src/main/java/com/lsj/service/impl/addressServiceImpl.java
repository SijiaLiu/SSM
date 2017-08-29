package com.lsj.service.impl;

import com.lsj.dao.AddressDao;
import com.lsj.model.Address;
import com.lsj.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by LiuSijia on 2017/8/28.
 */
@Service("addressService")
public class addressServiceImpl implements AddressService {

    @Autowired
    private AddressDao ad;

    @Override
    public List<Address> getAddress() {
        List<Address> list = ad.selectAll();
        return list;
    }
}
