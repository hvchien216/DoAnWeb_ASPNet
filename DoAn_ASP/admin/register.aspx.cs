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
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if(IsPostBack)
            { 
            if (Request.QueryString["id"] != "")
            {
                btnUpdate.Visible = true;
                btnAdd.Visible = false;
                lbl_NamePage.Text = "Edit information";
                exampleInputPassword.Enabled = false;
                exampleInputPassword.Visible = false;
                exampleRepeatPassword.Enabled = false;
                exampleRepeatPassword.Visible = false;
                rfv_pass.Enabled = false;
                rfv_prepass.Enabled = false;
                DataTable dt = new DataTable();
                string username = Request.QueryString["id"];
                string query = "SELECT * FROM member WHERE username = '" + username + "'";

                //SqlParameter[] paras = new SqlParameter[1]{
                //    new SqlParameter("@us",SqlDbType.VarChar,50){Value = username},
                //};

                dt = DataProvider.getDataTable(query);

                //using (SqlConnection connection = new SqlConnection(@"Data Source=DESKTOP-98N0JM4\SQL_EN2012;Initial Catalog=doan_asp_DB;Integrated Security=True"))
                //using (SqlDataAdapter adapter = new SqlDataAdapter(query, connection))
                //{
                //    try
                //    {
                //        //fill the datatable with the contents from the database
                //        adapter.Fill(dt);
                //    }
                //    catch
                //    {
                //    }
                //}

                //ViewState["myViewState"] = dt;

                foreach (DataRow row in dt.Rows)
                {
                    UserName.Text = row["username"].ToString();
                    exampleInputPassword.Text = row["pass"].ToString();
                    exampleRepeatPassword.Text = row["pass"].ToString();
                    Name.Text = row["name"].ToString();
                    phone.Text = row["phone"].ToString();
                    exampleInputEmail.Text = row["email"].ToString();
                    listRole.SelectedValue = row["role"].ToString();
                    listStatus.SelectedValue = row["status"].ToString();
                    //string sPwd = exampleInputPassword.Text;
                    //string sName = Name.Text;
                    //string sEmail = exampleInputEmail.Text;
                    //string sPhone = phone.Text;
                    //int iRole = Convert.ToInt32(listRole.SelectedValue);
                    //int iStt = Convert.ToInt32(listStatus.SelectedValue);
                }
            }
            else
            {
                exampleInputPassword.Enabled = true;
                exampleInputPassword.Visible = true;
                exampleRepeatPassword.Enabled = true;
                exampleRepeatPassword.Visible = true;
                rfv_pass.Enabled = true;
                rfv_prepass.Enabled = true;
                btnUpdate.Visible = false;
                btnAdd.Visible = true;
                lbl_NamePage.Text = "Create Account";
            }
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string sUsername = UserName.Text;
            string sPwd = exampleInputPassword.Text;
            string sName = Name.Text;
            string sEmail = exampleInputEmail.Text;
            string sPhone = phone.Text;
            int iRole = Convert.ToInt32(listRole.SelectedValue);
            int iStt = Convert.ToInt32(listStatus.SelectedValue);
            ThemTaiKhoan acc = new ThemTaiKhoan(sUsername, sPwd, sName, sPhone, iRole, iStt, sEmail);
            if (acc.addMember())
            {
                txtkq.InnerHtml = "Add success";
                Response.Redirect("DSMember.aspx");
            }
            else
            {
                //txtkq.InnerHtml = "Fail"; 
                lbl_checkUser.Text = "Username đã tồn tại";
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string sUsername = UserName.Text;
            string sPwd = exampleInputPassword.Text;
            string sName = Name.Text;
            string sEmail = exampleInputEmail.Text;
            string sPhone = phone.Text;
            int iRole = Convert.ToInt32(listRole.SelectedValue);
            int iStt = Convert.ToInt32(listStatus.SelectedValue);
            ThemTaiKhoan acc = new ThemTaiKhoan(sUsername, sPwd, sName, sPhone, iRole, iStt, sEmail);
            if (acc.editMember())
            {
                txtkq.InnerHtml = "update success";
                //Response.Redirect("DSMember.aspx");
            }
            else
            {
                //txtkq.InnerHtml = "Fail"; 
                lbl_checkUser.Text = "fail";
            }
        }
    }
}