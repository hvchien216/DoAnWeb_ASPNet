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
    public partial class vegefood : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {   
                //if(Session["cart"]!=null)
                //{
                //}
                //else
                //{
                //    Response.Write("bbbbbbbbbbbbbbbbbbbbbbbbb");
                //}
                DataTable dt = new DataTable();
                string query = "SELECT TOP 8 * FROM food ";
                dt = DataProvider.getDataTable(query);
                reapeater_product.DataSource = dt;
                reapeater_product.DataBind();

                if(Session["thanhtoan"]!=null)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMess", "swal.fire({title: 'Thanh toán thành công',text: 'Đang xác nhận thông tin đặt hàng...',type: 'success',confirmButtonColor: '#3085d6',});", true);
                    Session["thanhtoan"] = null;
                }
            }
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
                if(iRow != -1)
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

            }
        }
        private int checkExisted(DataTable dt, string id)
        {
            for(int i = 0; i < dt.Rows.Count; i++)
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