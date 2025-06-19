package com.example.kiwquiz.controllers;

import com.example.kiwquiz.Database;
import com.example.kiwquiz.MainApp;
import com.example.kiwquiz.models.Account;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginController {

    @FXML
    private TextField usernameField;

    @FXML
    private PasswordField passwordField;

    @FXML
    private Label errorLabel;

    @FXML
    void handleLogin(ActionEvent event) {
        String username = usernameField.getText().trim();
        String password = passwordField.getText().trim();

        if (username.isEmpty() || password.isEmpty()) {
            errorLabel.setText("Username dan Password tidak boleh kosong!");
            return;
        }

        try (Connection conn = Database.getConnection()) {
            String sql = "SELECT * FROM account WHERE username = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String storedPassword = rs.getString("password");
                if (password.equals(storedPassword)) { // Gunakan hash check jika sudah pakai hashing
                    int id = rs.getInt("id");
                    int score = rs.getInt("score");
                    Session.setAccount(new Account(id, username, password, score));
                    MainApp.setRoot("mainpage.fxml");
                } else {
                    errorLabel.setText("Password salah!");
                }
            } else {
                errorLabel.setText("Username tidak ditemukan!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            errorLabel.setText("Terjadi kesalahan koneksi.");
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
