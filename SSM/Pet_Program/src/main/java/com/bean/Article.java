package com.bean;

public class Article {
    private int aid;//id
    private String title;//���±���
    private String contnet;//��������
    private String time;//ʱ��
    private String file_name;//�ļ���

    public Article() {
    }

    public Article(int id, String title, String contnet, String time, String file_name) {
        this.aid = id;
        this.title = title;
        this.contnet = contnet;
        this.time = time;
        this.file_name = file_name;
    }

    public int getAid() {
        return aid;
    }

    public void setAid(int aid) {
        this.aid = aid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContnet() {
        return contnet;
    }

    public void setContnet(String contnet) {
        this.contnet = contnet;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getFile_name() {
        return file_name;
    }

    public void setFile_name(String file_name) {
        this.file_name = file_name;
    }
}
