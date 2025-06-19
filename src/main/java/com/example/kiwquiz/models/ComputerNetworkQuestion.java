package com.example.kiwquiz.models;

public class ComputerNetworkQuestion extends Question {

    public static final String CATEGORY_NAME = "computer_network"; // Tambahkan konstanta statis

    public ComputerNetworkQuestion(int id, String question, String a, String b, String c, String d, String e, String correctAnswer) {
        super(id, question, a, b, c, d, e, correctAnswer);
    }

    @Override
    public String getCategory() {
        return CATEGORY_NAME; // Mengembalikan konstanta
    }
}