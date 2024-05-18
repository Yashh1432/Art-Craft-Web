using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_addbrandaspx : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=DESKTOP-L6GFUGE\\YASH;Initial Catalog=artandshopmns;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["brandid"]))
            {
                int brandid;
                if (int.TryParse(Request.QueryString["brandid"], out brandid))
                {
                    Deletebrand(brandid);
                }
            }
            con.Close();
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from tbl_brand", con);
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            viewbrand.DataSource = dt;
            viewbrand.DataBind();
            con.Close();
        }
    }




    private Boolean checkbrand()
    {
        Boolean brandavailable = false;
        String mycon = "Data Source=DESKTOP-L6GFUGE\\YASH;Initial Catalog=artandshopmns;Integrated Security=True";
        String myquery = "Select * from tbl_brand where bname='" + txtbrandname.Text + "'";
        SqlConnection con = new SqlConnection(mycon);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = myquery;
        cmd.Connection = con;
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            brandavailable = true;

        }
        con.Close();

        return brandavailable;
    }

    protected void btnaddbrand_Click(object sender, EventArgs e)
    {
        if (checkbrand() == true)
        {

            branderror.Text = "Your Enter Brand Already Exists";
            txtbrandname.Text = "";
            branderror.BackColor = System.Drawing.Color.IndianRed;

        }
        else
        {

            string currentDate = DateTime.Now.ToString("yyyy-MM-dd");
            string brand = txtbrandname.Text;
            string query = "INSERT INTO tbl_brand (bname, added_date) VALUES (@brand, @currentDate)";

            string mycon = "Data Source=DESKTOP-L6GFUGE\\YASH;Initial Catalog=artandshopmns;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(mycon))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@brand", brand);
                    command.Parameters.AddWithValue("@currentDate", currentDate);

                    connection.Open();
                    int rowsAffected = command.ExecuteNonQuery();
                    connection.Close();

                    if (rowsAffected > 0)
                    {
                        // Set the message
                        brandsucess.Text = "Brand added successfully!";
                        txtbrandname.Text = "";

                        brandsucess.BackColor = System.Drawing.Color.Green;
                        Response.Redirect("addbrand.aspx");
                    }
                    else
                    {
                        // Set the error message
                        brandsucess.Text = "Failed to add brand!";
                        txtbrandname.Text = "";

                        brandsucess.BackColor = System.Drawing.Color.IndianRed;
                        Response.Redirect("addbrand.aspx");

                    }
                }
            }




        }
    }
    private void Deletebrand(int brandid)
    {
        try
        {
            using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-L6GFUGE\\YASH;Initial Catalog=artandshopmns;Integrated Security=True"))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("DELETE FROM tbl_brand WHERE bid = @brandid", con);
                cmd.Parameters.AddWithValue("@brandid", brandid);
                cmd.ExecuteNonQuery();

                con.Close();
            }
        }
        catch (Exception ex)
        {
            throw new Exception("Error deleting brand: " + ex.Message);
        }
    }
}