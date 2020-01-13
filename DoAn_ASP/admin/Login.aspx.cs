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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["username"] != null)
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-98N0JM4\SQL_EN2012;Initial Catalog=doan_asp_DB;Integrated Security=True"))
            {
                conn.Open();
                string query = "SELECT Count(1) FROM member WHERE username=@username AND pass=@pwd AND xoa = 0 ";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@username", user_name.Text.Trim());
                cmd.Parameters.AddWithValue("@pwd", StringProc.MD5Hash(pwd.Text.Trim()));
                int count = Convert.ToInt32(cmd.ExecuteScalar());
                if (count == 1)
                {
                    Session["username"] = user_name.Text.Trim();
                    Response.Redirect("Default.aspx");
                    conn.Close();
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMess", "Swal.fire('Username or Password wrong!')", true);
                }
            }
        }
    }
}