using NPOI.HSSF.UserModel;
using NPOI.SS.UserModel;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

/// <summary>
/// Conver2Excel 的摘要描述
/// </summary>
public class Conver2Excel
{
    public Conver2Excel()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public byte[] ToXLS(DataTable dt,string SheetName)
    {
        HSSFWorkbook workbook = new HSSFWorkbook(); //創建新的Excel工作簿
        HSSFSheet u = (HSSFSheet)workbook.CreateSheet(SheetName); //(SheetName)工作表名稱
        HSSFRow rowHeader = (HSSFRow)u.CreateRow(0); //在索引0的位置建立表頭
        List<string> headName = new List<string>(); //先宣告一個空白的陣列名稱 headName

        for (int i = 0; i < dt.Columns.Count; i++) //將dt內資料每欄逐一讀出
        {
            headName.Add(dt.Columns[i].ColumnName);
        }
        //表頭
        for (int i = 0; i < headName.Count ; i++)
        {
            rowHeader.CreateCell(i).SetCellValue(headName[i]); //宣告建立表頭，並宣告表頭的值
            u.AutoSizeColumn(i); //AutoSizeColumn自動調整表格列寬度
        }
        

        int RowNumber = 1;
        for (int r = 0; r < dt.Rows.Count; r++)//將dt內資料每筆逐一讀出 //獲取當前列的寬度，然後對比本列的長度，取最大值
        {
            if (dt.Rows[r] != null)
            {
            
                HSSFRow rowItem = (HSSFRow)u.CreateRow(RowNumber); //將每筆資料輸入至工作表內，從欄位第1行開始，第0行圍表頭
                for (int c = 0; c < headName.Count; c++)
                {
                    if (dt.Rows[r][c] != null && dt.Rows[r][c] != DBNull.Value) //DBNull.Value 判斷資料庫的值是否為null
                    {
                        if (dt.Columns[c].DataType == typeof(Int32) ||  
                            dt.Columns[c].DataType == typeof(Int16) ||
                            dt.Columns[c].DataType == typeof(Int64))
                        {
                            rowItem.CreateCell(c).SetCellValue(Convert.ToInt32(dt.Rows[r][c])); //如果資料內包含INT資料類型時，將INT強制轉換INT32類型

                        }
                        else if (dt.Columns[c].DataType == typeof(Double))
                        {
                            rowItem.CreateCell(c).SetCellValue(Convert.ToDouble(dt.Rows[r][c])); //如果資料內包含浮點數資料類型時，將浮點數強制轉換浮點數類型
                        }
                        else
                        {
                            rowItem.CreateCell(c).SetCellValue(dt.Rows[r][c].ToString()); //將字串強制轉換字串類型
                            rowItem.GetCell(c).CellStyle.DataFormat = HSSFDataFormat.GetBuiltinFormat("@"); //取值給予欄位加入@

                        }
                    }
                }
            }
            RowNumber++;
        }
        for (int i = 0; i < headName.Count; i++)
        {
            u.AutoSizeColumn(i); 
        }
        MemoryStream ms = new MemoryStream(); //直接下載檔案
        workbook.Write(ms);
        byte[] bytes = ms.ToArray();
        return bytes;
    }

    public byte[] ToXLS(GridView gv, string SheetName)
    {
        HSSFWorkbook workbook = new HSSFWorkbook();
        HSSFSheet u = (HSSFSheet)workbook.CreateSheet(SheetName);
        HSSFRow rowHeader = (HSSFRow)u.CreateRow(0);
        List<string> headName = new List<string>();

        for (int i = 0; i < gv.HeaderRow.Cells.Count; i++)
        {
            
            headName.Add(gv.HeaderRow.Cells[i].Text);
        }
        //表頭
        for (int i = 0; i < headName.Count ; i++)
        {
            rowHeader.CreateCell(i).SetCellValue(headName[i]);
            u.AutoSizeColumn(i);
        }

        int RowNumber = 1;
        for (int r = 0; r < gv.Rows.Count; r++)
        {
            HSSFRow rowItem = (HSSFRow)u.CreateRow(RowNumber);
            for (int c = 0; c < headName.Count ; c++)
            {
                rowItem.CreateCell(c).SetCellValue(HttpUtility.HtmlDecode( gv.Rows[r].Cells[c].Text));

            }
            RowNumber++;
        }
        for (int i = 0; i < headName.Count ; i++)
        {
            u.AutoSizeColumn(i);

        }
        MemoryStream ms = new MemoryStream();
        workbook.Write(ms);
        byte[] bytes = ms.ToArray();
        return bytes;

    }
     
}