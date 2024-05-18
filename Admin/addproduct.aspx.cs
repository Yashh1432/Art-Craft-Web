using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

public partial class Admin_addproduct : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=DESKTOP-L6GFUGE\\YASH;Initial Catalog=artandshopmns;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (!IsPostBack)
            {
                CascadeDropDowncategory();
                CascadeDropBrand();
                retrive();
            }
        }
    }

    protected void retrive()
    {
        string statusIdStr = Request.QueryString["statusid"];
        if (!string.IsNullOrEmpty(statusIdStr))
        {
            int statusId;
            if (int.TryParse(statusIdStr, out statusId))
            {
                UpdateStatus(statusId);
            }
        }


        if (!string.IsNullOrEmpty(Request.QueryString["deleteid"]))
        {
            int productId;
            if (int.TryParse(Request.QueryString["deleteid"], out productId))
            {

                DeleteProduct(productId);
            }
        }



        con.Close();
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from tbl_product", con);
        cmd.ExecuteNonQuery();
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        viewproduct.DataSource = dt;
        viewproduct.DataBind();
        con.Close();
    }
    protected void CascadeDropDowncategory()
    {
        String cs = "Data Source=DESKTOP-L6GFUGE\\YASH;Initial Catalog=artandshopmns;Integrated Security=True";
        SqlConnection conn = new SqlConnection(cs);
        conn.Open();
        SqlCommand cmd = new SqlCommand("select * from tbl_category", conn);
        cmd.CommandType = CommandType.Text;
        Dropdowncategory.DataSource = cmd.ExecuteReader();
        Dropdowncategory.DataTextField = "c_name";
        Dropdowncategory.DataValueField = "cid";
        Dropdowncategory.DataBind();
        Dropdowncategory.Items.Insert(0, new ListItem("-- Select Category --", "0"));
    }

    protected void Dropdownsubcategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        String StateID = Dropdowncategory.SelectedItem.Text.ToString();

        String cs = "Data Source=DESKTOP-L6GFUGE\\YASH;Initial Catalog=artandshopmns;Integrated Security=True";
        SqlConnection conn = new SqlConnection(cs);
        conn.Open();
        SqlCommand cmd = new SqlCommand("select * from tbl_subcategory where c_name = '" + StateID + "'", conn);
        cmd.CommandType = CommandType.Text;
        Dropdownsubcategory.DataSource = cmd.ExecuteReader();
        Dropdownsubcategory.DataTextField = "sc_name";
        Dropdownsubcategory.DataValueField = "scid";
        Dropdownsubcategory.DataBind();
        Dropdownsubcategory.Items.Insert(0, new ListItem("-- Select Sub-category --", "0"));
    }

    protected void CascadeDropBrand()
    {
        String cs = "Data Source=DESKTOP-L6GFUGE\\YASH;Initial Catalog=artandshopmns;Integrated Security=True";
        SqlConnection conn = new SqlConnection(cs);
        conn.Open();
        SqlCommand cmd = new SqlCommand("select * from tbl_brand", conn);
        cmd.CommandType = CommandType.Text;
        Dropdownbrand.DataSource = cmd.ExecuteReader();
        Dropdownbrand.DataTextField = "bname";
        Dropdownbrand.DataValueField = "bid";
        Dropdownbrand.DataBind();
        Dropdownbrand.Items.Insert(0, new ListItem("---Select Brand---", "0"));
    }


    private bool CheckProductExists(string productName)
    {
        bool productExists = false;
        string connectionString = "Data Source=DESKTOP-L6GFUGE\\YASH;Initial Catalog=artandshopmns;Integrated Security=True";
        string query = "SELECT COUNT(*) FROM tbl_product WHERE pname = @ProductName";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@ProductName", productName);
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

    protected void btnaddproduct_Click(object sender, EventArgs e)
    {
        string productName = txtproductname.Text;

        if (CheckProductExists(productName))
        {
            lblerror.Text = "Your Product Already Exists In System!!";
            lblerror.BackColor = System.Drawing.Color.PaleGreen;
        }
        else
        {

            if (pimage.HasFiles)
            {

                try
                {
                    String extension = Path.GetExtension(pimage.FileName);
                    if (extension == ".jpg" || extension == ".jpeg" || extension == ".png")
                    {
                        if (pimage.PostedFile.ContentLength <= 2100000)
                        {
                            String productname = txtproductname.Text;
                            String description = txtdescription.Text;
                            String price = txtprice.Text;
                            String size = txtsize.Text;

                            String category = Dropdowncategory.SelectedItem.Text.ToString();
                            String subcategory = Dropdownsubcategory.SelectedItem.Text.ToString();
                            String Brand = Dropdownbrand.SelectedItem.Text.ToString();

                            String image = Path.GetFileName(pimage.FileName);
                            pimage.SaveAs(Server.MapPath("../UPLOADS/") + image);
                            string cs = "Data Source=DESKTOP-L6GFUGE\\YASH;Initial Catalog=artandshopmns;Integrated Security=True";
                            SqlConnection conn = new SqlConnection(cs);
                            conn.Open();
                            SqlCommand cmd = new SqlCommand("INSERT INTO tbl_product VALUES(@ProductName, @Description, @Price, @Size, @Category, @SubCategory, @Brand, @Image, 0)", conn);
                            cmd.Parameters.AddWithValue("@ProductName", productname);
                            cmd.Parameters.AddWithValue("@Description", description);
                            cmd.Parameters.AddWithValue("@Price", price);
                            cmd.Parameters.AddWithValue("@Size", size);     
                            cmd.Parameters.AddWithValue("@Category", category);
                            cmd.Parameters.AddWithValue("@SubCategory", subcategory);
                            cmd.Parameters.AddWithValue("@Brand", Brand);
                            cmd.Parameters.AddWithValue("@Image", pimage.FileName);

                            int p = cmd.ExecuteNonQuery();
                            if (p > 0)
                            {

                                Response.Redirect("addproduct.aspx");
                            }
                        }
                        else
                        {
                            lblerror.Text = "File has to be less than 2MB ";
                            lblerror.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                    else
                    {
                        lblerror.Text = "Only JPG , PNG , JPEG Files Are Supported!!! ";
                        lblerror.ForeColor = System.Drawing.Color.Red;
                    }

                }
                catch (Exception ex)
                {
                    lblerror.Text = "Product Image is Not Upload Sucessfully!!" + ex.Message;
                }
            }

            retrive();

        }
    }



    private void UpdateStatus(int productId)
    {
        // Connect to your database and execute an UPDATE command
        string query = "UPDATE tbl_product SET status = CASE WHEN status = 1 THEN 0 ELSE 1 END WHERE pid = @ProductId";

        using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-L6GFUGE\\YASH;Initial Catalog=artandshopmns;Integrated Security=True"))
        {
            using (SqlCommand command = new SqlCommand(query, con))
            {
                command.Parameters.AddWithValue("@ProductId", productId);

                try
                {
                    con.Open();
                    int rowsAffected = command.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        // The status was updated successfully. You can redirect the user to the same page to refresh the data.
                        Response.Redirect("addproduct.aspx");
                    }
                }
                catch (Exception ex)
                {
                    // Handle the exception (e.g., log the error)
                }
            }
        }
    }


    private void DeleteProduct(int productId)
    {

        con.Open();
        using (SqlCommand cmd = new SqlCommand("DELETE FROM tbl_product WHERE pid = @ProductId", con))
        {
            cmd.Parameters.AddWithValue("@ProductId", productId);
            cmd.ExecuteNonQuery();
        }


        // Redirect back to the product page after deleting
        Response.Redirect("addproduct.aspx");
    }
}