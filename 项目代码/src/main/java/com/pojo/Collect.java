package com.pojo;

import java.util.Date;

public class Collect {
    private int id;
    private String user;
    private int blog_id;
    private Date date;

    public Collect(int id, String user, int blog_id, Date date) {
        this.id = id;
        this.user = user;
        this.blog_id = blog_id;
        this.date = date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public int getBlog_id() {
        return blog_id;
    }

    public void setBlog_id(int blog_id) {
        this.blog_id = blog_id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
