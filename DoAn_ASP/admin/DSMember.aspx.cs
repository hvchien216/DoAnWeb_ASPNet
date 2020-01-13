using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DoAn_ASP.App_Code;
using System.Data;
using System.Data.SqlClient;
public partial class admin_DSMember : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Request.QueryString["id"] != "")
        //{
        //    string u1, u2, u3, u4;
        //    int i1 = 1, i2 = 1;
        //    u1 = "aa";
        //    u2 = "vv";
        //    u3 = "ff";
        //    u4 = "qq";
        //    string username = Request.QueryString["id"];
        //    ThemTaiKhoan acc = new ThemTaiKhoan(username,u1,u2,u3,i1,i2,u4);
        //    if (acc.delMember())
        //    {
        //        Session["del_member"] = "success";
        //        Response.Redirect("DSMember.aspx");
        //    }
        //    else
        //    {
        //        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMess", "swal.fire({title: 'Delete member fail!',type: 'warning'});", true);
        //        Response.Redirect("DSMember.aspx");
        //    }
        //}
        //if (Session["username"] == null)
        //{
        //    Response.Redirect("Default.aspx");
        //}
        if (Session["update_member"] != null)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMess", "swal.fire({title: 'Update member success!',type: 'success'});", true);
            Session["update_member"] = null;

        } if (Session["delete_member"] != null)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMess", "swal.fire({title: 'Delete member success!',type: 'success'});", true);
            Session["delete_member"] = null;
        }
        if (Session["change_pwd"] != null)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMess", "swal.fire({title: 'Change password success!',type: 'success'});", true);
            Session["change_pwd"] = null;
        }
    }
    protected void DelMemBer(object sender, EventArgs e)
    {
        //string username = Request.QueryString["id"];
        //ThemTaiKhoan acc = new ThemTaiKhoan(username.ToString(),"qq","qq","qq",0,0,"");
        //if (acc.delMember())
        //{
        //    Session["del_member"] = "success";
        //    Response.Redirect("DSMember.aspx");
        //}
        //else
        //{
        //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMess", "swal.fire({title: 'Delete member fail!',type: 'warning'});", true);
        //    Response.Redirect("DSMember.aspx");
        //}
    }
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        //DataProvider.Connect();
        //SqlConnection conn = DataProvider.conn;
        using (SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-98N0JM4\SQL_EN2012;Initial Catalog=doan_asp_DB;Integrated Security=True"))
        {
            conn.Open();
            if (e.CommandName == "will_del")
            {
                string id = e.CommandArgument.ToString();
                string query = "UPDATE  member SET xoa = 1 WHERE username = '" + id + "'";
                SqlCommand cmd = new SqlCommand(query, conn);
                int count = Convert.ToInt32(cmd.ExecuteScalar());
                if (count != null)
                {
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "Swal.fire({title:'Delete member success',icon:success});window.location='" + Request.ApplicationPath + "admin/DSMember.aspx';", true);
                    Session["delete_member"] = "success";
                    Response.Redirect("DSMember.aspx");
                }
            }
        }
    }
}
//using (SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-98N0JM4\SQL_EN2012;Initial Catalog=doan_asp_DB;Integrated Security=True"))
//        {
//            conn.Open();
//            if (e.CommandName == "will_del")
//            {
//                string id = e.CommandArgument.ToString();
//                string query = "DELETE from member WHERE username = '" + id + "'";
//                SqlCommand cmd = new SqlCommand(query, conn);
//                int count = Convert.ToInt32(cmd.ExecuteScalar());
//                if (count != null)
//                {
//                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "Swal.fire({title:'Delete member success',icon:success});window.location='" + Request.ApplicationPath + "admin/DSMember.aspx';", true);
//                    Session["delete_member"] = "success";
//                    Response.Redirect("DSMember.aspx");
//                }
//            }
//        }