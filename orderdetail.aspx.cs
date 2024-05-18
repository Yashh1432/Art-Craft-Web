using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class orderdetail : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=DESKTOP-L6GFUGE\\YASH;Initial Catalog=artandshopmns;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["useremail"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {

            if (!string.IsNullOrEmpty(Request.QueryString["order_id"]))
            {
                string order_id = Request.QueryString["order_id"];

                con.Close();
                con.Open();
                String u_id = (String)Session["u_id"].ToString();
                SqlCommand cmd = new SqlCommand("SELECT tbl_order_item.o_i_id, tbl_product.pid, tbl_product.pname, tbl_product.img, tbl_product.brand, tbl_product.price,  tbl_order_item.quantity  FROM tbl_order_item INNER JOIN tbl_product ON tbl_order_item.p_id=tbl_product.pid where order_id='" + order_id + "'", con);

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    DataTable dt = new DataTable();
                    dt.Load(reader);
                    vieworderproductlist.DataSource = dt;
                    vieworderproductlist.DataBind();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showToastdanget", "showToastdanget('Empty List !!!');", true);
                }

                con.Close();

            }



        }
    }
}