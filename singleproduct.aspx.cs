using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class singleproduct : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=DESKTOP-L6GFUGE\\YASH;Initial Catalog=artandshopmns;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {


            // Retrieve category ID from query string
            if (Request.QueryString["id"] != null)
            {
                int productId;

                if (int.TryParse(Request.QueryString["id"], out productId))
                {
                    // Load category details based on the category ID

                    LoadCategoryDetails(productId);

                }
                else
                {

                }
            }
            else
            {
                // Handle missing category ID in query string
                Response.Redirect("Default.aspx");
            }
        }
    }

    private void LoadCategoryDetails(int productId)
    {
        con.Close();
        con.Open();

        SqlCommand selectUser = new SqlCommand("select * from tbl_product where pid='" + productId + "'", con);
        SqlDataReader dr = selectUser.ExecuteReader();
        if (dr.Read())
        {
            //string id = dr["p_id"].ToString();
            //Session["pid"] = id;
            txtpname.Text = dr["pname"].ToString();
            txtdescription.Text = dr["description"].ToString();
            //txtmodel.Text = dr["model_no"].ToString();
            txtprice.Text = dr["price"].ToString();
            txtbrand.Text = dr["brand"].ToString();
            //Dropdownsubcategory.Text = dr["subcategory"].ToString();
            //category.Text = dr["category"].ToString();

            string imagePath = dr["img"].ToString();

            imgProduct.ImageUrl = "../UPLOADS/" + imagePath;

        }
    }

    private bool CheckProductCart(int productId)
    {
        bool productCart = false;
        String u_id = (String)Session["u_id"].ToString();
        string connectionString = "Data Source=DESKTOP-L6GFUGE\\YASH;Initial Catalog=artandshopmns;Integrated Security=True";
        string query = "SELECT COUNT(*) FROM tbl_cart WHERE p_id = @ProductName and u_id=@userid";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@ProductName", productId);
                command.Parameters.AddWithValue("@userid", u_id);
                connection.Open();

                int count = Convert.ToInt32(command.ExecuteScalar());
                if (count > 0)
                {
                    productCart = true;
                }
            }
        }

        return productCart;
    }


    protected void btnAddToCart_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "showToastdanget", "showToastdanget('Please login to add items to cart.');", true);

        if (Session["u_id"] != null)
        {
            // User is not logged in, show a message to login
            Response.Write("<script>alert('Hello');showToast('Tested')</script>");
            ScriptManager.RegisterStartupScript(this, GetType(), "showToastdanget", "showToastdanget('Please login to add items to cart.');", true);



            if (Request.QueryString["id"] != null)
            {
                int productId;

                if (int.TryParse(Request.QueryString["id"], out productId))
                {
                    if (CheckProductCart(productId))
                    {
                        con.Open();
                        String quantity = txtQuantity.Text;
                        SqlCommand cmd = new SqlCommand("update tbl_cart set quantity=quantity+'" + quantity + "' where p_id='" + productId + "'", con);
                        int i = cmd.ExecuteNonQuery();
                        con.Close();
                        if (i > 0)
                        {
                            ReloadPage();
                            ScriptManager.RegisterStartupScript(this, GetType(), "showToast", "showToast('Product add to Cart successfully');", true);
                        }
                    }
                    else
                    {
                        con.Close();
                        con.Open();
                        String u_id = (String)Session["u_id"].ToString();

                        String quanity = txtQuantity.Text;
                        SqlCommand cmd = new SqlCommand("insert into tbl_cart (p_id, u_id, quantity) values ('" + productId + "','" + u_id + "','" + quanity + "')", con);
                        int i = cmd.ExecuteNonQuery();
                        if (i > 0)
                        {
                            ReloadPage();
                            Response.Write("<script> alert('Item added to cart!') </script>");
                            ScriptManager.RegisterStartupScript(this, GetType(), "showToast", "showToast('Product add to Cart successfully!');", true);
                        }
                        con.Close();
                    }
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showToastdanget", "showToastdanget('SOmething Wents Wrong!');", true);
            }
        }
    }

    private void ReloadPage()
    {
        Response.Redirect(Request.Url.AbsoluteUri);
    }

    protected void wishlist_Click(object sender, EventArgs e)
    {
        if (Session["useremail"] == null)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showToastdanget", "showToastdanget('Login please !!!');", true);
            return;
        }
        else
        {

            if (Request.QueryString["id"] != null)
            {
                int productId;

                if (int.TryParse(Request.QueryString["id"], out productId))
                {
                    if (CheckProductExists(productId))
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showToastdanget", "showToastdanget('Already added wishlist');", true);
                    }
                    else
                    {
                        con.Close();
                        con.Open();
                        String u_id = (String)Session["u_id"].ToString();
                        SqlCommand cmd = new SqlCommand("insert into tbl_wishlist (p_id, u_id) values ('" + productId + "','" + u_id + "')", con);
                        int i = cmd.ExecuteNonQuery();
                        if (i > 0)
                        {
                            ScriptManager.RegisterStartupScript(this, GetType(), "showToast", "showToast('Product add to wishlist successfully!');", true);
                        }
                        con.Close();

                    }
                }
            }
            else
            {

            }




        }
    }
    private bool CheckProductExists(int productId)
    {
        bool productExists = false;
        String u_id = (String)Session["u_id"].ToString();
        string connectionString = "Data Source=DESKTOP-L6GFUGE\\YASH;Initial Catalog=artandshopmns;Integrated Security=True";
        string query = "SELECT COUNT(*) FROM tbl_wishlist WHERE p_id = @ProductName and u_id=@userid";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@ProductName", productId);
                command.Parameters.AddWithValue("@userid", u_id);
                connection.Open();

                int count = Convert.ToInt32(command.ExecuteScalar());
                if (count > 0)
                {
                    productExists = true;
                }
            }
        }

        return productExists;
    }

    protected void btnverify_Click(object sender, EventArgs e)
    {

    }
}