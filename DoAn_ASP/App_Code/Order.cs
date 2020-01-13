using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
namespace DoAn_ASP.App_Code
{
    public class Order
    {
        
        private string _cus_name;
        public string Cus_name
        {
            get { return _cus_name; }
            set { _cus_name = value; }
        }
        private string _cus_phone;
        public string Cus_phone
        {
            get { return _cus_phone; }
            set { _cus_phone = value; }
        }
        private string _cus_add;
        public string Cus_add
        {
            get { return _cus_add; }
            set { _cus_add = value; }
        }
        private int _quan;
        public int Quan
        {
            get { return _quan; }
            set { _quan = value; }
        }
        private int _sum;
        public int Sum
        {
            get { return _sum; }
            set { _sum = value; }
        }
        private int _status;
        public int Status
        {
            get { return _status; }
            set { _status = value; }
        }
        private string _username;
        public string Username
        {
            get { return _username; }
            set { _username = value; }
        }
        private DateTime _modified;
        public DateTime Modified
        {
            get { return _modified; }
            set { _modified = value; }
        }
        private DateTime _created;
        public DateTime Created
        {
            get { return _created; }
            set { _created = value; }
        }
        private string _cus_username;
        public string Cus_username
        {
            get { return _cus_username; }
            set { _cus_username = value; }
        }
        public Order(string cusname,string cusphone,string cusadd,int quan,int sum, int stt,string username,DateTime modified,DateTime created,string cususername) 
        {
            _cus_name = cusname;
            _cus_phone = cusphone;
            _cus_add = cusadd;
            _quan = quan;
            _sum = sum;
            _status = stt;
            _username = username;
            _modified = modified;
            _created = created;
            _cus_username = cususername;
        }

        public int addOrder(){
            string sQuery = "INSERT INTO [dbo].[order] ([cus_name] ,[cus_phone] ,[cus_add] ,[quan] ,[sum] ,[status] ,[username] ,[modified] ,[created] ,[cus_username]) VALUES (@cusname ,@cusphone ,@cusadd ,@quan ,@sum,@stt ,@username ,@modified ,@createed ,@cususername )";
            SqlParameter[] paras = {
            new SqlParameter("@cusname",this._cus_name),
            new SqlParameter("@cusphone",this._cus_phone),
            new SqlParameter("@cusadd",this._cus_add),
            new SqlParameter("@quan",this._quan),
            new SqlParameter("@sum",this._sum),
            new SqlParameter("@stt",this._status),
            new SqlParameter("@username",this._username),
            new SqlParameter("@modified",this._modified),
            new SqlParameter("@createed",this._created),
            new SqlParameter("@cususername",this._cus_username),
        };
            return DataProvider.executeScalar(sQuery, paras);
        }
    }
}