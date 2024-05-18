using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_stock : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=DESKTOP-L6GFUGE\\YASH;Initial Catalog=artandshopmns;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request.QueryString["sid"]))
        {
            int sid;
            if (int.TryParse(Request.QueryString["sid"], out sid))
            {
                Deletecategory(sid);
            }
        }
        con.Close();
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT tbl_stock.sid, tbl_product.pname, tbl_product.img, tbl_stock.quantity FROM tbl_stock INNER JOIN tbl_product ON tbl_stock.pname=tbl_product.pid", con);
        cmd.ExecuteNonQuery();
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        viewstock.DataSource = dt;
        viewstock.DataBind();
        con.Close();
    }
    private void Deletecategory(int sid)
    {

        con.Open();
        using (SqlCommand cmd = new SqlCommand("DELETE FROM tbl_stock WHERE sid = @sid", con))
        {
            cmd.Parameters.AddWithValue("@sid", sid);
            cmd.ExecuteNonQuery();
        }


        // Redirect back to the product page after deleting
        Response.Redirect("stock.aspx");
    }
}