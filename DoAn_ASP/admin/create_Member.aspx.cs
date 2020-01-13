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
    public partial class create_Member : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
            bool sXoa = false;
            ThemTaiKhoan acc = new ThemTaiKhoan(sUsername, sPwd, sName, sPhone, iRole, iStt, sEmail, sXoa);
            if (acc.addMember())
            {
                UserName.Text = "";
                exampleInputPassword.Text = "";
                exampleRepeatPassword.Text = "";
                Name.Text = "";
                exampleInputEmail.Text = "";
                phone.Text = "";
                listRole.SelectedIndex = 0;
                listStatus.SelectedIndex = 0;
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMess", "swal.fire({title: 'Add member success!',type: 'success'});", true);

            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMess", "swal.fire({title: 'Add member fail!',type: 'warning'});", true);
                lbl_checkUser.Text = "Username đã tồn tại";
            }
        }
    }
}