using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DoAn_ASP.App_Code;
using System.Data;
using System.Data.SqlClient;
namespace DoAn_ASP.admin
{
    public partial class update_Member : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                DataTable dt = new DataTable();
                string username = Request.QueryString["id"];
                string query = "SELECT * FROM member WHERE username = '" + username + "'";
                dt = DataProvider.getDataTable(query);
                foreach (DataRow row in dt.Rows)
                {
                    UserName.Text = row["username"].ToString();
                    Name.Text = row["name"].ToString();
                    phone.Text = row["phone"].ToString();
                    exampleInputEmail.Text = row["email"].ToString();
                    listRole.SelectedValue = row["role"].ToString();
                    listStatus.SelectedValue = row["status"].ToString();
                }
            }
            else
            {
                Response.Redirect("DSMember.aspx");
            }
        }

        protected void update_Click(object sender, EventArgs e)
        {
            string sUsername = UserName.Text;
            string sName = Name.Text;
            string sEmail = exampleInputEmail.Text;
            string sPhone = phone.Text;
            int iRole = Convert.ToInt32(listRole.SelectedValue);
            int iStt = Convert.ToInt32(listStatus.SelectedValue);
            ThemTaiKhoan acc = new ThemTaiKhoan(sUsername,"csdfsdf", sName, sPhone, iRole, iStt, sEmail);
            if (acc.editMember())
            {
                Session["update_member"] = "success";
                Response.Redirect("DSMember.aspx");
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMess", "swal.fire({title: 'Update member fail!',type: 'warning'});", true);
            }
        }
    }
}