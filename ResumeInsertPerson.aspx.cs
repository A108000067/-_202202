using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ResumeInsertPerson : System.Web.UI.Page {
    string schoolNo = "101607";

    protected void Page_Load(object sender, EventArgs e) {
        string KSUID = Convert.ToString(Session["u_id"]);
        if (!IsPostBack) {

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString)) {
                conn.Open();
                string sqlstr = @"
                    SELECT  A.*,B.[真實姓名] FROM [View_學生清冊] A 
                    INNER JOIN [求職E個人基本資料] B ON A.KSUID = B.KSUID WHERE A.[KSUID]=@KSUID;
                    ";
                SqlCommand cmd = new SqlCommand(sqlstr, conn);
                cmd.Parameters.AddWithValue("@KSUID", KSUID);
                SqlDataReader sqlreader = cmd.ExecuteReader();
                if (sqlreader.Read()) {
                    TextBox_真實姓名.Text = sqlreader["真實姓名"].ToString();
                    Label_部別.Text = sqlreader["學部名稱"].ToString();
                    Label_學制.Text = sqlreader["學制名稱"].ToString();
                    Label_科系.Text = sqlreader["科系名稱"].ToString();
                    Label_班級.Text = sqlreader["班級名稱"].ToString();
                    Label_學號.Text = sqlreader["學號"].ToString();
                    Label_KSUID.Text = sqlreader["KSUID"].ToString();
                    Label_身分證字號.Text = sqlreader["身分證字號"].ToString();
                    Label_出生日期.Text = Convert.ToDateTime(sqlreader["生日"]).ToString("yyyy-MM-dd");
                    Label_電子郵件信箱.Text = sqlreader["電子信箱"].ToString();
                    Label_聯絡電話.Text = sqlreader["戶籍電話"].ToString();
                    Label_行動電話.Text = sqlreader["緊急聯絡電話"].ToString();
                    Label_性別.Text = sqlreader["性別"].ToString();
                }
                sqlreader.Close();
                conn.Close();
            }
        }
    }


    protected void Button_送出_Click(object sender, EventArgs e) {
        string KSUID = Convert.ToString(Session["u_id"]);
        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString)) {
            conn.Open();
            string sqlstr = @"
                UPDATE [求職E個人基本資料]
                SET [真實姓名] = @真實姓名
                WHERE [KSUID] = @KSUID";

            SqlCommand cmd = new SqlCommand(sqlstr, conn);
            cmd.Parameters.AddWithValue("@真實姓名", TextBox_真實姓名.Text);
            cmd.Parameters.AddWithValue("@KSUID", KSUID);
            try {
                cmd.ExecuteNonQuery();
            } catch (SqlException ex) {
                Response.Write(ex);
                Response.End();
                Console.WriteLine(ex);
            }
            conn.Close();
            RadAjaxManager1.ResponseScripts.Add("alert('資料送出成功！'); location.href='ResumeDataList.aspx'");
        }
    }

    protected void DropDownList_國籍_SelectedIndexChanged(object sender, EventArgs e) {
        //string typeId = DropDownList_國籍.SelectedValue;
        //RadAjaxManager1.ResponseScripts.Add("location.href = 'TeachingManagement.aspx?id=" + typeId + "'");
        return;
    }
    protected void DropDownList_郵遞區號_SelectedIndexChanged(object sender, EventArgs e) {
        return;
    }
    protected void DropDownList_居住地區_SelectedIndexChanged(object sender, EventArgs e) {
        return;
    }
}