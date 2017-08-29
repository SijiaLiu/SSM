package com.lsj.model;

import java.io.Serializable;

/**
 * Created by LiuSijia on 2017/8/28.
 */
public class Address implements Serializable{

    private Integer addressId;
    private String address;
    private String phone;

    public Address() {
    }

    public Integer getAddressId() {
        return addressId;
    }

    public void setAddressId(Integer addressId) {
        this.addressId = addressId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "Address{" +
                "addressId=" + addressId +
                ", address='" + address + '\'' +
                ", phone='" + phone + '\'' +
                '}';
    }
}
