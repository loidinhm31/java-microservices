package com.flo.administrationservice.utilities;

import java.text.Normalizer;

public class DiacriticsUtils {

    public static boolean hasDiacritics(String s) {
        String s2 = Normalizer.normalize(s, Normalizer.Form.NFD);
        return s2.matches("(?s).*\\p{InCombiningDiacriticalMarks}.*");
    }
}