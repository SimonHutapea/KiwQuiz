package com.example.kiwquiz.controllers;

import com.example.kiwquiz.Database;
import com.example.kiwquiz.MainApp;
import com.example.kiwquiz.models.Account;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.*;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class ProfileController {

    @FXML
    private Label usernameLabel;

    @FXML
    private PasswordField newPasswordField;

    @FXML
    private TextField newUsernameField;

    @FXML
    private Label messageLabel;

    @FXML
    public void initialize() {
        Account acc = Session.getAccount();
        if (acc != null) {
            usernameLabel.setText("Username: " + acc.getUsername());
        }
    }

    @FXML
    void handleChangeUsername(ActionEvent event) {
        String newUsername = newUsernameField.getText().trim();
        if (newUsername.isEmpty()) {
            messageLabel.setText("Nama baru tidak boleh kosong.");
            return;
        }

        try (Connection conn = Database.getConnection()) {
            String sql = "UPDATE account SET username = ? WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, newUsername);
            stmt.setInt(2, Session.getAccount().getId());
            stmt.executeUpdate();

            Session.getAccount().setUsername(newUsername);
            usernameLabel.setText("Username: " + newUsername);
            messageLabel.setText("Nama berhasil diubah.");
        } catch (Exception e) {
            e.printStackTrace();
            messageLabel.setText("Gagal mengganti nama.");
        }
    }

    @FXML
    void handleChangePassword(ActionEvent event) {
        String newPassword = newPasswordField.getText().trim();
        if (newPassword.isEmpty()) {
            messageLabel.setText("Password baru tidak boleh kosong.");
            return;
        }

        try (Connection conn = Database.getConnection()) {
            String sql = "UPDATE account SET password = ? WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, newPassword);
            stmt.setInt(2, Session.getAccount().getId());
            stmt.executeUpdate();

            Session.getAccount().setPassword(newPassword);
            messageLabel.setText("Password berhasil diubah.");
        } catch (Exception e) {
            e.printStackTrace();
            messageLabel.setText("Gagal mengganti password.");
        }
    }

    @FXML
    void handleLogout(ActionEvent event) {
        Session.setAccount(null);
        try {
            MainApp.setRoot("welcome.fxml");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @FXML
    void handleBack(ActionEvent event) {
        try {
            MainApp.setRoot("mainpage.fxml");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

