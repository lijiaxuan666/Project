package com.bean;

public class Article {
    private int aid;//id
    private String title;//文章标题
    private String contnet;//文章内容
    private String time;//时间
    private String file_name;//文件名

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
