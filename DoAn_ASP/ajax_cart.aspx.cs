using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DoAn_ASP.App_Code;
using System.Web.Services;
using System.Web.Script.Serialization;
namespace DoAn_ASP
{
                
    public partial class ajax_cart : System.Web.UI.Page
    {
           
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["cart"] != null)
            //    {
            //        DataTable dt_cart = new DataTable();
            //        dt_cart = (DataTable)Session["cart"];

            //        //them stt de xoa sam pham muon xoa
            //        DataTable dt = new DataTable();
            //        dt.Columns.Add("stt");
            //        dt.Columns.Add("id");
            //        dt.Columns.Add("name");
            //        dt.Columns.Add("des");
            //        dt.Columns.Add("price");
            //        dt.Columns.Add("unit");
            //        dt.Columns.Add("thumb");
            //        dt.Columns.Add("soluong");
            //        for (int i = 0; i < dt_cart.Rows.Count; i++)
            //        {
            //            DataRow dr = dt.NewRow();
            //            dr["stt"] = i;
            //            dr["id"] = dt_cart.Rows[i]["id"].ToString();
            //            dr["name"] = dt_cart.Rows[i]["name"].ToString();
            //            dr["des"] = dt_cart.Rows[i]["des"].ToString();
            //            dr["price"] = dt_cart.Rows[i]["price"].ToString();
            //            dr["unit"] = dt_cart.Rows[i]["unit"].ToString();
            //            dr["thumb"] = dt_cart.Rows[i]["thumb"].ToString();
            //            dr["soluong"] = dt_cart.Rows[i]["soluong"].ToString();
            //            dt.Rows.Add(dr);
            //        }
            //        reapeater_Cart.DataSource = dt;
            //        reapeater_Cart.DataBind();
            //        lbl_cart.Visible = false;
            //        lbl_cart.Text = "";
            //        int total = 0;
            //        foreach (DataRow row in dt.Rows)
            //        {
            //            total += Int32.Parse((Int32.Parse(row["price"].ToString()) * Int32.Parse(row["soluong"].ToString())).ToString());
            //        }
            //        lbl_Subtotal.Text = "$" + total.ToString() + ".00";
            //        lbl_Total.Text = "$" + total.ToString() + ".00";

            //        dt.Columns.Remove("stt");
            //        Session["cart"] = dt;
            //    }
            //    else
            //    {
            //        lbl_cart.Text = "Not things";
            //        lbl_cart.Visible = true;
            //        lbl_Subtotal.Text = "$0.00";
            //        lbl_Total.Text = "$0.00";
            //    }
            }
        [WebMethod]
        public static string ShowCart()
        {

            if (HttpContext.Current.Session["cart"] != null)
            {
                DataTable dt_cart = new DataTable();
                dt_cart = (DataTable)HttpContext.Current.Session["cart"];

                //them stt de xoa sam pham muon xoa
                DataTable dt = new DataTable();
                dt.Columns.Add("stt");
                dt.Columns.Add("id");
                dt.Columns.Add("name");
                dt.Columns.Add("des");
                dt.Columns.Add("price");
                dt.Columns.Add("unit");
                dt.Columns.Add("thumb");
                dt.Columns.Add("soluong");
                for (int i = 0; i < dt_cart.Rows.Count; i++)
                {
                    DataRow dr = dt.NewRow();
                    dr["stt"] = i;
                    dr["id"] = dt_cart.Rows[i]["id"].ToString();
                    dr["name"] = dt_cart.Rows[i]["name"].ToString();
                    dr["des"] = dt_cart.Rows[i]["des"].ToString();
                    dr["price"] = dt_cart.Rows[i]["price"].ToString();
                    dr["unit"] = dt_cart.Rows[i]["unit"].ToString();
                    dr["thumb"] = dt_cart.Rows[i]["thumb"].ToString();
                    dr["soluong"] = dt_cart.Rows[i]["soluong"].ToString();
                    dt.Rows.Add(dr);
                }
           
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow dr in dt.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dt.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                rows.Add(row);
            }
            Dictionary<string, object> json = new Dictionary<string, object>();
            json.Add("obj", rows);
            return new JavaScriptSerializer().Serialize(json);
            }
            return null;
        }

         [WebMethod]
        public static void DeleteItemCart(string stt)
        {
            DataTable dt = new DataTable();
            dt = (DataTable)HttpContext.Current.Session["cart"];

            int index = Int32.Parse(stt);
            dt.Rows.RemoveAt(index);
            if (dt.Rows.Count == 0)
            {
                HttpContext.Current.Session["cart"] = null;
            }
        }
        protected void reapeater_Cart_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "will_del")
            {
                DataTable dt = new DataTable();
                dt = (DataTable)Session["cart"];

                int index = Int32.Parse(e.CommandArgument.ToString());
                dt.Rows.RemoveAt(index);
                if (dt.Rows.Count == 0)
                {
                    Session["cart"] = null;
                }
                Response.Redirect("cart.aspx");
            }
        }
        }
    }