using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
namespace DoAn_ASP.App_Code
{
    /// <summary>
    /// Summary description for FoodType
    /// </summary>
    public class FoodType
    {

        private int _type_id;

        public int Type_id
        {
            get { return _type_id; }
            set { _type_id = value; }
        }
        private string _type_name;

        public string Type_name
        {
            get { return _type_name; }
            set { _type_name = value; }
        }
        private int _type_pos;

        public int Type_pos
        {
            get { return _type_pos; }
            set { _type_pos = value; }
        }
        private string _type_img;

        public string Type_img
        {
            get { return _type_img; }
            set { _type_img = value; }
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
        public bool _xoa;
        public bool Xoa
        {
            get { return _xoa; }
            set { _xoa = value; }
        }
        public FoodType(int typeid,string typename,int typepos,string typeimg,int status,string username,DateTime modified)
        {
            this._type_id = typeid;
            this._type_name = typename;
            this._type_pos = typepos;
            this._type_img = typeimg;
            this._status = status;
            this._username = username;
            this._modified = modified;
        }
        public FoodType(string typename, int typepos, string typeimg, int status, string username, DateTime modified,bool xoa)
        {
            this._type_name = typename;
            this._type_pos = typepos;
            this._type_img = typeimg;
            this._status = status;
            this._username = username;
            this._modified = modified;
            this._xoa = xoa;

        }
        public bool addTypeFood()
        {
            string sQuery = "INSERT INTO [dbo].[food_type] ([type_name] ,[type_pos] ,[type_img] ,[status] ,[username] ,[modified],[xoa]) VALUES(@typename,@typepos,@typeimg,@status,@username,@modified,@xoa)";
            SqlParameter[] paras = new SqlParameter[7]{
            new SqlParameter("@typename",SqlDbType.NVarChar,50){Value = this._type_name},
            new SqlParameter("@typepos",SqlDbType.Int){Value = this._type_pos},
            new SqlParameter("@typeimg",SqlDbType.VarChar,50){Value = this._type_img},
            new SqlParameter("@status",SqlDbType.Int){Value = this._status},
            new SqlParameter("@username",SqlDbType.VarChar){Value = this._username},
            new SqlParameter("@modified",SqlDbType.DateTime){Value = this._modified},
            new SqlParameter("@xoa",SqlDbType.Bit,1){Value = this._xoa},
        };
            return DataProvider.executeNonQuery(sQuery, paras);

        }

        public bool updateTypeFood()
        {
            string sQuery = "UPDATE [dbo].[food_type] SET [type_name] = @typename, [type_pos] = @typepos,[type_img] = @typeimg ,[status] = @status,[username] = @username,[modified] = @modified WHERE type_id = @typeid";
            SqlParameter[] paras = {
            new SqlParameter("@typeid",this._type_id),
            new SqlParameter("@typename",this._type_name),
            new SqlParameter("@typepos",this._type_pos),
            new SqlParameter("@typeimg",this._type_img),
            new SqlParameter("@status",this._status),
            new SqlParameter("@username",this._username),
            new SqlParameter("@modified",this._modified),
        };
            return DataProvider.executeNonQuery(sQuery, paras);

        }
    }
}