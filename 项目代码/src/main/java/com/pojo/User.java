package com.pojo;

import java.util.Date;

public class User {
    private String username;
    private String password;
    private String sex;
    private Date birthday;
    private String area;
    private String headphoto;
    private String question;
    private String answer;
    private int role;

    public User(String username, String password, String sex, Date birthday, String area, String headphoto, String question, String answer, int role) {
        this.username = username;
        this.password = password;
        this.sex = sex;
        this.birthday = birthday;
        this.area = area;
        this.headphoto = headphoto;
        this.question = question;
        this.answer = answer;
        this.role = role;
    }

    public User(String username, String password, String sex, String s, Object area, Object headphoto, Object question, Object answer, int role) {
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
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