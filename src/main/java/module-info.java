module com.example.kiwquiz {
    requires javafx.controls;
    requires javafx.fxml;
    requires java.sql;


    opens com.example.kiwquiz to javafx.fxml;
    exports com.example.kiwquiz;
    exports com.example.kiwquiz.controllers;
    opens com.example.kiwquiz.controllers to javafx.fxml;
}