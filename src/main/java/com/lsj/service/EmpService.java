package com.lsj.service;

import com.lsj.model.Emp;

import java.util.List;

/**
 * Created by LiuSijia on 2017/8/26.
 */
public interface EmpService {

    List<Emp> FindAll();

    void save(Emp emp);

    Emp findOneById(int id);

    void update(Emp emp);

    void delete(Integer id);
}
