package com.jee.presentation.util;

import com.google.common.base.Charsets;
import com.google.common.hash.Hashing;

public class HashPasswordGenerator {
    public static String generateHash(String password) {
        return Hashing.sha256().hashString(password, Charsets.UTF_8).toString();
    }
}
