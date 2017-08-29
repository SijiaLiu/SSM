package com.lsj.service.impl;

import com.lsj.dao.EmpDao;
import com.lsj.model.Emp;
import com.lsj.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by LiuSijia on 2017/8/26.
 */
@Service("empService")
public class EmpServiceImpl implements EmpService {

    @Autowired
    private EmpDao empDao;

    @Override
    public List<Emp> FindAll() {
        return empDao.selectAll();
    }

    @Override
    public void save(Emp emp) {
        empDao.insertEmp(emp);
    }

    @Override
    public Emp findOneById(int id) {
        return empDao.selectOneById(id);
    }

    @Override
    public void update(Emp emp) {
        empDao.update(emp);
    }

    @Override
    public void delete(Integer id) {
        empDao.deleteOneById(id);
    }
}
