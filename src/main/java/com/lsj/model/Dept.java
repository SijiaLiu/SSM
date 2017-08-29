package com.lsj.model;

import java.io.Serializable;

/**
 * Created by LiuSijia on 2017/8/26.
 */
public class Dept implements Serializable{
    private int deptId;
    private String deptName;

    public Dept() {
    }

    public int getDeptId() {
        return deptId;
    }

    public void setDeptId(int deptId) {
        this.deptId = deptId;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    @Override
    public String toString() {
        return "Dept{" +
                "deptId=" + deptId +
                ", deptName='" + deptName + '\'' +
                '}';
    }
}
