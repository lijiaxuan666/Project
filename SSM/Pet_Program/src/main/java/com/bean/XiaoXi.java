package com.bean;

//��Ϣʵ��
public class XiaoXi {
    private int xid;//id
    private String time;//����ʱ��
    private String content;//��Ϣ����
    private String user;//������
    private int read;//�Ƿ��Ѷ�

    public XiaoXi(int xid, String time, String content, String user, int read) {
        this.xid = xid;
        this.time = time;
        this.content = content;
        this.user = user;
        this.read = read;
    }

    public XiaoXi() {
    }

    public int getXid() {
        return xid;
    }

    public int getRead() {
        return read;
    }

    public void setRead(int read) {
        this.read = read;
    }

    public void setXid(int xid) {
        this.xid = xid;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "XiaoXi{" +
                "xid=" + xid +
                ", time='" + time + '\'' +
                ", content='" + content + '\'' +
                ", user='" + user + '\'' +
                ", read=" + read +
                '}';
    }
}
