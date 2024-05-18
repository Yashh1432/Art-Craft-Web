using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_updateproduct : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection("Data Source=DESKTOP-L6GFUGE\\YASH;Initial Catalog=artandshopmns;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            // Retrieve category ID from query string
            if (Request.QueryString["catid"] != null)
            {
                int categoryId;

                if (int.TryParse(Request.QueryString["catid"], out categoryId))
                {
                    // Load category details based on the category ID

                    LoadCategoryDetails(categoryId);
                }
                else
                {
                    // Handle invalid category ID
                }
            }
            else
            {
                // Handle missing category ID in query string
            }
        }
    }

    private void LoadCategoryDetails(int categoryId)
    {
        con.Close();
        con.Open();

        SqlCommand selectUser = new SqlCommand("select * from tbl_product where pid='" + categoryId + "'", con);
        SqlDataReader dr = selectUser.ExecuteReader();
        if (dr.Read())
        {
            string id = dr["pid"].ToString();
            Session["pid"] = id;
            txtproductname.Text = dr["pname"].ToString();
            txtdescription.Text = dr["description"].ToString();
            txtsize.Text = dr["size"].ToString();
            txtprice.Text = dr["price"].ToString();
            Dropdownbrand.Text = dr["brand"].ToString();
            Dropdownsubcategory.Text = dr["sc_name"].ToString();
            Dropdowncategory.Text = dr["c_name"].ToString();

            string imagePath = dr["img"].ToString();

            imgProduct.ImageUrl = "../UPLOADS/" + imagePath;

        }
    }


    protected void btnupdateproduct_Click(object sender, EventArgs e)
    {

        if (pimage.HasFiles)
        {

            try
            {
                String extension = Path.GetExtension(pimage.FileName);
                if (extension == ".jpg" || extension == ".jpeg" | extension == ".png")
                {
                    if (pimage.PostedFile.ContentLength <= 2100000)
                    {
                        String productname = txtproductname.Text;
                        String size = txtsize.Text;
                        String description = txtdescription.Text;
                        String price = txtprice.Text;


                        String image = Path.GetFileName(pimage.FileName);
                        pimage.SaveAs(Server.MapPath("../UPLOADS/") + image);
                        string cs = "Data Source=DESKTOP-L6GFUGE\\YASH;Initial Catalog=artandshopmns;Integrated Security=True";
                        SqlConnection conn = new SqlConnection(cs);
                        conn.Open();
                        String pid = (String)Session["pid"];

                        SqlCommand cmd = new SqlCommand("UPDATE tbl_product SET pname=@pname, size=@size, description=@description, price=@price, img=@image WHERE pid=@pid", conn);
                        cmd.Parameters.AddWithValue("@pname", txtproductname.Text);
                        cmd.Parameters.AddWithValue("@size", txtsize.Text);
                        cmd.Parameters.AddWithValue("@description", txtdescription.Text);
                        cmd.Parameters.AddWithValue("@price", txtprice.Text);

                        cmd.Parameters.AddWithValue("@image", pimage.FileName);
                        cmd.Parameters.AddWithValue("@pid", pid);


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
        else
        {
            string cs = "Data Source=DESKTOP-L6GFUGE\\YASH;Initial Catalog=artandshopmns;Integrated Security=True";
            SqlConnection conn = new SqlConnection(cs);
            conn.Open();
            String pid = (String)Session["pid"];
            lblerror.Text = pid;
            SqlCommand cmd = new SqlCommand("UPDATE tbl_product SET pname=@pname, size=@size, description=@description, price=@price WHERE pid=@pid", conn);
            cmd.Parameters.AddWithValue("@pname", txtproductname.Text);
            cmd.Parameters.AddWithValue("@size", txtsize.Text);
            cmd.Parameters.AddWithValue("@description", txtdescription.Text);
            cmd.Parameters.AddWithValue("@price", txtprice.Text);

            cmd.Parameters.AddWithValue("@pid", pid);
            int p = cmd.ExecuteNonQuery();
            if (p > 0)
            {

                Response.Redirect("addproduct.aspx");
            }
        }





    }
}