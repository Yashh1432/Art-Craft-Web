using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class wishlist : System.Web.UI.Page
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

            if (!string.IsNullOrEmpty(Request.QueryString["wishid"]))
            {
                int wishId;
                if (int.TryParse(Request.QueryString["wishid"], out wishId))
                {
                    DellteWishlistItem(wishId);
                }
            }



            con.Close();
            con.Open();
            String u_id = (String)Session["u_id"].ToString();
            SqlCommand cmd = new SqlCommand("SELECT tbl_wishlist.w_id, tbl_product.pid, tbl_product.pname, tbl_product.img, tbl_product.brand, tbl_product.price FROM tbl_wishlist INNER JOIN tbl_product ON tbl_wishlist.p_id=tbl_product.pid where u_id='" + u_id + "'", con);

            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                DataTable dt = new DataTable();
                dt.Load(reader);
                viewwishlist.DataSource = dt;
                viewwishlist.DataBind();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showToastdanget", "showToastdanget('Empty List !!!');", true);
                emtylist.Visible = false;
            }

            con.Close();
        }
    }


    private void DellteWishlistItem(int wishId)
    {

        con.Open();
        using (SqlCommand cmd = new SqlCommand("DELETE FROM tbl_wishlist WHERE w_id = @wishid", con))
        {
            cmd.Parameters.AddWithValue("@wishid", wishId);
            cmd.ExecuteNonQuery();
        }


        // Redirect back to the product page after deletings
        Response.Redirect("wishlist.aspx");
    }

    protected void emtylist_Click(object sender, EventArgs e)
    {
        con.Open();
        String u_id = Session["u_id"].ToString();
        using (SqlCommand cmd = new SqlCommand("DELETE FROM tbl_wishlist WHERE u_id = @u_id", con))
        {
            cmd.Parameters.AddWithValue("@uid", u_id);
            cmd.ExecuteNonQuery();
        }


        // Redirect back to the product page after deletings
        Response.Redirect("wishlist.aspx");
    }
}