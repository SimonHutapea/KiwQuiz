package com.example.kiwquiz.models;

public class CalculusQuestion extends Question {

    public static final String CATEGORY_NAME = "calculus"; // Tambahkan konstanta statis

    public CalculusQuestion(int id, String question, String a, String b, String c, String d, String e, String correctAnswer) {
        super(id, question, a, b, c, d, e, correctAnswer);
    }

    @Override
    public String getCategory() {
        return CATEGORY_NAME; // Mengembalikan konstanta
    }
}