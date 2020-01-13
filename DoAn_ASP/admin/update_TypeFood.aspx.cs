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
    public partial class update_TypeFood : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                Username.Text = Session["username"].ToString();
                Username.ReadOnly = true;
            }
            else
            {
                Response.Redirect("Login.aspx");
            }

            if (Request.QueryString["id"] != null)
            {
                DataTable dt = new DataTable();
                string id = Request.QueryString["id"];
                string query = "SELECT * FROM food_type WHERE type_id = '" + id + "'";
                dt = DataProvider.getDataTable(query);
                foreach (DataRow row in dt.Rows)
                {
                    typename.Text = row["type_name"].ToString();
                    typepos.Text = row["type_pos"].ToString();
                    listStatus.SelectedValue = row["status"].ToString();
                    //Img
                    show_img.ImageUrl = "~/admin/img/" + row["type_img"].ToString();
                }
            }
            else
            {
                Response.Redirect("DSTypeFood.aspx");
            }
        }

        protected void update_click(object sender, EventArgs e)
        {

            int id = int.Parse(Request.QueryString["id"].ToString());
            string sTypeName = typename.Text;
            int sTypePost = Int32.Parse(typepos.Text);
            string sTypeImg = type_img.FileName;
            int sStatus = Convert.ToInt32(listStatus.SelectedValue);
            string sUsername = Username.Text;
            DateTime modified = DateTime.Parse(DateTime.Now.ToString());

            FoodType foodtype = new FoodType(id,sTypeName, sTypePost, sTypeImg, sStatus, sUsername,modified);
            if (foodtype.updateTypeFood())
            {
                if (type_img.HasFile)
                {
                    string path = Server.MapPath("~/admin/img/" + type_img.FileName);
                    type_img.SaveAs(path);
                }
                Session["update_typefood"] = "success";
                Response.Redirect("DSTypeFood.aspx");

            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMess", "swal.fire({title: 'Update type food fail!',type: 'warning'});", true);
            }
        }

        protected void typepos_TextChanged(object sender, EventArgs e)
        {
            typepos.Text = "";
            
        }

    }
}