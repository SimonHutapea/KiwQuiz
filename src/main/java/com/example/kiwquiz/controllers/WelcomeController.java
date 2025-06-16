package com.example.kiwquiz.controllers;

import com.example.kiwquiz.MainApp;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;

public class WelcomeController {

    @FXML
    private Button loginButton;

    @FXML
    private Button registerButton;

    @FXML
    void handleLogin(ActionEvent event) {
        try {
            MainApp.setRoot("login.fxml");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @FXML
    void handleRegister(ActionEvent event) {
        try {
            MainApp.setRoot("register.fxml");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
