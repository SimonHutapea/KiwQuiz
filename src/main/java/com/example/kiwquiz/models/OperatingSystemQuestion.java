package com.example.kiwquiz.models;

public class OperatingSystemQuestion extends Question {
    public OperatingSystemQuestion (int id, String question, String a, String b, String c, String d, String e, String correctAnswer) {
        super(id, question, a, b, c, d, e, correctAnswer);
    }

    @Override
    public String getCategory() {
        return "operating_system";
    }
}