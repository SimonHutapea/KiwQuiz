package com.example.kiwquiz;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.stage.Stage;

public class MainApp extends Application {
    private static Stage mainStage;

    @Override
    public void start(Stage primaryStage) throws Exception {
        mainStage = primaryStage;
        primaryStage.setTitle("KiwQuiz");
        primaryStage.setScene(new Scene(FXMLLoader.load(getClass().getResource("/com/example/kiwquiz/welcome.fxml"))));
        primaryStage.show();
    }

    public static void setRoot(String fxml) throws Exception {
        mainStage.setScene(new Scene(FXMLLoader.load(MainApp.class.getResource("/com/example/kiwquiz/" + fxml))));
    }

    public static void main(String[] args) {
        launch(args);
    }
}
