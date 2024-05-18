using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class client : System.Web.UI.MasterPage
{
    protected int cartItemCount = 0;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["useremail"] != null)
        {
            // User is authenticated, count the number of products in the cart
            cartItemCount = GetCartItemCount();
        }
        else
        {
            // User is not authenticated, set cart item count to zero
            cartItemCount = 0;
        }

    }

    protected int GetCartItemCount()
    {
        int itemCount = 0;

        // Connect to the database and fetch the cart item count
        using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-L6GFUGE\\YASH;Initial Catalog=artandshopmns;Integrated Security=True"))
        {
            con.Open();
            string userId = HttpContext.Current.Session["u_id"].ToString();
            SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM tbl_cart WHERE u_id = @UserId", con);
            cmd.Parameters.AddWithValue("@UserId", userId);
            itemCount = Convert.ToInt32(cmd.ExecuteScalar());
        }

        return itemCount;
    }

        

}
