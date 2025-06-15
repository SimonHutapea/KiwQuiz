package com.example.kiwquiz;

import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.stage.Stage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class HelloApplication extends Application {

    private Connection connectDatabase() {
        String url = "jdbc:mysql://localhost:3306/kiwquiz";
        String user = "root";
        String password = ""; // default XAMPP root password kosong

        try {
            // Muat driver (opsional untuk JDBC 4+, tapi aman ditambahkan)
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection conn = DriverManager.getConnection(url, user, password);
            System.out.println("Koneksi ke database berhasil!");
            return conn;
        } catch (ClassNotFoundException e) {
            System.out.println("Driver JDBC tidak ditemukan.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("Koneksi gagal!");
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void start(Stage stage) {
        Connection conn = connectDatabase();

        Label label;
        if (conn != null) {
            label = new Label("Koneksi ke database berhasil!");
        } else {
            label = new Label("Koneksi ke database gagal!");
        }

        Scene scene = new Scene(label, 400, 200);
        stage.setTitle("Test Koneksi MySQL");
        stage.setScene(scene);
        stage.show();
    }

    public static void main(String[] args) {
        launch();
    }
}
