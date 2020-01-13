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
    public partial class update_Food : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                username.Text = Session["username"].ToString();
                username.ReadOnly = true;
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                DataTable dt1 = new DataTable();
                string query1 = "SELECT * FROM food_type where xoa = 0";
                dt1 = DataProvider.getDataTable(query1);
                typefood.DataValueField = dt1.Columns[0].ToString();
                typefood.DataTextField = dt1.Columns[1].ToString();
                typefood.DataSource = dt1;
                typefood.DataBind();

               

                if (Request.QueryString["id"] != null)
                {
                    DataTable dt = new DataTable();
                    string id = Request.QueryString["id"];
                    string query = "SELECT * FROM food WHERE id = '" + id + "'";
                    dt = DataProvider.getDataTable(query);
                    foreach (DataRow row in dt.Rows)
                    {
                        namefood.Text = row["name"].ToString();
                        description.Text = row["description"].ToString();
                        price.Text = row["price"].ToString();
                        pricepromo.Text = row["price_promo"].ToString();
                        unit.Text = row["unit"].ToString();
                        percentpromo.Text = row["percent_promo"].ToString();
                        rating.Text = row["rating"].ToString();
                        sold.Text = row["sold"].ToString();
                        point.Text = row["point"].ToString();
                        //type.Text = row["type"].ToString();
                        typefood.SelectedValue = row["type"].ToString();
                        listStatus.SelectedValue = row["status"].ToString();
                        show_img.ImageUrl = "~/admin/img/" + row["img"].ToString();
                        show_thumb.ImageUrl = "~/admin/img/" + row["thumb"].ToString();
                    }
                }
                else
                {
                    Response.Redirect("DSFood.aspx");
                }
            }
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int id = int.Parse(Request.QueryString["id"].ToString());
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
            int iType = Convert.ToInt32(typefood.SelectedValue);
            int iStt = Convert.ToInt32(listStatus.SelectedValue);
            string username1 = username.Text;
            DateTime modified = DateTime.Parse(DateTime.Now.ToString());
            Food food = new Food(id,name, des, price1, pricepromo1, thumb1, img1, unit1, percentpromo1, rating1, sold1, point1, iType, iStt, username1,modified);
            if (food.updateFood())
            {
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
                Session["update_food"] = "success";
                Response.Redirect("DSFood.aspx");
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMess", "swal.fire({title: 'Update food fail!',type: 'warning'});", true);
            }
        }
    }
}