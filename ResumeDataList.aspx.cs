using System;
using System.Activities;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Linq;
using System.Transactions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ResumeDataList : System.Web.UI.Page {
    public string resumeGuid;
    public string schoolID = "101607";

    protected void Page_Load(object sender, EventArgs e) {

        if (!IsPostBack) {
            //CreateStudentInfo();
            //LoadData();
        }
    }

    protected void CreateStudentInfo() {

        bool 是否存在求職個人資料 = false;
        string KSUID = Session["u_id"].ToString();
        using (TransactionScope TranScope = new TransactionScope()) {
            //讀取Web.config中ConnentString的值,建立資料庫連線
            using (System.Data.SqlClient.SqlConnection conn =
                new System.Data.SqlClient.SqlConnection(
                    System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString)) {
                conn.Open();

                // 1.確認資料是否已經存在 求職E個人基本資料
                string sqlstr = @"SELECT * FROM [求職E個人基本資料] WHERE [是否停用]=0 AND [KSUID]=@KSUID";
                System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(sqlstr, conn);
                cmd.Parameters.AddWithValue("@KSUID", KSUID);
                System.Data.SqlClient.SqlDataReader sqlreader = cmd.ExecuteReader();
                if (sqlreader.Read()) //逐列讀取結果
                {
                    是否存在求職個人資料 = true;
                    resumeGuid = sqlreader["履歷代碼"].ToString();
                }
                sqlreader.Close();

                // 2. 如果不存在，則直接使用學生清冊資料建立一筆
                if (!是否存在求職個人資料) {



                    sqlstr = @"INSERT INTO [求職E個人基本資料]
                            ( [真實姓名], [履歷來源], [學號], [履歷代碼], [新增時間], [KSUID],[是否拋轉過],[身分證字號])
                            SELECT  [姓名],@履歷來源 AS [履歷來源], [學號], NEWID() AS [履歷代碼], GETDATE() AS [新增時間], [KSUID] ,0 , [身分證字號]
                            FROM [View_學生清冊] WHERE [KSUID]=@KSUID ";
                    cmd = new System.Data.SqlClient.SqlCommand(sqlstr, conn);
                    cmd.Parameters.AddWithValue("@履歷來源", schoolID);
                    cmd.Parameters.AddWithValue("@KSUID", KSUID);
                    int insertRows = cmd.ExecuteNonQuery();//執行並回傳增加的資料列數 
                }

                conn.Close();
            }
            TranScope.Complete();
        }
    }

    protected void LoadData() {

        string KSUID = Session["u_id"].ToString();
        string 學號 = "";


        using (TransactionScope TranScope = new TransactionScope()) {

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString)) {
                conn.Open();

                // 1.驗證學生基本資料
                string sqlstr = @"SELECT * FROM [View_學生清冊] WHERE KSUID = @KSUID;";
                SqlCommand cmd = new SqlCommand(sqlstr, conn);
                cmd.Parameters.AddWithValue("@KSUID", KSUID);
                SqlDataReader sqlreader = cmd.ExecuteReader();
                if (sqlreader.Read()) {
                    學號 = sqlreader["學號"].ToString();

                } else {
                    //出錯
                    return;
                }
                sqlreader.Close();

                // 2.查詢求職個人基本資料
                sqlstr = @"
                SELECT * FROM [求職E個人基本資料] WHERE KSUID = @KSUID;
                ";
                cmd = new SqlCommand(sqlstr, conn);
                cmd.Parameters.AddWithValue("@KSUID", KSUID);
                sqlreader = cmd.ExecuteReader();
                if (sqlreader.Read()) {
                } else {
                    return;
                }
                sqlreader.Close();

                // 3. 抓學生校外學歷資料
                sqlstr = @"SELECT A.科系名稱, B.科系 AS 雙主修科系 
                        FROM [View_學生清冊] as A 
                        LEFT JOIN [View_輔系雙主修] as B 
                        ON A.學號=B.學號 AND B.狀態代碼=1 AND B.類別代碼=2
                           WHERE A.學號= @學號";
                cmd = new SqlCommand(sqlstr, conn);
                cmd.Parameters.AddWithValue("@學號", 學號);
                sqlreader = cmd.ExecuteReader();
                if (sqlreader.Read()) {
                    Label_主修.Text = sqlreader["科系名稱"].ToString();
                    if (sqlreader["雙主修科系"] != DBNull.Value) {
                        Label_雙主修.Text = sqlreader["雙主修科系"].ToString();
                    } else {
                        Label_雙主修.Text = "無";
                    }
                }
                sqlreader.Close();


              
                // 5. 抓學生校外社團資料
                sqlstr = @"SELECT TOP 4 * , DATEDIFF(month,新增時間,ISNULL(退任日期,GETDATE())) as 在職月數  FROM 
                        學生社團V幹部名單
                        WHERE DATEDIFF(month,新增時間,ISNULL(退任日期,GETDATE()))>0 AND 學號 = @學號
                        ORDER BY 在職月數 DESC";
                cmd = new SqlCommand(sqlstr, conn);
                cmd.Parameters.AddWithValue("@學號", 學號);
                DataTable dt_club = new DataTable();
                SqlDataAdapter sda_club = new SqlDataAdapter(cmd);
                sda_club.Fill(dt_club);
                ListView_社團.DataSource = dt_club;
                ListView_社團.DataBind();

                conn.Close();
            }
            TranScope.Complete();
        }
    }


      protected void Button_匯出查詢報表_Click(object sender, EventArgs e) {
        DataTable dt = new DataTable();

        dt = ExcelData("產官學研績效分配統計表");

        if (dt.Rows.Count > 0) {
            Conver2Excel cXls = new Conver2Excel();
            byte[] bytes = cXls.ToXLS(dt, "報表"); //資料表標籤名稱
            string filename = HttpUtility.UrlPathEncode(string.Format("績效分配統計表_{0}.xls", DateTime.Now.ToString("yyyy-MM-dd-HH-mm-ss"))); //檔案名稱
            Response.ClearHeaders(); //從緩衝區資料流清除所有標頭
            Response.Clear(); //清除buffer緩衝區內容
            Response.AddHeader("Content-Disposition", "attachment; filename=" + filename); //下載後的檔名  Content-Disposition：MIME協議的擴展可以控制用戶請求所得的內容存為一個文件的時候提供一個默認的文件名 attachment為附件方式下載
            Response.AddHeader("Content-Length", bytes.Length.ToString()); //Content-Length用來指定送给接收方的消息檔案的大小，即用十進制數字表示的八位元组的數目
            Response.ContentType = "application/octet-stream"; //指定檔案的閱讀方式"MIME-type"
            Response.OutputStream.Write(bytes, 0, bytes.Length); //允許二進位輸出至傳出 HTTP 內容主體

            Response.End(); //觸發Application_EndRequest 方法，但是有可能在這之中仍有程序運行在Flush()方法
        } else {
            //Nothing
        }
    }
    private DataTable ExcelData(string subject) {
        DataTable dt = new DataTable();
        List<string> where = new List<string>();
        Dictionary<string, string> prmDic = new Dictionary<string, string>();

        string sqlstr = @"";
        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString)) {
            conn.Open();
            switch (subject) {
                case "產官學研績效分配統計表":
                    sqlstr = @"exec [dbo].[研發P績效分配明細] @年度="+TextBox_年度.Text;
                    break;
                default:
                    break;
            }
            //where.Add(" [年度] = @年度");
            //prmDic.Add("@年度", TextBox_年度.Text);

            //List<SqlParameter> prm = DictionaryToSqlParameters(prmDic);// new List<SqlParameter>();//將參數值放入

            //if (where.Count > 0) {
            //    sqlstr += " WHERE " + string.Join(" AND ", where);
            //}

            //sqlstr += "ORDER BY  DESC";

            SqlCommand cmd = new SqlCommand(sqlstr, conn);
            //cmd.Parameters.AddRange(prm.ToArray());
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.Fill(dt);
            conn.Close();
        }
        return dt;
    }
     protected List<SqlParameter> DictionaryToSqlParameters(Dictionary<string, string> prmDic) {
        List<SqlParameter> prm = new List<SqlParameter>();
        foreach (KeyValuePair<string, string> kvp in prmDic) {
            prm.Add(new SqlParameter(kvp.Key, kvp.Value));
        }
        return prm;
    }
}