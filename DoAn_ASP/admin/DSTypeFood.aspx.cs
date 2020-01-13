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
    public partial class DSTypeFood : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["update_typefood"] != null)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMess", "swal.fire({title: 'Update type food success!',type: 'success'});", true);
                Session["update_typefood"] = null;
            } if (Session["del_typefood"] != null)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMess", "swal.fire({title: 'Delete type food success!',type: 'success'});", true);
                Session["del_typefood"] = null;
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
                    string query = "UPDATE  food_type SET xoa = 1 WHERE type_id = " + id;
                    SqlCommand cmd = new SqlCommand(query, conn);
                    int count = Convert.ToInt32(cmd.ExecuteScalar());
                    if (count != null)
                    {
                        Session["del_typefood"] = "success";
                        Response.Redirect("DSTypeFood.aspx");
                    }
                }
            }
        }
    }
}