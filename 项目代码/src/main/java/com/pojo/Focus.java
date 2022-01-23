package com.pojo;

public class Focus {
    private int id;
    private String username_from;
    private String username_to;

    public Focus(int id, String username_from, String username_to) {
        this.id = id;
        this.username_from = username_from;
        this.username_to = username_to;
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
}
