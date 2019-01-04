package com.zrtjoa.entity;

import java.io.Serializable;

/**
 * 花名册信息表
 * @author yangli
 * @date 2018/12/25
 */
public class Roster implements Serializable {
    //主键id
    private Integer id;
    //出生日期
    private String birthdate;
    //学号
    private String stunumber;
    //班级id
    private Integer classid;
    //班级名称
    private String classname;
    //学生id
    private Integer stuid;
    //学生姓名
    private String stuname;
    //年龄
    private Integer age;
    //职位（0：学生、1：班长、2：学习委员、3：安全委员）
    private String isleader;
    //创建时间
    private String crttime;
    //状态（0:退班、1：转班、2：休学、3：开除）
    private String status;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(String birthdate) {
        this.birthdate = birthdate;
    }

    public Integer getClassid() {
        return classid;
    }

    public void setClassid(Integer classid) {
        this.classid = classid;
    }

    public String getClassname() {
        return classname;
    }

    public void setClassname(String classname) {
        this.classname = classname == null ? null : classname.trim();
    }

    public Integer getStuid() {
        return stuid;
    }

    public void setStuid(Integer stuid) {
        this.stuid = stuid;
    }

    public String getStuname() {
        return stuname;
    }

    public void setStuname(String stuname) {
        this.stuname = stuname == null ? null : stuname.trim();
    }

    public String getIsleader() {
        return isleader;
    }

    public void setIsleader(String isleader) {
        this.isleader = isleader == null ? null : isleader.trim();
    }

    public String getCrttime() {
        return crttime;
    }

    public void setCrttime(String crttime) {
        this.crttime = crttime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getStunumber() {
        return stunumber;
    }

    public void setStunumber(String stunumber) {
        this.stunumber = stunumber;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }
}