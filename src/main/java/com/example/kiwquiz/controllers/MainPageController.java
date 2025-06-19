package com.example.kiwquiz.controllers;

import com.example.kiwquiz.MainApp;
import com.example.kiwquiz.models.Account;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.Label;

public class MainPageController {

    @FXML
    private Label usernameLabel;

    @FXML
    private Label scoreLabel;

    @FXML
    private Button leaderboardButton;

    @FXML
    private Button startQuizButton;

    @FXML
    private Button editProfileButton;

    @FXML
    public void initialize() {
        Account acc = Session.getAccount();
        if (acc != null) {
            usernameLabel.setText(acc.getUsername());
            scoreLabel.setText("" + acc.getScore());
        }
    }

    @FXML
    void handleLeaderboard(ActionEvent event) {
        try {
            MainApp.setRoot("leaderboard.fxml");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @FXML
    void handleStartQuiz(ActionEvent event) {
        try {
            MainApp.setRoot("quiz.fxml");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @FXML
    void handleEditProfile(ActionEvent event) {
        try {
            MainApp.setRoot("profile.fxml");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
