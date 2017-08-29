package com.lsj.service.impl;

import com.lsj.dao.DeptDao;
import com.lsj.model.Dept;
import com.lsj.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by LiuSijia on 2017/8/27.
 */
@Service("deptService")
public class DeptServiceImpl implements DeptService {

    @Autowired
    private DeptDao deptDao;
    @Override
    public List<Dept> getDepts() {
        return deptDao.getDepts();
    }
}
