package com.abir.myshop.helper;

import java.io.File;

public class Helper {
    // Existing method to get the first 10 words of a string
    public static String get10Words(String desc) {
        String[] words = desc.split(" ");
        if (words.length > 10) {
            StringBuilder res = new StringBuilder();
            for (int i = 0; i < 10; i++) {
                res.append(words[i]).append(" ");
            }
            return res.toString().trim() + "...";
        } else {
            return desc + "...";
        }
    }
    
    // New method to check if a file exists
    public static boolean doesFileExist(String filePath) {
        File file = new File(filePath);
        return file.exists();
    }
}
