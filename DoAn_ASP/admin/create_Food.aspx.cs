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
    public partial class create_Food : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["add_food"] != null)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMess", "swal.fire({title: 'Add food success!',type: 'success'});", true);
                Session["add_food"] = null;

            }
             if (!IsPostBack)
             {
                 DataTable dt = new DataTable();
                 string query = "SELECT * FROM food_type where xoa = 0";
                 dt = DataProvider.getDataTable(query);
                 typefood.DataValueField = dt.Columns[0].ToString();
                 typefood.DataTextField = dt.Columns[1].ToString();
                 typefood.DataSource = dt;
                 typefood.DataBind();

                 if (Session["username"] != null)
                 {
                     username.Text = Session["username"].ToString();
                     username.ReadOnly = true;
                 }
                 else
                 {
                     Response.Redirect("Login.aspx");
                 }
             }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            
            
            string name = namefood.Text;
            string des = description.Text;
            int price1 = Convert.ToInt32(price.Text);
            int pricepromo1 = Convert.ToInt32(pricepromo.Text);
            //thumb
            string thumb1 = thumb.FileName;
            //img
            string img1 = img.FileName;
            string unit1 = unit.Text;
            int percentpromo1 = Convert.ToInt32(percentpromo.Text);
            int rating1 = Convert.ToInt32(rating.Text);
            int sold1 = Convert.ToInt32(sold.Text);
            int point1 = Convert.ToInt32(point.Text);
            //int type1 = Convert.ToInt32(type.Text);
            int iType = Convert.ToInt32(typefood.SelectedValue);
            int iStt = Convert.ToInt32(listStatus.SelectedValue);
            string username1 = username.Text;
            DateTime modified = DateTime.Parse(DateTime.Now.ToString());
            bool sXoa = false;
            Food food = new Food(name, des, price1, pricepromo1, thumb1, img1, unit1, percentpromo1, rating1, sold1, point1,iType, iStt, username1, modified,sXoa);
            if (food.addFood())
            {
                namefood.Text = "";
                description.Text = "";
                price.Text = "";
                pricepromo.Text = "";
                unit.Text = "";
                percentpromo.Text = "";
                rating.Text = "";
                sold.Text = "";
                point.Text = "";
                //type.Text = "";
                username.Text = "";
                listStatus.SelectedIndex = 0;

                if (thumb.HasFile)
                {
                    string path = Server.MapPath("~/admin/img/" + thumb.FileName);
                    thumb.SaveAs(path);
                }
                if (img.HasFile)
                {
                    string path = Server.MapPath("~/admin/img/" + img.FileName);
                    img.SaveAs(path);
                }
                Session["add_food"] = "success";
                Response.Redirect("create_Food.aspx");
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMess", "swal.fire({title: 'Add food fail!',type: 'warning'});", true);
            }
        }
    }
}