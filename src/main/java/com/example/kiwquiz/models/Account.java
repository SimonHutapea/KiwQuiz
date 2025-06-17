package com.example.kiwquiz.models;

public class Account {
    private int id;
    private String username;
    private String password;
    private int score;

    public Account(int id, String username, String password, int score) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.score = score;
    }

    public int getId() { return id; }
    public String getUsername() { return username; }
    public String getPassword() { return password; }
    public int getScore() { return score; }

    public void setUsername(String username) { this.username = username; }
    public void setPassword(String password) { this.password = password; }
    public void setScore(int score) { this.score = score; }
}
