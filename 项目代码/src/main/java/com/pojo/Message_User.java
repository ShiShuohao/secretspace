package com.pojo;

import java.util.Date;

public class Message_User {
    private int id;
    private String username_from;
    private String username_to;
    private String headline;
    private String content;
    private Date sendtime;
    private int state;
    private String password;
    private String sex;
    private Date birthday;
    private String area;
    private String headphoto;
    private String question;
    private String answer;
    private int role;

    public Message_User(int id, String username_from, String username_to, String headline, String content, Date sendtime, int state, String password, String sex, Date birthday, String area, String headphoto, String question, String answer, int role) {
        this.id = id;
        this.username_from = username_from;
        this.username_to = username_to;
        this.headline = headline;
        this.content = content;
        this.sendtime = sendtime;
        this.state = state;
        this.password = password;
        this.sex = sex;
        this.birthday = birthday;
        this.area = area;
        this.headphoto = headphoto;
        this.question = question;
        this.answer = answer;
        this.role = role;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getHeadphoto() {
        return headphoto;
    }

    public void setHeadphoto(String headphoto) {
        this.headphoto = headphoto;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }
}
