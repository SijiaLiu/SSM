package com.lsj.dao;

import com.lsj.model.Dept;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by LiuSijia on 2017/8/27.
 */
@Component
public interface DeptDao {
    List<Dept> getDepts();
}
