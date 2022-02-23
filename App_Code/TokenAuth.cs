using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.Serialization.Json;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Net;

public class TokenAuth
{
     string Auth_Service_URL = "http://cca.ksu.edu.tw/token.php?acluserid={0}&acltoken={1}&acldatatype={2}&aclurl={3}";
    //string Auth_Service_URL = "http://120.114.51.50/AIS2/token.htm";
    public TokenAuth()
    {
    }
    public TokenAuth(string URL)
    {
        Auth_Service_URL = URL;
    }
    public Pi Auth(string userId, string token)
    {
        string aclurl = System.Configuration.ConfigurationManager.AppSettings["aclurl"];
        WebClient wc = new WebClient();
        byte[] buffer = wc.DownloadData(string.Format(Auth_Service_URL, userId, token, "json", HttpUtility.UrlEncode(aclurl)));
        string Auth_JSON = System.Text.Encoding.UTF8.GetString(buffer);
        DataContractJsonSerializer serializer = new DataContractJsonSerializer(typeof(PI_RootObject));
        using (MemoryStream ms = new MemoryStream(Encoding.UTF8.GetBytes(Auth_JSON)))
        {
            PI_RootObject PIRO = (PI_RootObject)serializer.ReadObject(ms);
            Pi pi = PIRO.pi;
            return pi;
        }
    }
    public Pi Auth(string userId, string token, string aclurl)
    {
        WebClient wc = new WebClient();
        byte[] buffer = wc.DownloadData(string.Format(Auth_Service_URL, userId, token, "json", HttpUtility.UrlEncode(aclurl)));
        string Auth_JSON = System.Text.Encoding.UTF8.GetString(buffer);
        DataContractJsonSerializer serializer = new DataContractJsonSerializer(typeof(PI_RootObject));
        using (MemoryStream ms = new MemoryStream(Encoding.UTF8.GetBytes(Auth_JSON)))
        {
            PI_RootObject PIRO = (PI_RootObject)serializer.ReadObject(ms);
            Pi pi = PIRO.pi;
            return pi;
        }
    }
}
public class Pi
{
    public bool auth { get; set; }
    public string code { get; set; }
    public string user_id { get; set; }
    public string name { get; set; }
    public string cname { get; set; }
    public string ename { get; set; }
    public string email { get; set; }
    public string role { get; set; }
    public string school { get; set; }
    public string type { get; set; }
    public string affiliation { get; set; }
    public string department { get; set; }
    public string fulltime { get; set; }
    public string pid { get; set; }
    public string stuid { get; set; }
    public string department_id { get; set; }
    public string role_id { get; set; }
    public string message { get; set; }
    public int syear { get; set; }
    public int semester { get; set; }
}

public class PI_RootObject
{
    public Pi pi { get; set; }
}