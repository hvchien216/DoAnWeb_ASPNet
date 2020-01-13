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
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //DataTable dt = new DataTable();
                //string query = "SELECT TOP 8 * FROM food order by sold asc";
                //dt = DataProvider.getDataTable(query);
                //reapeater_product.DataSource = dt;
                //reapeater_product.DataBind();

                DataTable dt_slider = new DataTable();
                string query_slider = "SELECT * FROM slider";
                dt_slider = DataProvider.getDataTable(query_slider);
                repeater_slider.DataSource = dt_slider;
                repeater_slider.DataBind();

                if (Session["thanhtoan"] != null)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMess", "swal.fire({title: 'Thanh toán thành công',text: 'Đang xác nhận thông tin đặt hàng...',type: 'success',confirmButtonColor: '#3085d6',});", true);
                    Session["thanhtoan"] = null;
                }
            }
        }

        [WebMethod]
        public static string ShowTop8Product()
        {
            DataTable dt = new DataTable();
            string query = "SELECT TOP 8 * FROM food where xoa = 0 order by sold asc ";
            dt = DataProvider.getDataTable(query);
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
        [WebMethod]
        public static string AddToCart(string id)
        {
            DataTable dt_select = new DataTable();
            string query = "Select * from food where id = " + id;
            dt_select = DataProvider.getDataTable(query);

            //dt_select.Rows[0]["id"].ToString();

            DataTable dt = new DataTable();
            if (HttpContext.Current.Session["cart"] == null)
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
                dt = (DataTable)HttpContext.Current.Session["cart"];

            }
            //checkID
            int co = 0;
            if (dt.Rows.Count == 0)
                co = -1; 
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                     if (dt.Rows[i]["id"].ToString() == id)
                    {
                        co = i;
                        break;
                    }
                     else
                     {
                         co = -1;
                     }
                }



                if (co != -1)
                {
                    dt.Rows[co]["soluong"] = Convert.ToInt32(dt.Rows[co]["soluong"]) + 1;
                }
                else
                {
                    foreach (DataRow row in dt_select.Rows)
                    {

                        DataRow dr = dt.NewRow();
                        dr["id"] = row["id"].ToString();
                        dr["name"] = row["name"].ToString();
                        dr["des"] = row["description"].ToString();
                        dr["price"] = row["price"].ToString();
                        dr["unit"] = row["unit"].ToString();
                        dr["thumb"] = row["thumb"].ToString();
                        dr["soluong"] = 1;
                        dt.Rows.Add(dr);
                    }
                }
              
                HttpContext.Current.Session["cart"] = dt;
                return dt.Rows.Count.ToString();
            }
        protected void reapeater_product_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Add_To_Cart")
            {
                HiddenField hf_id = (HiddenField)e.Item.FindControl("hf_id");
                HiddenField hf_name = (HiddenField)e.Item.FindControl("hf_name");
                HiddenField hf_price = (HiddenField)e.Item.FindControl("hf_price");
                HiddenField hf_des = (HiddenField)e.Item.FindControl("hf_des");
                HiddenField hf_thumb = (HiddenField)e.Item.FindControl("hf_thumb");
                HiddenField hf_unit = (HiddenField)e.Item.FindControl("hf_unit");

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
                    dt.Rows[iRow]["soluong"] = Convert.ToInt32(dt.Rows[iRow]["soluong"]) + 1;
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
                    dr["soluong"] = 1;
                    dt.Rows.Add(dr);
                }
                Session["cart"] = dt;
                Response.Redirect("index.aspx");
            }
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