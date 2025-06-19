package com.example.kiwquiz.models;

public class Question {
    private int id;
    private String question;
    private String a, b, c, d, e;
    private String correctAnswer;

    public Question(int id, String question, String a, String b, String c, String d, String e, String correctAnswer) {
        this.id = id;
        this.question = question;
        this.a = a;
        this.b = b;
        this.c = c;
        this.d = d;
        this.e = e;
        this.correctAnswer = correctAnswer;
    }

    public int getId() { return id; }
    public String getQuestion() { return question; }
    public String getA() { return a; }
    public String getB() { return b; }
    public String getC() { return c; }
    public String getD() { return d; }
    public String getE() { return e; }
    public String getCorrectAnswer() { return correctAnswer; }

    public boolean checkAnswer(String answer) {
        return correctAnswer.equalsIgnoreCase(answer);
    }

    // Polymorphism (Overloading)
    public boolean checkAnswer(String answer, boolean showHint) {
        if (showHint) {
            System.out.println("Hint: Jawaban benar adalah " + correctAnswer.charAt(0));
        }
        return checkAnswer(answer);
    }

    public String getCategory() {
        return "General";
    }
}
