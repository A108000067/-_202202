using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// ViewConvert 的摘要描述
/// </summary>
public class ViewConvert {
    public ViewConvert() {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public static string getDateRangeString(object start, object end) {

        string returnString = "";
        if (end == DBNull.Value) {
            returnString = string.Format("{0} ~ 迄今", ((DateTime)start).ToString("yyyy-MM-dd"));
        } else {
            returnString = string.Format("{0} ~ {1}", ((DateTime)start).ToString("yyyy-MM-dd"), ((DateTime)end).ToString("yyyy-MM-dd"));
        }
        return returnString;

    }
    public static string Months2YearMonthString(int input) {         
        int years = input / 12;
        int months = input % 12;
        string returnString = "";
        if (years == 0) {
            returnString = string.Format("{0}月", months);
        } else {
            returnString = string.Format("{0}年{1}月", years, months);
        }
        return returnString;

    }
}