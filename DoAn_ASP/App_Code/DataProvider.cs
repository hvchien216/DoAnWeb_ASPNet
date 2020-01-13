using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
namespace DoAn_ASP.App_Code
{ 
/// <summary>
/// Summary description for DataProvider
/// </summary>
public class DataProvider
{
    public static string ChuoiKetNoi = @"Data Source=DESKTOP-98N0JM4\SQL_EN2012;Initial Catalog=doan_asp_DB;Integrated Security=True";
    public static SqlConnection conn = new SqlConnection(ChuoiKetNoi);
    public static void Connect()
    {
        if (conn.State == ConnectionState.Closed || conn.State == ConnectionState.Broken)
        {
            conn.Open();
        }
    }
    public static bool executeNonQuery(string sQuery, SqlParameter[] paras)
    {
        try
        {
            Connect();
            SqlCommand cmd = new SqlCommand(sQuery, conn);
            cmd.Parameters.AddRange(paras);
            cmd.ExecuteNonQuery();
            conn.Close();
            return true;
        }
        catch (Exception ex)
        {
            return false;
        }
    }
    public static int executeScalar(string sQuery, SqlParameter[] paras)
    {
        try
        {
            Connect();
            SqlCommand cmd = new SqlCommand(sQuery, conn);
            cmd.Parameters.AddRange(paras);
            cmd.ExecuteNonQuery();
            sQuery = "Select @@identity";
            cmd = new SqlCommand(sQuery, conn);
            int id = Int32.Parse(cmd.ExecuteScalar().ToString());
            conn.Close();
            return id;
        }
        catch (Exception ex)
        {
            return -1;
        }
    }
    public static DataTable getDataTable(string sQuery)
    {
        try
        {
            Connect();
            SqlDataAdapter da = new SqlDataAdapter(sQuery, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;

        }
        catch (Exception ex)
        {
            return null;
        }
    }
   /* public string checkUsername(string username)
    {
        string result = "";
        Connect();
        SqlCommand cmd = conn.CreateCommand();
        cmd.CommandText = "Select * from member where username like '" + username + "'";
        try
        {
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
                result = "Chưa tồn tại";
            else
                result = "Đã tồn tại";
            conn.Close();
            return result;
        }
        catch (Exception ex)
        {
            return null;
        }

    }*/

}
}