package com.lsj.dao;

import com.lsj.model.Emp;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by LiuSijia on 2017/8/26.
 */
@Component
public interface EmpDao {
    List<Emp> selectAll();
    Emp selectById();
    void insertEmp(Emp emp);

    List<Emp> select();

    Emp selectOneById(int id);

    void update(Emp emp);

    void deleteOneById(int id);
}
