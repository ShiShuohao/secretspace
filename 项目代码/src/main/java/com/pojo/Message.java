package com.pojo;

import java.util.Date;

public class Message {
    private int id;
    private String username_from;
    private String username_to;
    private String headline;
    private String content;
    private Date sendtime;
    private int state;

    public Message(int id, String username_from, String username_to, String headline, String content, Date sendtime, int state) {
        this.id = id;
        this.username_from = username_from;
        this.username_to = username_to;
        this.headline = headline;
        this.content = content;
        this.sendtime = sendtime;
        this.state = state;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername_from() {
        return username_from;
    }

    public void setUsername_from(String username_from) {
        this.username_from = username_from;
    }

    public String getUsername_to() {
        return username_to;
    }

    public void setUsername_to(String username_to) {
        this.username_to = username_to;
    }

    public String getHeadline() {
        return headline;
    }

    public void setHeadline(String headline) {
        this.headline = headline;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getSendtime() {
        return sendtime;
    }

    public void setSendtime(Date sendtime) {
        this.sendtime = sendtime;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }
}
