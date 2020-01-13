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
    public partial class checkout1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["cart"] != null)
                {
                    DataTable dt = new DataTable();
                    dt = (DataTable)Session["cart"];
                    int total = 0;
                    int buy = 0;
                    foreach (DataRow row in dt.Rows)
                    {
                        total += Int32.Parse((Int32.Parse(row["price"].ToString()) * Int32.Parse(row["soluong"].ToString())).ToString());
                        buy++;
                    }
                    lbl_Subtotal.Text = "$" + total.ToString() + ".00";
                    lbl_Total.Text = "$" + total.ToString() + ".00";
                }
                else
                {
                    lbl_Subtotal.Text = "$0.00";
                    lbl_Total.Text = "$0.00";
                }

            }
        }
        protected void btn_thanhtoan_Click(object sender, EventArgs e)
        {
            if (Session["cart"] != null)
            {
                DataTable dt = new DataTable();
                dt = (DataTable)Session["cart"];
                int total = 0;
                foreach (DataRow row in dt.Rows)
                {
                    total += Int32.Parse((Int32.Parse(row["price"].ToString()) * Int32.Parse(row["soluong"].ToString())).ToString());
                }
                string cus_name = txt_cus_name.Text;
                string cus_phone = txt_cus_phone.Text;
                string cus_add = txt_cus_address.Text + " " + txt_cus_city.Text;
                int quan = 0;
                int sum = total;
                foreach (DataRow row in dt.Rows)
                {
                    quan += Int32.Parse(row["soluong"].ToString());
                }
                DateTime modified = DateTime.Parse(DateTime.Now.ToString());
                DateTime created = DateTime.Parse(DateTime.Now.ToString());
                string username = "chien1";
                string cus_username = "";
                int stt = 1;
                Order order = new Order(cus_name, cus_phone, cus_add, quan, sum, stt, username, modified, created, cus_username);
                int id = order.addOrder();
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Order_Detail order_detail = new Order_Detail(id, Int32.Parse(dt.Rows[i]["id"].ToString()), Int32.Parse(dt.Rows[i]["soluong"].ToString()), dt.Rows[i]["unit"].ToString(), Int32.Parse(dt.Rows[i]["price"].ToString()), Int32.Parse(dt.Rows[i]["soluong"].ToString()) * Int32.Parse(dt.Rows[i]["price"].ToString()));
                    order_detail.addOrderDetail();
                }
                Session["cart"] = null;
                Session["thanhtoan"] = "success";
                Response.Redirect("index.aspx");
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMess", "swal.fire({title: 'Thanh toán thất bại!',text: 'Giỏ hàng rỗng không thể thực hiện thanh toán!',type: 'warning',confirmButtonColor: '#3085d6',});", true);
            }



        }
    }
}