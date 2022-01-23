package com.pojo;

import java.util.Date;

public class Commit_User {
    private int id;
    private int blog_id;
    private String author;
    private String content;
    private Date uptime;
    private String password;
    private String sex;
    private Date birthday;
    private String area;
    private String headphoto;
    private String question;
    private String answer;
    private int role;

    public Commit_User(int id, int blog_id, String author, String content, Date uptime, String password, String sex, Date birthday, String area, String headphoto, String question, String answer, int role) {
        this.id = id;
        this.blog_id = blog_id;
        this.author = author;
        this.content = content;
        this.uptime = uptime;
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
