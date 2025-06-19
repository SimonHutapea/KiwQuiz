package com.example.kiwquiz.controllers;

import com.example.kiwquiz.Database;
import com.example.kiwquiz.MainApp;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.*;
import com.example.kiwquiz.models.LeaderboardEntry;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LeaderboardController {

    @FXML
    private TableView<LeaderboardEntry> leaderboardTable;

    @FXML
    private TableColumn<LeaderboardEntry, String> usernameColumn;

    @FXML
    private TableColumn<LeaderboardEntry, Integer> scoreColumn;

    @FXML
    private Label titleLabel;

    @FXML
    public void initialize() {
        usernameColumn.setCellValueFactory(cellData -> cellData.getValue().usernameProperty());
        scoreColumn.setCellValueFactory(cellData -> cellData.getValue().scoreProperty().asObject());

        loadLeaderboard();
    }

    private void loadLeaderboard() {
        ObservableList<LeaderboardEntry> data = FXCollections.observableArrayList();
        try (Connection conn = Database.getConnection()) {
            String sql = "SELECT username, score FROM account ORDER BY score DESC";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                String username = rs.getString("username");
                int score = rs.getInt("score");
                data.add(new LeaderboardEntry(username, score));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        leaderboardTable.setItems(data);
    }

    @FXML
    void handleBack(ActionEvent event) {
        try {
            MainApp.setRoot("mainpage.fxml");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @FXML
    void handleClose(ActionEvent event) {
        try {
            MainApp.setRoot("mainpage.fxml");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
