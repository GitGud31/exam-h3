package com.h3hitema.examBack.util;

import java.util.Random;

public class Utils {
    public static String getRondomNumber(int generateCodeNumber) {
        return String.format("%04d", (new Random()).nextInt(generateCodeNumber));
    }
}
