package com.example.kiwquiz.controllers;

import com.example.kiwquiz.models.Account;

public class Session {
    private static Account account;

    public static void setAccount(Account acc) {
        account = acc;
    }

    public static Account getAccount() {
        return account;
    }
}
