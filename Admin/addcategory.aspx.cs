using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

public partial class Admin_addcategory : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=DESKTOP-L6GFUGE\\YASH;Initial Catalog=artandshopmns;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request.QueryString["catid"]))
        {
            int catid;
            if (int.TryParse(Request.QueryString["catid"], out catid))
            {
                Deletecategory(catid);
            }
        }

        con.Close();
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from tbl_category", con);
        cmd.ExecuteNonQuery();
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        viewcategory.DataSource = dt;
        viewcategory.DataBind();
        con.Close();
    }
    private Boolean checkcategory()
    {
        Boolean categoryavailable = false;
        String mycon = "Data Source=DESKTOP-L6GFUGE\\YASH;Initial Catalog=artandshopmns;Integrated Security=True";
        String myquery = "Select * from tbl_category where c_name='" + txtcategoryname.Text + "'";
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
            categoryavailable = true;

        }
        con.Close();

        return categoryavailable;
    }

    protected void btnaddcategory_Click(object sender, EventArgs e)
    {

        if (checkcategory() == true)
        {

            lblcategory.Text = "Your Enter Category Already Exists";
            txtcategoryname.Text = "";
            lblcategory.BackColor = System.Drawing.Color.IndianRed;

        }
        else
        {


            string category = txtcategoryname.Text;
            string currentDate = DateTime.Now.ToString("yyyy-MM-dd");

            String query = "insert into tbl_category (c_name, added_date) values('" + category + "', '"+ currentDate + "')";
            String mycon = "Data Source=DESKTOP-L6GFUGE\\YASH;Initial Catalog=artandshopmns;Integrated Security=True";
            SqlConnection con = new SqlConnection(mycon);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = query;
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            txtcategoryname.Text = "";
            Response.Redirect("addcategory.aspx");
        }

    }
    private void Deletecategory(int catid)
    {

        con.Open();
        using (SqlCommand cmd = new SqlCommand("DELETE FROM tbl_category WHERE cid = @catid", con))
        {
            cmd.Parameters.AddWithValue("@catid", catid);
            cmd.ExecuteNonQuery();
        }


        // Redirect back to the product page after deleting
        Response.Redirect("addcategory.aspx");
    }
}