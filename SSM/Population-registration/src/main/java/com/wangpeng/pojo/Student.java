package com.wangpeng.pojo;

public class Student {
    /**
     * 人员id
     */
    private Integer sid;
    /**
     * 学生姓名
     */
    private String sname;
    /**
     * 电话号
     */
    private String snum;
    /**
     * 性别
     */
    private String ssex;
    /**
     * 年龄
     */
    private Integer sage;
    /**
     * 居住地址
     */
    private String cid;
    /**
     * 有无居住证
     */
    private String sstatus;
    /**
     * 目的
     */
    private String sremark;
    /**
     * 户籍地址
     */
    private String address;
    /**
     * 进入时间
     */
    private String entime;

    public Student() {
    }

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getSnum() {
        return snum;
    }

    public void setSnum(String snum) {
        this.snum = snum;
    }

    public String getSsex() {
        return ssex;
    }

    public void setSsex(String ssex) {
        this.ssex = ssex;
    }

    public Integer getSage() {
        return sage;
    }

    public void setSage(Integer sage) {
        this.sage = sage;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String getSstatus() {
        return sstatus;
    }

    public void setSstatus(String sstatus) {
        this.sstatus = sstatus;
    }

    public String getSremark() {
        return sremark;
    }

    public void setSremark(String sremark) {
        this.sremark = sremark;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEntime() {
        return entime;
    }

    public void setEntime(String entime) {
        this.entime = entime;
    }

    @Override
    public String toString() {
        return "Student{" +
                "sid=" + sid +
                ", sname='" + sname + '\'' +
                ", snum='" + snum + '\'' +
                ", ssex='" + ssex + '\'' +
                ", sage=" + sage +
                ", cid=" + cid +
                ", sstatus='" + sstatus + '\'' +
                ", sremark='" + sremark + '\'' +
                ", address='" + address + '\'' +
                ", entime='" + entime + '\'' +
                '}';
    }
}
