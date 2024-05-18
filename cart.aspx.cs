using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cart : System.Web.UI.Page
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
            if (!string.IsNullOrEmpty(Request.QueryString["cartid"]))
            {
                int cartId;
                if (int.TryParse(Request.QueryString["cartid"], out cartId))
                {
                    DeletecartItem(cartId);
                }
            }

            if (!String.IsNullOrEmpty(Request.QueryString["cartmid"]))
            {
                int cartmId;
                if (int.TryParse(Request.QueryString["cartmid"], out cartmId))
                {
                    UpdatecartMItem(cartmId);
                }
            }

            if (!String.IsNullOrEmpty(Request.QueryString["cartpid"]))
            {
                int cartpId;
                if (int.TryParse(Request.QueryString["cartpid"], out cartpId))
                {
                    UpdatecartPItem(cartpId);
                }
            }

            con.Open();
            String u_id = Session["u_id"].ToString();
            SqlCommand cmd = new SqlCommand("SELECT tbl_cart.c_id, tbl_cart.quantity, tbl_product.pid, tbl_product.pname, tbl_product.img, tbl_product.price FROM tbl_cart INNER JOIN tbl_product ON tbl_cart.p_id=tbl_product.pid where u_id='" + u_id + "'", con);
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                DataTable dt = new DataTable();
                dt.Load(reader);
                viewcartlist.DataSource = dt;
                viewcartlist.DataBind();
                decimal totalAmount = dt.AsEnumerable().Sum(row => Convert.ToDecimal(row["price"]) * row.Field<int>("quantity"));
                lbltotal.Text = string.Format("&#8377;{0}.00", totalAmount);
            }
            else
            {
                // No items in cart, display appropriate message
                ScriptManager.RegisterStartupScript(this, GetType(), "showToastdanget", "showToastdanget('Empty Cart !!!');", true);
                lbltotal.Visible = false; // Hide total amount label
                viewcartlist.Visible = false; // Hide repeater
                emtycart.Visible = false;
                checkout.Visible = false;


            }

            con.Close();
        }
    }
    public static int GetCartItemCount()
    {
        // Connect to the database and fetch the cart item count
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-L6GFUGE\\YASH;Initial Catalog=artandshopmns;Integrated Security=True");
        con.Open();
        string userId = HttpContext.Current.Session["u_id"].ToString();
        SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM tbl_cart WHERE u_id = @UserId", con);
        cmd.Parameters.AddWithValue("@UserId", userId);
        int cartItemCount = Convert.ToInt32(cmd.ExecuteScalar());
        con.Close();

        return cartItemCount;
    }


    private void UpdatecartMItem(int cartmId)
    {
        con.Open();
        using (SqlCommand cmdSelect = new SqlCommand("SELECT quantity FROM tbl_cart WHERE c_id = @cartmid", con))
        {
            cmdSelect.Parameters.AddWithValue("@cartmid", cartmId);
            int currentQuantity = Convert.ToInt32(cmdSelect.ExecuteScalar());

            // Check if current quantity is greater than 1 before decrementing
            if (currentQuantity > 1)
            {
                using (SqlCommand cmdUpdate = new SqlCommand("UPDATE tbl_cart SET quantity = quantity - 1 WHERE c_id = @cartmid", con))
                {
                    cmdUpdate.Parameters.AddWithValue("@cartmid", cartmId);
                    cmdUpdate.ExecuteNonQuery();
                }
            }
            else
            {
                using (SqlCommand cmdDelete = new SqlCommand("delete from tbl_cart WHERE c_id = @cartmid", con))
                {
                    cmdDelete.Parameters.AddWithValue("@cartmid", cartmId);
                    cmdDelete.ExecuteNonQuery();
                }
            }
        }

        con.Close();

        // Redirect back to the cart page
        Response.Redirect("cart.aspx");
    }


    private void UpdatecartPItem(int cartpId)
    {

        con.Open();
        using (SqlCommand cmd = new SqlCommand("update tbl_cart set quantity=quantity+1 WHERE c_id = @cartpid", con))
        {
            cmd.Parameters.AddWithValue("@cartpid", cartpId);
            cmd.ExecuteNonQuery();
        }


        // Redirect back to the product page after deletings
        Response.Redirect("cart.aspx");
    }

    private void DeletecartItem(int cartId)
    {

        con.Open();
        using (SqlCommand cmd = new SqlCommand("DELETE FROM tbl_cart WHERE c_id = @cartid", con))
        {
            cmd.Parameters.AddWithValue("@cartid", cartId);
            cmd.ExecuteNonQuery();
        }


        // Redirect back to the product page after deletings
        Response.Redirect("cart.aspx");
    }




    protected void emtycart_Click(object sender, EventArgs e)
    {
        con.Open();
        String u_id = Session["u_id"].ToString();
        using (SqlCommand cmd = new SqlCommand("DELETE FROM tbl_cart WHERE u_id = @u_id", con))
        {
            cmd.Parameters.AddWithValue("@u_id", u_id);
            cmd.ExecuteNonQuery();
        }


        // Redirect back to the product page after deletings
        Response.Redirect("cart.aspx");
    }

    protected void checkout_Click(object sender, EventArgs e)
    {
        String chek = "checkout";
        Session["checkout"] = chek;
        Response.Redirect("checkout.aspx");
    }

    protected void contineshop_Click(object sender, EventArgs e)
    {
        Response.Redirect("shop.aspx");

    }
}