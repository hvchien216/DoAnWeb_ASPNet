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
public class ThemTaiKhoan
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
    private int _status;

    public int Status
    {
        get { return _status; }
        set { _status = value; }
    }
    private bool _xoa;
    public bool Xoa
    {
        get { return _xoa; }
        set { _xoa = value; }
    }
   
    public bool addMember(){
        string sQuery = "INSERT INTO [dbo].[member] ([username] ,[pass] ,[name] ,[phone] ,[role] ,[status] ,[email],[xoa]) VALUES(@us,@pass,@name,@phone,@role,@stt,@email,@xoa)";
        SqlParameter[] paras = new SqlParameter[8]{
            new SqlParameter("@us",SqlDbType.VarChar,50){Value = this.Username},
            new SqlParameter("@pass",SqlDbType.VarChar,50){Value = StringProc.MD5Hash(this.Pass)},
            new SqlParameter("@name",SqlDbType.NVarChar,50){Value = this.Name},
            new SqlParameter("@phone",SqlDbType.VarChar,50){Value = this.Phone},
            new SqlParameter("@role",SqlDbType.Int){Value = this.Role},
            new SqlParameter("@stt",SqlDbType.Int){Value = this.Status},
            new SqlParameter("@email",SqlDbType.VarChar,50){Value = this.Email},
            new SqlParameter("@xoa",SqlDbType.Bit,1){Value = this.Xoa},
        };
        return DataProvider.executeNonQuery(sQuery,paras);

    }
    //public ThemTaiKhoan(string us)
    //{
    //    Username = us;
    //    Name = "";
    //    Pass = "";
    //    Phone = "";
    //    Role = 0;
    //    Status = 0;
    //    Email = "";
    //}
    public ThemTaiKhoan(string us, string pwd, string name, string phone, int role, int stt, string email,bool xoa)
    {
        this.Username = us;
        this.Name = name;
        this.Pass = pwd;
        this.Phone = phone;
        this.Role = role;
        this.Status = stt;
        this.Email = email;
        this.Xoa = xoa;
    }
    public ThemTaiKhoan(string us, string pwd, string name, string phone, int role, int stt, string email)
    {
        this.Username = us;
        this.Name = name;
        this.Pass = pwd;
        this.Phone = phone;
        this.Role = role;
        this.Status = stt;
        this.Email = email;
    }
    public bool  editMember(){
        //[pass] = @pass ,
        string query = "UPDATE [dbo].[member] SET [name] = @name ,[phone] = @phone ,[role] = @role ,[status] = @stt ,[email] = @email WHERE username = @us";
        SqlParameter[] paras = {
            new SqlParameter("@us",this.Username),
            //new SqlParameter("@pass",SqlDbType.VarChar,50){Value = StringProc.MD5Hash(this.Pass)},
            new SqlParameter("@name",this.Name),
            new SqlParameter("@phone",this.Phone),
            new SqlParameter("@role",this.Role),
            new SqlParameter("@stt",this.Status),
            new SqlParameter("@email",this.Email),
        };
        return DataProvider.executeNonQuery(query, paras);
    }
    public bool changePwdMember()
    {        
        string query = "UPDATE [dbo].[member] SET [pass] = @pass WHERE username = @us";
        SqlParameter[] paras = {
            new SqlParameter("@us",this.Username),
            new SqlParameter("@pass",SqlDbType.VarChar,255){Value = StringProc.MD5Hash(this.Pass)},
        };
        return DataProvider.executeNonQuery(query, paras);
    }
    //public bool delMember()
    //{
    //    string query = "DELETE WHERE username = @us";
    //    SqlParameter[] paras = new SqlParameter[1]{
    //        new SqlParameter("@us",SqlDbType.VarChar,50){Value = this.Username},
    //    };
    //    return DataProvider.executeNonQuery(query, paras);
    //}
}
}