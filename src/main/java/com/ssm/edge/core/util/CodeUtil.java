package com.ssm.edge.core.util;

import java.text.SimpleDateFormat;

public class CodeUtil {
    public static String getCode(String type, int index) {
        String resultString = null;

        SimpleDateFormat format = new SimpleDateFormat ( "yyyyMMddHHmmss");
        String format_time = format.format (System.currentTimeMillis());

        String sequenceStr = ("000000" + index);

        resultString = type + format_time + sequenceStr.substring(sequenceStr.length()-6, sequenceStr.length());

        return resultString;
    }

    public static String getRealName(String fullname, String checkStr) {
        String resultString = null;

        resultString = fullname.substring(fullname.lastIndexOf(checkStr)+1, fullname.length());

        return resultString;
    }

    public static String getGroupFullName(String fullname, String checkStr) {
        String resultString = null;

        resultString = fullname.substring(0, fullname.lastIndexOf(checkStr));

        return resultString;
    }
}
