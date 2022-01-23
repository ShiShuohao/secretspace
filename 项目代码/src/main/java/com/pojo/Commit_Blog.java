package com.pojo;

import java.util.Date;

public class Commit_Blog {
    private int id;
    private int blog_id;
    private String commit_author;
    private String commit_content;
    private Date commit_uptime;
    private String headline;
    private String blog_author;
    private String blog_content;
    private String type;
    private int clicknum;
    private int commitnum;
    private Date blog_uptime;

    public Commit_Blog(int id, int blog_id, String commit_author, String commit_content, Date commit_uptime, String headline, String blog_author, String blog_content, String type, int clicknum, int commitnum, Date blog_uptime) {
        this.id = id;
        this.blog_id = blog_id;
        this.commit_author = commit_author;
        this.commit_content = commit_content;
        this.commit_uptime = commit_uptime;
        this.headline = headline;
        this.blog_author = blog_author;
        this.blog_content = blog_content;
        this.type = type;
        this.clicknum = clicknum;
        this.commitnum = commitnum;
        this.blog_uptime = blog_uptime;
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

    public String getCommit_author() {
        return commit_author;
    }

    public void setCommit_author(String commit_author) {
        this.commit_author = commit_author;
    }

    public String getCommit_content() {
        return commit_content;
    }

    public void setCommit_content(String commit_content) {
        this.commit_content = commit_content;
    }

    public Date getCommit_uptime() {
        return commit_uptime;
    }

    public void setCommit_uptime(Date commit_uptime) {
        this.commit_uptime = commit_uptime;
    }

    public String getHeadline() {
        return headline;
    }

    public void setHeadline(String headline) {
        this.headline = headline;
    }

    public String getBlog_author() {
        return blog_author;
    }

    public void setBlog_author(String blog_author) {
        this.blog_author = blog_author;
    }

    public String getBlog_content() {
        return blog_content;
    }

    public void setBlog_content(String blog_content) {
        this.blog_content = blog_content;
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

    public Date getBlog_uptime() {
        return blog_uptime;
    }

    public void setBlog_uptime(Date blog_uptime) {
        this.blog_uptime = blog_uptime;
    }
}
