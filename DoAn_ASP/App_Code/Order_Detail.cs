using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
namespace DoAn_ASP.App_Code
{
    public class Order_Detail
    {
        private int _order_id;
        public int Order_id
        {
            get { return _order_id; }
            set { _order_id = value; }
        }
        private int _food_id;
        public int Food_id
        {
            get { return _food_id; }
            set { _food_id = value; }
        }
        private int _quan;
        public int Quan
        {
            get { return _order_id; }
            set { _order_id = value; }
        }
        
        private string _unit;
        public string Unit
        {
            get { return _unit; }
            set { _unit = value; }
        }
        private int _price;
        public int Price
        {
            get { return _price; }
            set { _price = value; }
        }
        private int _total;
        public int Total
        {
            get { return _total; }
            set { _total = value; }
        }
        public Order_Detail(int orderid,int foodid,int quan,string unit,int price,int total)
        {
            _order_id = orderid;
            _food_id = foodid;
            _quan = quan;
            _unit = unit;
            _price = price;
            _total = total;
        }
        public bool addOrderDetail()
        {
            string sQuery = "INSERT INTO [dbo].[order_detail] ([order_id] ,[food_id] ,[quan] ,[unit] ,[price] ,[total]) VALUES (@orderid ,@foodid ,@quan ,@unit ,@price ,@total )";
            SqlParameter[] paras = {
            new SqlParameter("@orderid",this._order_id),
            new SqlParameter("@foodid",this._food_id),
            new SqlParameter("@quan",this._quan),
            new SqlParameter("@unit",this._unit),
            new SqlParameter("@price",this._price),
            new SqlParameter("@total",this._total),
        };
            return DataProvider.executeNonQuery(sQuery, paras);
        }
    }
}