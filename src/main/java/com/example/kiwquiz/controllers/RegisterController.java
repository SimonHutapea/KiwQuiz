package com.example.kiwquiz.controllers;

import com.example.kiwquiz.Database;
import com.example.kiwquiz.MainApp;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
        String username = usernameField.getText().trim();
        String password = passwordField.getText().trim();
        String confirmPassword = confirmPasswordField.getText().trim();

        if (username.isEmpty() || password.isEmpty()) {
            errorLabel.setText("Username dan Password tidak boleh kosong!");
            return;
        }

        if (!password.equals(confirmPassword)) {
            errorLabel.setText("Password tidak cocok!");
            return;
        }

        try (Connection conn = Database.getConnection()) {
            // Cek apakah username sudah ada
            String checkSql = "SELECT * FROM account WHERE username = ?";
            PreparedStatement checkStmt = conn.prepareStatement(checkSql);
            checkStmt.setString(1, username);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                errorLabel.setText("Username sudah digunakan!");
                return;
            }

            // Insert akun baru
            String insertSql = "INSERT INTO account (username, password, score) VALUES (?, ?, 0)";
            PreparedStatement insertStmt = conn.prepareStatement(insertSql);
            insertStmt.setString(1, username);
            insertStmt.setString(2, password);
            insertStmt.executeUpdate();

            MainApp.setRoot("mainpage.fxml");
        } catch (Exception e) {
            e.printStackTrace();
            errorLabel.setText("Gagal register.");
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
