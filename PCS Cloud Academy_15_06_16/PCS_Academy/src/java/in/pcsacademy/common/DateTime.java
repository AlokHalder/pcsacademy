package in.pcsacademy.common;

import java.util.*;
import java.text.*;

public class DateTime {

    public static Date date;

    public static String getTodayDate() {
        date = new Date();
        String format = "dd/MM/yyyy";//date format:
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        String todayDate = sdf.format(date);

        return todayDate;
    }

    public static String getCurrentYear() {
        String todayDate = getTodayDate();
        String currentYear = todayDate.substring(6).trim();

        return currentYear;
    }

    public static String getTodayTime() {
        date = new Date();
        String format2 = "HH:mm:ss a";//time format:
        SimpleDateFormat sdf2 = new SimpleDateFormat(format2);
        String todayTime = sdf2.format(date);

        return todayTime;
    }

//    public static void main(String[] args) {
//        String todayDate = DateTime.getTodayDate();
//        String year = todayDate.substring(6);
//        System.out.println(year);
//
//        System.out.println(getCurrentYear());
//    }
}
