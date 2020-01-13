using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
namespace DoAn_ASP.admin
{
    public partial class DSFood : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["update_food"] != null)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMess", "swal.fire({title: 'Update food success!',type: 'success'});", true);
                Session["update_food"]=null;
            } if (Session["delete_food"] != null)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMess", "swal.fire({title: 'Delete food success!',type: 'success'});", true);
                Session["delete_food"] = null;
            }
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-98N0JM4\SQL_EN2012;Initial Catalog=doan_asp_DB;Integrated Security=True"))
            {
                conn.Open();
                if (e.CommandName == "will_del")
                {
                    int id = Int32.Parse(e.CommandArgument.ToString());
                    string query = "UPDATE  food SET xoa = 1 WHERE id = " + id;
                    SqlCommand cmd = new SqlCommand(query, conn);
                    int count = Convert.ToInt32(cmd.ExecuteScalar());
                    if (count != null)
                    {
                        Session["delete_food"] = "success";
                        Response.Redirect("DSFood.aspx");
                    }
                }
            }
        }
    }
}