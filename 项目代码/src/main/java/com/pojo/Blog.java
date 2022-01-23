package com.pojo;

import java.util.Date;

public class Blog {
    private int id;
    private String headline;
    private String author;
    private String content;
    private String type;
    private int clicknum;
    private int commitnum;
    private Date uptime;

    public Blog(int id, String headline, String author, String content, String type, int clicknum, int commitnum, Date uptime) {
        this.id = id;
        this.headline = headline;
        this.author = author;
        this.content = content;
        this.type = type;
        this.clicknum = clicknum;
        this.commitnum = commitnum;
        this.uptime = uptime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getHeadline() {
        return headline;
    }

    public void setHeadline(String headline) {
        this.headline = headline;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getClicknum() {
        return clicknum;
    }

    public void setClicknum(int clicknum) {
        this.clicknum = clicknum;
    }

    public int getCommitnum() {
        return commitnum;
    }

    public void setCommitnum(int commitnum) {
        this.commitnum = commitnum;
    }

    public Date getUptime() {
        return uptime;
    }

    public void setUptime(Date uptime) {
        this.uptime = uptime;
    }
}