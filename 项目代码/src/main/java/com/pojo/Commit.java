package com.pojo;

import java.util.Date;

public class Commit {
    private int id;
    private int blog_id;
    private String author;
    private String content;
    private Date uptime;

    public Commit(int id, int blog_id, String author, String content, Date uptime) {
        this.id = id;
        this.blog_id = blog_id;
        this.author = author;
        this.content = content;
        this.uptime = uptime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getBlog_id() {
        return blog_id;
    }

    public void setBlog_id(int blog_id) {
        this.blog_id = blog_id;
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

    public Date getUptime() {
        return uptime;
    }

    public void setUptime(Date uptime) {
        this.uptime = uptime;
    }
}
