using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DoAn_ASP.App_Code;
namespace DoAn_ASP.admin
{
    public partial class DoiMatKhau : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                UserName.Text = Session["username"].ToString();
                UserName.ReadOnly = true;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string sUsername = UserName.Text;
            string sPwd = exampleInputPassword.Text;
            ThemTaiKhoan acc = new ThemTaiKhoan(sUsername, sPwd,"Adasdasd","6666666666",1,1,"dasd@gmail.com");
            if (acc.changePwdMember())
            {
                Session["change_pwd"] = "success";
                Response.Redirect("DSMember.aspx");
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMess", "swal.fire({title: 'Change password fail!',type: 'warning'});", true);
            }
        }
    }
}