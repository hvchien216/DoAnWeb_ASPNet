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
    public partial class vegefoods : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Session["cart"] != null)
                {
                    DataTable dt = new DataTable();
                    dt = (DataTable)Session["cart"];
                    int buy = 0;
                    foreach (DataRow row in dt.Rows)
                    {
                        buy++;
                    }
                    lbl_bought.Text = "[" + buy.ToString() + "]";
                }
                else
                {
                    lbl_bought.Text = "[0]";
                }
            }
        }
    }
}