using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
namespace DoAn_ASP.App_Code
{ 
/// <summary>
/// Summary description for Member
/// </summary>
public class Member
{
    private string _Username;

    public string Username
    {
        get { return _Username; }
        set { _Username = value; }
    }
    private string _Pass;

    public string Pass
    {
        get { return _Pass; }
        set { _Pass = value; }
    }
    private string _Name;

    public string Name
    {
        get { return _Name; }
        set { _Name = value; }
    }
    private string _Phone;

    public string Phone
    {
        get { return _Phone; }
        set { _Phone = value; }
    }
    private int _Role;

    public int Role
    {
        get { return _Role; }
        set { _Role = value; }
    }
    private string _Email;

    public string Email
    {
        get { return _Email; }
        set { _Email = value; }
    }
    private int _Status;

    public int Status
    {
      get { return _Status; }
      set { _Status = value; }
    }

    //public Member(string username,string name, string pass,string phone,int status,int role,string email)
    //{
    //        _Username = username;
    //        _Name = name;
    //        _Pass = pass;
    //        _Phone = phone;
    //        _Status = status;
    //        _Role = role;
    //        _Email = email;
    //}
    //public bool Addmember()
    //{
    //    string addQuery = "INSERT INTO [dbo].[member]([username],[pass],[name],[phone],[role],[status],[email])" +
    //        "VALUES(@username,@pass,@name,@phone,@role,@status,@email)";
    //    SqlParameter[] parameters = new SqlParameter[7];
    //    parameters[0] = new SqlParameter("@username", this.Username);

    //    //
    //    //parameters[0].Value = this.Username;
    //    //parameters[1].Value = this.Pass;
    //    //parameters[2].Value = this.Name;
    //    //parameters[3].Value = this.Phone;
    //    //parameters[4].Value = this.Role;
    //    //parameters[5].Value = this.Status;
    //    ////
    //    parameters[1] = new SqlParameter("@pass", this.Pass);
    //    parameters[2] = new SqlParameter("@name", this.Name);
    //    parameters[3] = new SqlParameter("@phone", this.Phone);
    //    parameters[4] = new SqlParameter("@role", this.Role);
    //    parameters[5] = new SqlParameter("@status", this.Status);
    //    parameters[6] = new SqlParameter("@email", this.Email);
    //    return DataProvider.executeNonQuery(addQuery, parameters);
    //}
}
}