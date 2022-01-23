package com.pojo;

import java.util.Date;

public class Log {
    private int id;
    private String version;
    private Date date;
    private String content;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Log(int id, String version, Date date, String content) {
        this.id = id;
        this.version = version;
        this.date = date;
        this.content = content;
    }
}
