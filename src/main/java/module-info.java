module com.example.kiwquiz {
    requires javafx.controls;
    requires javafx.fxml;


    opens com.example.kiwquiz to javafx.fxml;
    exports com.example.kiwquiz;
}