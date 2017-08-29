package com.lsj.model;

import java.io.Serializable;

/**
 * Created by LiuSijia on 2017/8/26.
 */
public class Emp implements Serializable{
    private Integer empId;
    private String empName;
    private String email;
    private String gender;
    private Integer dId;

    private Dept deptName;

    public Emp() {
    }

    public Emp(Integer empId, String empName, String email, String gender, Integer dId) {
        this.empId = empId;
        this.empName = empName;
        this.email = email;
        this.gender = gender;
        this.dId = dId;
    }

    public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Integer getdId() {
        return dId;
    }

    public void setdId(Integer dId) {
        this.dId = dId;
    }

    public Dept getDeptName() {
        return deptName;
    }

    public void setDeptName(Dept deptName) {
        this.deptName = deptName;
    }

    @Override
    public String toString() {
        return "Emp{" +
                "empId=" + empId +
                ", empName='" + empName + '\'' +
                ", email='" + email + '\'' +
                ", gender='" + gender + '\'' +
                ", dId=" + dId +
                ", deptName=" + deptName +
                '}';
    }
}
