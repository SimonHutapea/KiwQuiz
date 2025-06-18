package com.example.kiwquiz.controllers;

import com.example.kiwquiz.Database;
import com.example.kiwquiz.MainApp;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.*;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class RegisterController {

    @FXML
    private TextField usernameField;

    @FXML
    private PasswordField passwordField;

    @FXML
    private PasswordField confirmPasswordField;

    @FXML
    private Label errorLabel;

    @FXML
    void handleRegister(ActionEvent event) {
        String username = usernameField.getText();
        String password = passwordField.getText();
        String confirmPassword = confirmPasswordField.getText();

        if (!password.equals(confirmPassword)) {
            errorLabel.setText("Password tidak cocok!");
            return;
        }

        try (Connection conn = Database.getConnection()) {
            String sql = "INSERT INTO account (id, username, password, score) VALUES (NULL, ?, ?, 0)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);
            stmt.executeUpdate();
            MainApp.setRoot("mainpage.fxml");
        } catch (Exception e) {
            e.printStackTrace();
            errorLabel.setText("Gagal register (username sudah ada?)");
        }
    }

    @FXML
    void handleBack(ActionEvent event) {
        try {
            MainApp.setRoot("welcome.fxml");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
