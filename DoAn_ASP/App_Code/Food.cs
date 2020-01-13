using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
namespace DoAn_ASP.App_Code
{ 
/// <summary>
/// Summary description for Food
/// </summary>
public class Food
{

    private int _id;
    public int Id
    {
        get { return _id; }
        set { _id = value; }
    }

    private string _name;
    public string Name
    {
        get { return _name; }
        set { _name = value; }
    }
    private string _description;
    public string Description
    {
        get { return _description; }
        set { _description = value; }
    }
    private int _price;

    public int Price
    {
        get { return _price; }
        set { _price = value; }
    }
    private int _price_promo;

    public int Price_promo
    {
        get { return _price_promo; }
        set { _price_promo = value; }
    }
    private string _thumb;

    public string Thumb
    {
        get { return _thumb; }
        set { _thumb = value; }
    }
    private string _img;

    public string Img
    {
        get { return _img; }
        set { _img = value; }
    }
    private string _unit;

    public string Unit
    {
        get { return _unit; }
        set { _unit = value; }
    }
    private int _percent_promo;

    public int Percent_promo
    {
        get { return _percent_promo; }
        set { _percent_promo = value; }
    }
    private int _rating;

    public int Rating
    {
        get { return _rating; }
        set { _rating = value; }
    }
    private int _sold;

    public int Sold
    {
        get { return _sold; }
        set { _sold = value; }
    }
    private int _point;

    public int Point
    {
        get { return _point; }
        set { _point = value; }
    }
    private int _type;

    public int Type
    {
        get { return _type; }
        set { _type = value; }
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

    public Food(int id, string name, string des, int price, int price_promo, string thumb, string img, string unit, int percent_promo, int rating, int sold, int point, int type, int status, string username, DateTime modified)
    {
        this._id = id;
        this._name = name;
        this._description = des;
        this._price = price;
        this._price_promo = price_promo;
        this._thumb = thumb;
        this._img = img;
        this._unit = unit;
        this._percent_promo = percent_promo;
        this._rating = rating;
        this._point = point;
        this._sold = sold;
        this._type = type;
        this._status = status;
        this._username = username;
        this._modified = modified;
    }
    public Food(string name, string des, int price, int price_promo, string thumb, string img, string unit, int percent_promo, int rating, int sold, int point, int type, int status, string username, DateTime modified,bool xoa)
    {
        this._name = name;
        this._description = des;
        this._price = price;
        this._price_promo = price_promo;
        this._thumb = thumb;
        this._img = img;
        this._unit = unit;
        this._percent_promo = percent_promo;
        this._rating = rating;
        this._point = point;
        this._sold = sold;
        this._type = type;
        this._status = status;
        this._username = username;
        this._modified = modified;
        this._xoa = xoa;
    }
    
    public bool addFood()
    {
        string sQuery = "INSERT INTO [dbo].[food] ([name] ,[description] ,[price] ,[price_promo] ,[thumb] ,[img] ,[unit] ,[percent_promo] ,[rating] ,[sold] ,[point] ,[type] ,[status] ,[username] ,[modified],[xoa]) VALUES (@name ,@des ,@price ,@price_promo ,@thumb ,@img ,@unit ,@percent_promo ,@rating ,@sold ,@point ,@type ,@stt ,@us ,@modified,@xoa)";
        SqlParameter[] paras = {
            new SqlParameter("@name",this._name),
            new SqlParameter("@des", this._description),
            new SqlParameter("@price",this._price),
            new SqlParameter("@price_promo",this._price_promo),
            new SqlParameter("@thumb",this._thumb),
            new SqlParameter("@img",this._img),
            new SqlParameter("@unit",this._unit),
            new SqlParameter("@percent_promo", this._percent_promo),
            new SqlParameter("@rating",this._rating),
            new SqlParameter("@sold",this._sold),
            new SqlParameter("@point",this._point),
            new SqlParameter("@type",this._type),
            new SqlParameter("@stt", this._status),
            new SqlParameter("@us", this._username),
            new SqlParameter("@modified", this._modified) ,
            new SqlParameter("@xoa", this._xoa) ,
        };
        return DataProvider.executeNonQuery(sQuery, paras);

    }

    public bool updateFood()
    {
        string sQuery = "UPDATE [dbo].[food] SET [name] = @name ,[description] = @des ,[price] = @price ,[price_promo] = @price_promo ,[thumb] = @thumb ,[img] = @img ,[unit] = @unit ,[percent_promo] = @percent_promo ,[rating] = @rating ,[sold] = @sold ,[point] = @point ,[type] =@type ,[status] = @stt ,[username] = @us ,[modified] = @modified WHERE id = @id";
        SqlParameter[] paras = {
            new SqlParameter("@id",this._id),
            new SqlParameter("@name",this._name),
            new SqlParameter("@des", this._description),
            new SqlParameter("@price",this._price),
            new SqlParameter("@price_promo",this._price_promo),
            new SqlParameter("@thumb",this._thumb),
            new SqlParameter("@img",this._img),
            new SqlParameter("@unit",this._unit),
            new SqlParameter("@percent_promo", this._percent_promo),
            new SqlParameter("@rating",this._rating),
            new SqlParameter("@sold",this._sold),
            new SqlParameter("@point",this._point),
            new SqlParameter("@type",this._type),
            new SqlParameter("@stt", this._status),
            new SqlParameter("@us", this._username),
            new SqlParameter("@modified", this._modified)  
        };
        return DataProvider.executeNonQuery(sQuery, paras);

    }


}
}