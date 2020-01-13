using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DoAn_ASP.App_Code;
namespace DoAn_ASP
{
    public partial class product_single : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if(Request["id"]==null)
                {
                    Response.Redirect("shop.aspx");
                }
                else
                {
                    if (Session["cart"] != null)
                    {
                        DataTable dt1 = new DataTable();
                        dt1 = (DataTable)Session["cart"];
                        int buy = 0;
                        foreach (DataRow row in dt1.Rows)
                        {
                            buy++;
                        }
                        lbl_bought.Text = "[" + buy.ToString() + "]";
                    }
                    else
                    {
                        lbl_bought.Text = "[0]";
                    }

                    DataTable dt = new DataTable();
                    string id = Request["id"].ToString();
                    string query = "select * from food where id = " + id;
                    int point=0;
                    dt = DataProvider.getDataTable(query);
                    //anh phong to
                    repeater_big.DataSource = dt;
                    repeater_big.DataBind();
                    foreach (DataRow row in dt.Rows)
                    {
                        lbl_name.Text = row["name"].ToString();
                        lbl_point.Text = row["point"].ToString();
                        lbl_rating.Text = row["rating"].ToString();
                        lbl_sold.Text = row["sold"].ToString();
                        lbl_price.Text = row["price"].ToString();
                        img.ImageUrl = "~/admin/img/" + row["img"].ToString();
                        lbl_des.Text = row["description"].ToString();
                        point = Int32.Parse(row["point"].ToString());
                        hf_id.Value = row["id"].ToString();
                        hf_name.Value = row["name"].ToString();
                        hf_des.Value = row["description"].ToString();
                        hf_price.Value = row["price"].ToString();
                        hf_thumb.Value = row["thumb"].ToString();
                        hf_unit.Value = row["unit"].ToString();
                    }

                    //point danh gia
                    DataTable dt_point1 = new DataTable();
                    dt_point1.Columns.Add("point");
                    for (int i = 0; i < point; i++)
                    {
                        DataRow dr = dt_point1.NewRow();
                        dr["point"] = i.ToString();
                        dt_point1.Rows.Add(dr);
                    }
                    repeater_danh_gia.DataSource = dt_point1;
                    repeater_danh_gia.DataBind();

                    

                }
            }
        }

        protected void add_to_cart_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            if (Session["cart"] == null)
            {
                dt.Columns.Add("id");
                dt.Columns.Add("name");
                dt.Columns.Add("des");
                dt.Columns.Add("price");
                dt.Columns.Add("unit");
                dt.Columns.Add("thumb");
                dt.Columns.Add("soluong");
            }
            else
            {
                dt = (DataTable)Session["cart"];
            }
            int iRow = checkExisted(dt, hf_id.Value);
            if (iRow != -1)
            {
                dt.Rows[iRow]["soluong"] = Convert.ToInt32(dt.Rows[iRow]["soluong"]) + Int32.Parse(quantity.Text);
            }
            else
            {

                DataRow dr = dt.NewRow();
                dr["id"] = hf_id.Value;
                dr["name"] = hf_name.Value;
                dr["des"] = hf_des.Value;
                dr["price"] = hf_price.Value;
                dr["unit"] = hf_unit.Value;
                dr["thumb"] = hf_thumb.Value;
                dr["soluong"] = Int32.Parse(quantity.Text);
                dt.Rows.Add(dr);
            }
            Session["cart"] = dt;
            Response.Redirect("cart.aspx");
        }
        private int checkExisted(DataTable dt, string id)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (dt.Rows[i]["id"].ToString() == id)
                {
                    return i;
                }
            }
            return -1;
        }
    }
}