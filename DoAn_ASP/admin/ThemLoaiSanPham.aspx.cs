using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DoAn_ASP.App_Code;
namespace DoAn_ASP.admin
{
    public partial class ThemLoaiSanPham : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["add_typefood"] != null)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMess", "swal.fire({title: 'Add type food success!',type: 'success'});", true);
                Session["add_typefood"] = null;

            }
            if (!IsPostBack)
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
            }
        }

        protected void ThemTypeFood(object sender, EventArgs e)
        {
            

            string sTypeName = type_name.Text;
            int sTypePost = Int32.Parse(type_pos.Text.ToString());
            string sTypeImg = type_img.FileName;
            int sStatus = Convert.ToInt32(listStatus.SelectedValue);
            string sUsername = Username.Text;
            DateTime modified = DateTime.Parse(DateTime.Now.ToString());
            bool sXoa = false;
            FoodType foodtype = new FoodType(sTypeName, sTypePost, sTypeImg, sStatus, sUsername, modified,sXoa);
            if (foodtype.addTypeFood())
            {
                if (type_img.HasFile)
                {
                    string path = Server.MapPath("~/admin/img/" + type_img.FileName);
                    type_img.SaveAs(path);
                }
                type_name.Text = "";
                type_pos.Text = "";
                listStatus.SelectedIndex = 0;
                Username.Text = "";
                Session["add_typefood"] = "success";
                Response.Redirect("ThemLoaiSanPham.aspx");
                
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMess", "swal.fire({title: 'Add type food fail!',type: 'warning'});", true);
            }
        }
    }
}