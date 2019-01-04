package com.zrtjoa.enums;

/**
 * copyright    <a href="http://www.qaqavr.com/>中锐</a>
 * <pre>
 *     @author      zwy
 *     @date        2018/12/10 18:01
 *     email        1092478224@qq.com
 *     desc
 * </pre>
 */
public enum  WeekEnum {

    /**
     * 星期枚举
     * @date 2018/12/10 18:05
     */
    MONDAY("Monday","1"),

    TUESDAY("Tuesday","2"),

    WEDNESDAY("Wednesday","3"),

    THURSDAY("Thursday","4"),

    FRIDAY("Friday","5"),

    SATURDAY("Saturday","6")

    ;

    public final String day ;

    public final String code ;

    WeekEnum(String day,String code){
        this.day = day ;
        this.code = code ;
    }

    public static WeekEnum returnDayByCode(String code){
        for (WeekEnum we: values()) {
            if(we.code.equals(code)){
                return we ;
            }
        }
        return null ;
    }

}
