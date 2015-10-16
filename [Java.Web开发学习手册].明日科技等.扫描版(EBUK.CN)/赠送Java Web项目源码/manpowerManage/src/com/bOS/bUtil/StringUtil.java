package com.bOS.bUtil;

/**
 * @author BWeiMing
 *
 */
public class StringUtil {
    
    public static String notNull(String s){
        if(s==null||s.length()<1)
            return "";
        return s;
    }
}
