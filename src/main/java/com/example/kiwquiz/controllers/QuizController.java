package com.example.kiwquiz.controllers;

import com.example.kiwquiz.Database;
import com.example.kiwquiz.MainApp;
import com.example.kiwquiz.models.Account;
import com.example.kiwquiz.models.Question;
import com.example.kiwquiz.models.CalculusQuestion;
import com.example.kiwquiz.models.ComputerNetworkQuestion;
import com.example.kiwquiz.models.DataStructureAndAlgorithmQuestion;
import com.example.kiwquiz.models.IntroductionToComputerScienceQuestion;
import com.example.kiwquiz.models.OperatingSystemQuestion;
import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.*;
import javafx.util.Duration;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

public class QuizController {

    @FXML
    private Label questionLabel;

    @FXML
    private Label stageLabel;

    @FXML
    private Label timerLabel;

    @FXML
    private RadioButton optionA, optionB, optionC, optionD, optionE;

    @FXML
    private ToggleGroup optionsGroup;

    private int stage = 1;

    private Timeline timeline;
    private int timeRemaining = 60;

    private int currentQuestionIndex = 0;
    private List<Question> questions = new ArrayList<>();

    private int benar = 0, salah = 0, kosong = 0;

    private String[] tableNames = {
            CalculusQuestion.CATEGORY_NAME,
            ComputerNetworkQuestion.CATEGORY_NAME,
            DataStructureAndAlgorithmQuestion.CATEGORY_NAME,
            IntroductionToComputerScienceQuestion.CATEGORY_NAME,
            OperatingSystemQuestion.CATEGORY_NAME
    };

    private int currentTableIndex = 0;

    @FXML
    public void initialize() {
        optionsGroup = new ToggleGroup();
        optionA.setToggleGroup(optionsGroup);
        optionB.setToggleGroup(optionsGroup);
        optionC.setToggleGroup(optionsGroup);
        optionD.setToggleGroup(optionsGroup);
        optionE.setToggleGroup(optionsGroup);
        loadQuestions();
        showQuestion();
        startTimer();
    }

    private void loadQuestions() {
        try (Connection conn = Database.getConnection()) {
            String sql = "SELECT * FROM " + tableNames[currentTableIndex] + " ORDER BY RAND() LIMIT 20";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            questions.clear();
            while (rs.next()) {
                questions.add(new Question(
                        rs.getInt("id"),
                        rs.getString("question"),
                        rs.getString("a"),
                        rs.getString("b"),
                        rs.getString("c"),
                        rs.getString("d"),
                        rs.getString("e"),
                        rs.getString("correct_answer")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void showQuestion() {
        if (currentQuestionIndex < questions.size()) {
            Question q = questions.get(currentQuestionIndex);
            questionLabel.setText(q.getQuestion());
            optionA.setText(q.getA());
            optionB.setText(q.getB());
            optionC.setText(q.getC());
            optionD.setText(q.getD());
            optionE.setText(q.getE());
            optionsGroup.selectToggle(null);
            resetTimer();
        } else {
            currentTableIndex++;
            stage++;
            stageLabel.setText("" + stage);
            if (currentTableIndex < tableNames.length) {
                currentQuestionIndex = 0;
                loadQuestions();
                showQuestion();
            } else {
                finishQuiz();
            }
        }
    }

    private void startTimer() {
        timeline = new Timeline(new KeyFrame(Duration.seconds(1), e -> {
            timeRemaining--;
            timerLabel.setText(timeRemaining + " detik");
            if (timeRemaining <= 0) {
                kosong++;
                nextQuestion();
            }
        }));
        timeline.setCycleCount(Timeline.INDEFINITE);
        timeline.play();
    }


    private void resetTimer() {
        timeRemaining = 60;
        timerLabel.setText(timeRemaining + " detik");
    }

    @FXML
    void handleNext(ActionEvent event) {
        String selected = null;
        if (optionA.isSelected()) selected = "A";
        else if (optionB.isSelected()) selected = "B";
        else if (optionC.isSelected()) selected = "C";
        else if (optionD.isSelected()) selected = "D";
        else if (optionE.isSelected()) selected = "E";

        if (selected == null) {
            kosong++;
        }

        boolean correct = questions.get(currentQuestionIndex).checkAnswer(selected, true);
        if (correct) {
            benar++;
        } else {
            salah++;
        }

        nextQuestion();
    }

    private void nextQuestion() {
        currentQuestionIndex++;
        showQuestion();
    }

    private void finishQuiz() {
        timeline.stop();
        int score = (benar * 5) - (salah * 2) - (kosong * 1);
        saveScore(score);
        showLeaderboard();
    }

    private void saveScore(int newScore) {
        Account acc = Session.getAccount();
        if (acc != null) {
            try (Connection conn = Database.getConnection()) {
                String selectSql = "SELECT score FROM account WHERE id = ?";
                PreparedStatement selectStmt = conn.prepareStatement(selectSql);
                selectStmt.setInt(1, acc.getId());
                ResultSet rs = selectStmt.executeQuery();

                int oldScore = 0;
                if (rs.next()) {
                    oldScore = rs.getInt("score");
                }
                rs.close();
                selectStmt.close();

                int scoreToSave = Math.max(oldScore, newScore);

                String updateSql = "UPDATE account SET score = ? WHERE id = ?";
                PreparedStatement updateStmt = conn.prepareStatement(updateSql);
                updateStmt.setInt(1, scoreToSave);
                updateStmt.setInt(2, acc.getId());
                updateStmt.executeUpdate();

                acc.setScore(scoreToSave);
                System.out.println("Score saved: " + scoreToSave + " (Old: " + oldScore + ", New: " + newScore + ")");
            } catch (Exception e) {
                System.err.println("Error saving score: " + e.getMessage());
                e.printStackTrace();
            }
        } else {
            System.err.println("No account found in session to save score.");
        }
    }

    private void showLeaderboard() {
        try {
            MainApp.setRoot("leaderboard.fxml");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
