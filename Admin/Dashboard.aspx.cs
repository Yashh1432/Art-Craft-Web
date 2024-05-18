using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Dashboard : System.Web.UI.Page
{
    
    SqlConnection con = new SqlConnection("Data Source=DESKTOP-L6GFUGE\\YASH;Initial Catalog=artandshopmns;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        con.Open();
        string customerCountQuery = "SELECT COUNT(*) FROM tbl_user where role='1'";
        SqlCommand customerCountCommand = new SqlCommand(customerCountQuery, con);
        int customerCount = (int)customerCountCommand.ExecuteScalar();

        Session["customercount"] = customerCount;

        string productCountQuery = "SELECT COUNT(*) FROM tbl_product";
        SqlCommand productCountCommand = new SqlCommand(productCountQuery, con);
        int productCount = (int)productCountCommand.ExecuteScalar();
        Session["productcount"] = productCount;

        string productstockQuery = "SELECT SUM(quantity) FROM tbl_stock";
        SqlCommand stockCountCommand = new SqlCommand(productstockQuery, con);
        int stockcount = (int)stockCountCommand.ExecuteScalar();
        Session["stockcount"] = stockcount;

        string orderCommand = "SELECT COUNT(*) FROM tbl_order";
        SqlCommand orderCommandCommand = new SqlCommand(orderCommand, con);
        int ordercount = (int)orderCommandCommand.ExecuteScalar();
        Session["ordercount"] = ordercount;


    }
}