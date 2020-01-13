﻿using System;
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
    public partial class demo_ajax_shop : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    DataTable dt_filter = new DataTable();
            //    string filter_query = "SELECT * FROM food_type where xoa = 0";
            //    dt_filter = DataProvider.getDataTable(filter_query);
            //    //DataRow dr = dt_filter.NewRow();
            //    //dr["type_id"] = 0;
            //    //dr["type_name"] = "All";
            //    //dt_filter.Rows.Add(dr);

            //    DataTable dt_show_filter = new DataTable();
            //    dt_show_filter.Columns.Add("type_id");
            //    dt_show_filter.Columns.Add("type_name");
            //    dt_show_filter.Columns.Add("index");
            //    dt_show_filter.Columns.Add("active");
            //    DataRow dr3 = dt_show_filter.NewRow();
            //    dr3["type_id"] = "0";
            //    dr3["type_name"] = "All";
            //    dr3["index"] = "0";
            //    if (Request["filter"] == null)
            //        dr3["active"] = 1;
            //    else
            //        dr3["active"] = 0;
            //    dt_show_filter.Rows.Add(dr3);
            //    for (int i = 0; i < dt_filter.Rows.Count; i++)
            //    {


            //        DataRow dr2 = dt_show_filter.NewRow();
            //        dr2["type_id"] = dt_filter.Rows[i]["type_id"].ToString();
            //        dr2["type_name"] = dt_filter.Rows[i]["type_name"].ToString();
            //        dr2["index"] = dt_filter.Rows[i]["type_id"].ToString();

            //        if ((Request["filter"] == null && i == Int32.Parse(dt_filter.Rows[i]["type_id"].ToString())) || (Request["filter"] != null && Convert.ToInt32(Request["filter"]) == Int32.Parse(dt_filter.Rows[i]["type_id"].ToString())))
            //            dr2["active"] = 1;
            //        else
            //            dr2["active"] = 0;
            //        dt_show_filter.Rows.Add(dr2);

            //        //DataRow dr2 = dt_show_filter.NewRow();
            //        //dr2["type_id"] = dt_filter.Rows[i]["type_id"].ToString();
            //        //dr2["type_name"] = dt_filter.Rows[i]["type_name"].ToString();
            //        //dr2["index"] = dt_filter.Rows[i]["type_id"].ToString();

            //        //if ((Request["filter"] == null && i == Int32.Parse(dt_filter.Rows[i]["type_id"].ToString())) || (Request["filter"] != null && Convert.ToInt32(Request["filter"]) == Int32.Parse(dt_filter.Rows[i]["type_id"].ToString())))
            //        //    dr2["active"] = 1;
            //        //else
            //        //    dr2["active"] = 0;
            //        //dt_show_filter.Rows.Add(dr2);
            //    }
            //    repeater_filter.DataSource = dt_show_filter;
            //    repeater_filter.DataBind();

            //    DataTable dt = new DataTable();
            //    string query = "";
            //    if (Request["filter"] != null && Request["filter"] != "0")
            //    {
            //        query = "SELECT * FROM food where type = " + Request["filter"].ToString();
            //        dt = DataProvider.getDataTable(query);
            //    }
            //    else
            //    {
            //        query = "SELECT * FROM food";
            //        dt = DataProvider.getDataTable(query);
            //    }

            //    int so_item_1trang = 12;
            //    int so_trang = dt.Rows.Count / so_item_1trang + (dt.Rows.Count % so_item_1trang == 0 ? 0 : 1);
            //    int page = Request["page"] == null ? 1 : Convert.ToInt32(Request["page"]);
            //    int from = (page - 1) * so_item_1trang;
            //    int to = page * so_item_1trang - 1;
            //    for (int i = dt.Rows.Count - 1; i >= 0; i--)
            //    {
            //        if (i < from || i > to)
            //        {
            //            dt.Rows.RemoveAt(i);
            //        }
            //    }
            //    repeater_product.DataSource = dt;
            //    repeater_product.DataBind();

            //    //IN RA Phan trang
            //    DataTable dtPage = new DataTable();
            //    dtPage.Columns.Add("index");
            //    dtPage.Columns.Add("active");
            //    for (int i = 1; i <= so_trang; i++)
            //    {
            //        DataRow dr1 = dtPage.NewRow();
            //        dr1["index"] = i;

            //        if ((Request["page"] == null && i == 1) || (Request["page"] != null && Convert.ToInt32(Request["page"]) == i))
            //            dr1["active"] = 1;
            //        else
            //            dr1["active"] = 0;
            //        dtPage.Rows.Add(dr1);
            //    }
            //    repeater_phantrang.DataSource = dtPage;
            //    repeater_phantrang.DataBind();
            //}
        }

        [WebMethod]
        public static string SearchCode(string key, string p_current)
        {
            //filter
            DataTable dt_filter = new DataTable();
            string filter_query = "SELECT * FROM food_type where xoa = 0";
            dt_filter = DataProvider.getDataTable(filter_query);
           
            DataTable dt_show_filter = new DataTable();
            dt_show_filter.Columns.Add("type_id");
            dt_show_filter.Columns.Add("type_name");
            dt_show_filter.Columns.Add("index");
            dt_show_filter.Columns.Add("active");
            DataRow dr3 = dt_show_filter.NewRow();
            dr3["type_id"] = "0";
            dr3["type_name"] = "All";
            dr3["index"] = "0";
            if (key == "0")
                dr3["active"] = 1;
            else
                dr3["active"] = 0;
            dt_show_filter.Rows.Add(dr3);
            for (int i = 0; i < dt_filter.Rows.Count; i++)
            {
                DataRow dr2 = dt_show_filter.NewRow();
                dr2["type_id"] = dt_filter.Rows[i]["type_id"].ToString();
                dr2["type_name"] = dt_filter.Rows[i]["type_name"].ToString();
                dr2["index"] = dt_filter.Rows[i]["type_id"].ToString();

                
                    if ((key == null && i == Int32.Parse(dt_filter.Rows[i]["type_id"].ToString())) || (key != null && Convert.ToInt32(key) == Int32.Parse(dt_filter.Rows[i]["type_id"].ToString())))
                        dr2["active"] = 1;
                    else
                        dr2["active"] = 0;
                
                dt_show_filter.Rows.Add(dr2);
            }
            List<Dictionary<string, object>> dsFilter = new List<Dictionary<string, object>>();
            Dictionary<string, object> filter;
            foreach (DataRow dr in dt_show_filter.Rows)
            {
                filter = new Dictionary<string, object>();
                foreach (DataColumn col in dt_show_filter.Columns)
                {
                    filter.Add(col.ColumnName, dr[col]);
                }
                dsFilter.Add(filter);
            }
            //product
            DataTable dt = new DataTable();
            string query = "";
            if (key != null && key != "0")
            {
                query = "SELECT * FROM food where type = " + key;
                dt = DataProvider.getDataTable(query);
            }
            else
            {
                query = "SELECT * FROM food";
                dt = DataProvider.getDataTable(query);
            }

            int so_item_1trang = 12;
            int so_trang = dt.Rows.Count / so_item_1trang + (dt.Rows.Count % so_item_1trang == 0 ? 0 : 1);
            int page = p_current == null ? 1 : Convert.ToInt32(p_current);
            int from = (page - 1) * so_item_1trang;
            int to = page * so_item_1trang - 1;
            for (int i = dt.Rows.Count - 1; i >= 0; i--)
            {
                if (i < from || i > to)
                {
                    dt.Rows.RemoveAt(i);
                }
            }

            //IN RA Phan trang
            DataTable dtPage = new DataTable();
            dtPage.Columns.Add("index");
            dtPage.Columns.Add("active");
            for (int i = 1; i <= so_trang; i++)
            {
                DataRow dr1 = dtPage.NewRow();
                dr1["index"] = i;

                if ((p_current == null && i == 1) || (p_current != null && Convert.ToInt32(p_current) == i))
                    dr1["active"] = 1;
                else
                    dr1["active"] = 0;
                dtPage.Rows.Add(dr1);
            }
            //string[] result = new string[so_trang];
            //for (int i = 0; i < so_trang; i++)
            //{
            //    result[i] = i.ToString();
            //}
            List<Dictionary<string, object>> dsPhanTrang = new List<Dictionary<string, object>>();
            Dictionary<string, object> phantrang;
            foreach (DataRow dr in dtPage.Rows)
            {
                phantrang = new Dictionary<string, object>();
                foreach (DataColumn col in dtPage.Columns)
                {
                    phantrang.Add(col.ColumnName, dr[col]);
                }
                dsPhanTrang.Add(phantrang);
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
            json.Add("record", dsPhanTrang);
            json.Add("filter", dsFilter);
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
        protected void repeater_product_ItemCommand(object source, RepeaterCommandEventArgs e)
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
                Response.Redirect("shop.aspx");

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