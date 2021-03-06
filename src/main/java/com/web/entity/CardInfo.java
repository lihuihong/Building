package com.web.entity;

import java.io.Serializable;
import java.sql.Date;

public class CardInfo implements Serializable {

    private Integer infoId;

    private Integer userId;
    private String userName;

    private String infoName;

    private String infoPerson;

    private Date infoTime;

    private String infoAddress;

    private String infoNameAddress;

    private Integer infoTelAddress;


    public Integer getInfoId() {
        return infoId;
    }

    public void setInfoId(Integer infoId) {
        this.infoId = infoId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getInfoName() {
        return infoName;
    }

    public void setInfoName(String infoName) {
        this.infoName = infoName == null ? null : infoName.trim();
    }

    public String getInfoPerson() {
        return infoPerson;
    }

    public void setInfoPerson(String infoPerson) {
        this.infoPerson = infoPerson == null ? null : infoPerson.trim();
    }

    public Date getInfoTime() {
        return infoTime;
    }

    public void setInfoTime(Date infoTime) {
        this.infoTime = infoTime;
    }

    public String getInfoAddress() {
        return infoAddress;
    }

    public void setInfoAddress(String infoAddress) {
        this.infoAddress = infoAddress == null ? null : infoAddress.trim();
    }

    public String getInfoNameAddress() {
        return infoNameAddress;
    }

    public void setInfoNameAddress(String infoNameAddress) {
        this.infoNameAddress = infoNameAddress == null ? null : infoNameAddress.trim();
    }

    public Integer getInfoTelAddress() {
        return infoTelAddress;
    }

    public void setInfoTelAddress(Integer infoTelAddress) {
        this.infoTelAddress = infoTelAddress;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", infoId=").append(infoId);
        sb.append(", userId=").append(userId);
        sb.append(", infoName=").append(infoName);
        sb.append(", infoPerson=").append(infoPerson);
        sb.append(", infoTime=").append(infoTime);
        sb.append(", infoAddress=").append(infoAddress);
        sb.append(", infoNameAddress=").append(infoNameAddress);
        sb.append(", infoTelAddress=").append(infoTelAddress);
        sb.append("]");
        return sb.toString();
    }
}