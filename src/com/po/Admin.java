package com.po;

import java.util.Date;

/**
 * @Description:
 * @Author: wyf
 * @CreateDate: 2020/3/31 15:37
 * @UpdateUser:
 * @UpdateDate: 2020/3/31 15:37
 * @UpdateRemark:
 * @Version: 1.0
 */
public class Admin {

    private Integer id;

    private String username;

    private String password;

    private String realName;

    private String descri;

    private Date createDate;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getDescri() {
        return descri;
    }

    public void setDescri(String descri) {
        this.descri = descri;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
}
