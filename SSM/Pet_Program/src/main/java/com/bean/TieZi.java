package com.bean;

//帖子实体对象
public class TieZi {
    private int tid;//id
    private String time;//时间
    private String kind;//种类：狗，猫
    private String type;//类型：领养，送养，找宠物，找主人，百科
    private String phone;//联系方式
    private String title;//内容
    private String status;//是否审核
    private String status2;//是否领养
    private String imag;//图片
    private String user;//发布者

    public TieZi() {
    }


    @Override
    public String toString() {
        return "TieZi{" +
                "tid=" + tid +
                ", time='" + time + '\'' +
                ", kind='" + kind + '\'' +
                ", type='" + type + '\'' +
                ", phone='" + phone + '\'' +
                ", title='" + title + '\'' +
                ", status='" + status + '\'' +
                ", status2='" + status2 + '\'' +
                ", imag='" + imag + '\'' +
                '}';
    }

    public TieZi(int tid, String time, String type, String title, String status, String user) {
        this.tid = tid;
        this.time = time;
        this.type = type;
        this.title = title;
        this.status = status;
        this.user = user;
    }

    public TieZi(int tid, String time, String kind, String type, String phone, String title, String status, String status2, String imag, String user) {
        this.tid = tid;
        this.time = time;
        this.kind = kind;
        this.type = type;
        this.phone = phone;
        this.title = title;
        this.status = status;
        this.status2 = status2;
        this.imag = imag;
        this.user = user;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getKind() {
        return kind;
    }

    public void setKind(String kind) {
        this.kind = kind;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getStatus2() {
        return status2;
    }

    public void setStatus2(String status2) {
        this.status2 = status2;
    }

    public String getImag() {
        return imag;
    }

    public void setImag(String imag) {
        this.imag = imag;
    }

    public int getTid() {
        return tid;
    }

    public void setTid(int tid) {
        this.tid = tid;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
