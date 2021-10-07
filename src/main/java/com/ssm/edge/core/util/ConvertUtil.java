package com.ssm.edge.core.util;

import java.io.IOException;
import java.lang.reflect.Field;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import org.apache.poi.xssf.usermodel.XSSFCell;

public class ConvertUtil {
    public static int ObjectToInt(Object _value) {
        int result = 0;

        result = Integer.parseInt((String) _value);

        return result;
    }

    public static int HexStringToInt(String _value) {
        int result = 0;

        result = Integer.parseInt(_value, 16);

        return result;
    }

    public static char AsciiIntToString(int _value) {
        char result = 0;

        result = (char) _value;

        return result;
    }

    public static String ArrayToString(List<?> inList) {
        String resultString = new Gson().toJson(inList);

        return resultString;
    }

    public static char HexStringToAsciiString(String _value) {
        char result = 0;

        result = (char) Integer.parseInt(_value, 16);

        return result;
    }

    public static Map convertObjectToMap(Object obj) {
        Map map = new HashMap();
        Field[] fields = obj.getClass().getDeclaredFields();
        for (int i = 0; i < fields.length; i++) {
            fields[i].setAccessible(true);
            try {
                map.put(fields[i].getName(), fields[i].get(obj));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return map;
    }

    public static String cellDataToString(XSSFCell cell) {
        String resultString = null;

        if (cell.getCellType().toString().equals("STRING")) {
            resultString = cell.getStringCellValue();
        } else if (cell.getCellType().toString().equals("NUMERIC")) {
            resultString = String.valueOf(cell.getNumericCellValue());
        } else if (cell.getCellType().toString().equals("DATE")) {
            resultString = String.valueOf(cell.getDateCellValue());
        }

        return resultString;
    }

    public static String dateToString(SimpleDateFormat format, Date date) {
        String resultString = null;

        resultString = format.format(date);

        return resultString;
    }

    public static long stringToLong(SimpleDateFormat format, String date) {
        long resultLong = 0;

        try {
            Date tempDate = format.parse(date);

            resultLong = tempDate.getTime();
        } catch (ParseException e) {
            e.printStackTrace();
        }

        return resultLong;
    }

    public static Date longToDate(long date) {
        Date resultDate = null;

        resultDate = new Date(date);

        return resultDate;
    }

    public static String longToString(SimpleDateFormat format, long date) {
        String resultString = null;

        Date tempDate = new Date(date);

        resultString = format.format(tempDate);

        return resultString;
    }

    public static long dateTolong(SimpleDateFormat format, Date date) {
        long resultLong = 0;

        String tempString = null;

        tempString = format.format(date);

        Date tempDate = null;
        try {
            tempDate = format.parse(tempString);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        resultLong = tempDate.getTime();

        return resultLong;
    }

    public static Date stringToDate(SimpleDateFormat format, String date) {
        Date resultDate = null;

        try {
            resultDate = format.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        return resultDate;
    }
}