using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Threading;
using System.Web.UI;


using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Transactions;
using System.Web.UI.WebControls;

public partial class VenueStatisticsDetail_v1 : Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Pi pi = (Pi)Session["PI"];
            var powerLevel = Security.getPowerLevel(pi);

            //判斷權限控制
            if (powerLevel.level.Equals(1))
            {
                DataLoad();
            }
            else
            {
                Response.Redirect("ErrorPage.aspx");
                return;
            }
        }
    }

    protected void DataLoad()
    {
        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
        {
            conn.Open();

            string 學年 = Request.QueryString["syear"];
            string 學期 = Request.QueryString["semester"];
            string 場地編號 = Request.QueryString["number"];
            string 場地名稱 = Request.QueryString["name"];

            //場地使用清單標題
            string sqlstr = @"
                SELECT *
                FROM (
	                SELECT b.[學年], b.[學期]
		                , a.[場地代碼] AS [場地編號]
		                , a.[建物名稱]
	                    , COALESCE(a.[場地名稱], b.[場地名稱]) AS [場地名稱]
	                    , a.[樓層名稱]
	                    , b.[分類] AS [使用分類]
	                FROM [IR].[dbo].[場地V場地使用率列管清冊] AS a
	                FULL OUTER JOIN (
		                SELECT * 
		                FROM [IR].[dbo].[場地V使用統計] 
		                WHERE [學年] = @學年 AND [學期] = @學期
	                ) AS b ON b.[場地名稱] = a.[場地代碼]
                ) AS t
            ";
            //判斷有沒有編號，沒編號就where場地名稱
            if (string.IsNullOrEmpty(場地編號))
            {
                sqlstr += "WHERE [場地名稱] = @場地名稱";
            }
            else
            {
                sqlstr += "WHERE [場地編號] = @場地編號";
            }

            SqlCommand cmd = new SqlCommand(sqlstr, conn);
            cmd.Parameters.AddWithValue("@學年", 學年);
            cmd.Parameters.AddWithValue("@學期", 學期);
            cmd.Parameters.AddWithValue("@場地編號", 場地編號);
            cmd.Parameters.AddWithValue("@場地名稱", 場地名稱);
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {
                span_場地編號.InnerText = sdr["場地編號"].ToString();
                span_建物名稱.InnerText = sdr["建物名稱"].ToString();
                span_樓層名稱.InnerText = sdr["樓層名稱"].ToString();
                span_場地名稱.InnerText = sdr["場地名稱"].ToString();
            }
            sdr.Close();

            //日、夜間部資料
            sqlstr = @"
                SELECT DISTINCT [學年], [學期], [學部名稱], [學院名稱], [學制名稱]
                 , [科系名稱], [班級名稱], [課程名稱], [開課流水號], [授課教師], [授課地點名稱], [上課時間]
                FROM [dbo].[View_開排課檢視表_教學大綱專用]
                WHERE [學年]=@學年 AND [學期]=@學期 
                AND [授課地點名稱] LIKE '%' + @授課地點名稱 + '%'
                ORDER BY [班級名稱], [上課時間]
            ";

            cmd = new SqlCommand(sqlstr, conn);
            cmd.Parameters.AddWithValue("學年", 學年);
            cmd.Parameters.AddWithValue("學期", 學期);
            cmd.Parameters.AddWithValue("授課地點名稱", string.IsNullOrWhiteSpace(場地編號) ? 場地名稱 : 場地編號); //如果沒有場地編號就用場地名稱
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            //Label_counter.Text = dt.Rows.Count.ToString(); //顯示筆數
            ListView1.DataSource = dt;
            ListView1.DataBind();

            //推廣教育資料
            sqlstr = @"
                SELECT [推教E課程基本資料ID]
                , [課程中文名稱], [場地識別碼], [從屬名稱], [場地名稱], [教師中文姓名]
                , SUM(ISNULL(CAST(DATEDIFF(MINUTE, [授課時間起始], [授課時間結束]) AS FLOAT) / 60, 0)) AS [使用時數]
                , [授課時間起始], [授課時間結束]
                FROM [advedusys].[dbo].[推教V教學內容]
                WHERE [場地識別碼]=@場地識別碼
                AND [dbo].[getSyear]([授課時間起始])=@學年
                AND [dbo].[getSemester]([授課時間起始])=@學期
                GROUP BY [推教E課程基本資料ID], [課程中文名稱], [場地識別碼], [從屬名稱], [場地名稱]
                , [授課時間起始], [授課時間結束], [教師中文姓名]
            ";
            cmd = new SqlCommand(sqlstr, conn);
            cmd.Parameters.AddWithValue("場地識別碼", 場地編號);
            cmd.Parameters.AddWithValue("學年", 學年);
            cmd.Parameters.AddWithValue("學期", 學期);
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            ListView2.DataSource = dt;
            ListView2.DataBind();

            //微學分資料
            sqlstr = @"
                SELECT [微學分E基本資料ID], [學年], [學期]
                 , [主辦單位], [協辦單位], [課程中文名稱], [課程英文名稱]
                 , [授課教師姓名], [場地識別碼], [從屬名稱], [地點]
                 , [活動日期], [開始時間], [結束時間]
                 , ROUND(SUM(ISNULL(CAST(DATEDIFF(MINUTE, [開始時間], [結束時間]) AS FLOAT) / 60, 0)), 2) AS [使用時數]
                FROM [advedusys].[dbo].[微學分V課程內容明細]
                WHERE 學年=@學年 AND 學期=@學期 AND 場地識別碼=@場地識別碼
                GROUP BY [微學分E基本資料ID], [學年], [學期]
                 , [主辦單位], [協辦單位], [課程中文名稱], [課程英文名稱]
                 , [授課教師姓名], [場地識別碼], [從屬名稱], [地點]
                 , [活動日期], [開始時間], [結束時間]";
            cmd = new SqlCommand(sqlstr, conn);
            cmd.Parameters.AddWithValue("場地識別碼", 場地編號);
            cmd.Parameters.AddWithValue("學年", 學年);
            cmd.Parameters.AddWithValue("學期", 學期);
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            //Label3_counter.Text = dt.Rows.Count.ToString(); //顯示筆數
            ListView3.DataSource = dt;
            ListView3.DataBind();


            conn.Close();
        }
    }

    protected void ListView1_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        //DataPager1.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        DataLoad();
    }

}