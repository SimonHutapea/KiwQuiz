package com.example.kiwquiz.models;

public class IntroductionToComputerScienceQuestion extends Question {

    public static final String CATEGORY_NAME = "introduction_to_computer_science"; // Tambahkan konstanta statis

    public IntroductionToComputerScienceQuestion(int id, String question, String a, String b, String c, String d, String e, String correctAnswer) {
        super(id, question, a, b, c, d, e, correctAnswer);
    }

    @Override
    public String getCategory() {
        return CATEGORY_NAME; // Mengembalikan konstanta
    }
}