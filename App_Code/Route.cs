using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Route 的摘要描述
/// </summary>
public static class Route
{
    static List<authEntity> authEntityList = new List<authEntity>
        {
            new authEntity
            {
                level= 1,
                auth = true,
                pageFileName = "ResumeDataList.aspx",
                aclName = "career/job1111/create",
                allowAclName = { "career/job1111/create" },
                title="建立求職履歷"
            },

             new authEntity
            {
                level= 2,
                pageFileName = "ResumeInsertPerson.aspx",
                aclName = "career/job1111/create",
                allowAclName = { "career/job1111/create" },
                title="修正姓名頁面"
            },
        };

    public static authEntity getAuthEntity(string name)
    {
        authEntity auth = (authEntity)authEntityList.Where(a => a.pageFileName.Equals(name)).First();
        return auth;
    }
    public static bool AclNamePermissionAuth(List<string> currentACL, string AclName)
    {
        var matchingvalues = currentACL.Where(stringToCheck => stringToCheck.Contains(AclName));
        return matchingvalues.Count() > 0;
    }
}
public class authEntity
{
    public int level = 1;
    public bool auth = true;
    public string pageFileName;
    public string aclName;
    public string title; //註解之用
    public List<string> allowAclName = new List<string>();
}