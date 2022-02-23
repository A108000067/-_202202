using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Main : System.Web.UI.MasterPage
{
    protected void Page_Init(object sender, EventArgs e)
    {
        //如要上傳至正式機或測試機請註解到retuen
        Session["u_id"] = "A108000067";
        //Session["UnitName"] = "測試";
        ////Session["FCODE3"] = "EDR";//房管(產碩測試)
        //Session["FCODE3"] = "IMR";//資管
        return;

        try {
            string fname = System.IO.Path.GetFileName(Request.PhysicalPath);

           
            authEntity ae =  Route.getAuthEntity(fname);
     
            if (ae == null)
            {
                Response.Redirect("ErrorPage.aspx");
                return;                
            } 

            if (!IsPostBack && Request.QueryString["acltoken"] != null && Request.QueryString["acluserid"] != null)
            {
                TokenAuth ta = new TokenAuth();
                Pi PI = ta.Auth(Request.QueryString["acluserid"], Request.QueryString["acltoken"], ae.aclName);
                if (PI.auth)
                {
                    if (Session["u_id"] != null)
                    {
                        if (!PI.user_id.Equals((string)Session["u_id"]))
                        {
                            Session.Clear();
                        }
                    } 

                    Session["PI"] = PI; 
                    Session["u_id"] = PI.user_id;
                    Session["u_sid"] = PI.stuid;
                    Session["y"] = PI.syear;
                    Session["s"] = PI.semester;
                    Session["F2"] = PI.affiliation;

					//允許權限設定
					if (Session["ACL"] != null)
                    {

                        List<string> list = (List<string>)Session["ACL"];
                        if (!list.Contains(ae.aclName))
                        {
                            list.Add(ae.aclName);
                            list = list.Distinct().ToList();
                            Session["ACL"] = list;
                        }
                    }
                    else
                    {
                        List<string> list = new List<string>();
                        list.Add(ae.aclName);
                        Session["ACL"] = list;
                    }

                    using (System.Data.SqlClient.SqlConnection conn =
                        new System.Data.SqlClient.SqlConnection(
                            System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                    {
                        conn.Open();

                        //SQL語法 SELECT
                        string sqlstr = @"SELECT [CODE] FROM [_organization].[dbo].[FCODE_3]
                                          WHERE [NAME] =@NAME AND [STATE]='Y' ";
                        System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(sqlstr, conn);
                        //參數對應設定
                        cmd.Parameters.AddWithValue("@NAME", PI.department);
                        System.Data.SqlClient.SqlDataReader sqlreader = cmd.ExecuteReader();
                        if (sqlreader.Read())
                        {
                            Session["FCODE3"] = sqlreader["CODE"].ToString();
                            Session["UnitName"] = PI.department;
                        }
                        else
                        {
                            Session["FCODE3"] = "000";
                        }
                        sqlreader.Close();

                        sqlstr = @"SELECT [CODE] FROM [_organization].[dbo].[FCODE_2]
                                          WHERE [NAME] =@NAME AND [STATE]='Y' ";
                        cmd = new System.Data.SqlClient.SqlCommand(sqlstr, conn);
                        //參數對應設定
                        cmd.Parameters.AddWithValue("@NAME", PI.affiliation);
                        sqlreader = cmd.ExecuteReader();
                        if (sqlreader.Read())
                        {
                            Session["FCODE2"] = sqlreader["CODE"].ToString();
                            if (Session["FCODE3"].ToString().Equals("000"))
                            {
                                Session["UnitName"] = PI.affiliation;
                            }
                        }
                        else
                        {
                            Session["FCODE2"] = "000";
                        }
                        sqlreader.Close(); 
                        conn.Close();
                    }
                }
            } 


            //驗證登入與登出
            if (Session["ACL"] == null)
            {
                Response.Redirect("ErrorPage.aspx");
            }
            else
            {

                List<string> list = (List<string>)Session["ACL"];

                int i = 0;
                if (ae.aclName != null)
                {
                    var matchingvalues = list.Where(stringToCheck => stringToCheck.Contains(ae.aclName));
                    i += matchingvalues.Count();
                }
                if (i == 0)
                {
                    foreach (string s in ae.allowAclName)
                    {
                        var matchingvalues = list.Where(stringToCheck => stringToCheck.Contains(s));
                        i += matchingvalues.Count();
                    }
                    if (i == 0)
                    {
                        Response.Redirect("ErrorPage.aspx");
                    }
                } 

       
            }
			
        }
        catch (ThreadAbortException ex)
        {
        }
        catch (Exception ex)
        {
            Session.Clear();
            Session["exception"] = ex;
            Response.Redirect("ErrorPage3.aspx");
        }
    }  
}
