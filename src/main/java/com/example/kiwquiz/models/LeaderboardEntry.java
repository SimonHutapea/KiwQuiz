package com.example.kiwquiz.models;

import javafx.beans.property.*;

public class LeaderboardEntry {
    private final StringProperty username;
    private final IntegerProperty score;

    public LeaderboardEntry(String username, int score) {
        this.username = new SimpleStringProperty(username);
        this.score = new SimpleIntegerProperty(score);
    }

    public StringProperty usernameProperty() {
        return username;
    }

    public IntegerProperty scoreProperty() {
        return score;
    }
}

