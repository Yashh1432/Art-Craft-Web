using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_addsubcategory : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection("Data Source=DESKTOP-L6GFUGE\\YASH;Initial Catalog=artandshopmns;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (!IsPostBack)
        {
            CascadeDropDowncategory();
        }

        retrive();
    }



  
    protected void retrive() {
        if (!string.IsNullOrEmpty(Request.QueryString["subcatid"]))
        {
            int subcatid;
            if (int.TryParse(Request.QueryString["subcatid"], out subcatid))
            {
                Deletesubcategory(subcatid);
            }
        }

        con.Close();
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from tbl_subcategory", con);
        cmd.ExecuteNonQuery();
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        viewsubcategory.DataSource = dt;
        viewsubcategory.DataBind();
        con.Close();
    }



    protected void CascadeDropDowncategory()
    {
        String cs = "Data Source=DESKTOP-L6GFUGE\\YASH;Initial Catalog=artandshopmns;Integrated Security=True";
        SqlConnection conn = new SqlConnection(cs);
        conn.Open();
        SqlCommand cmd = new SqlCommand("select * from tbl_category", conn);
        cmd.CommandType = CommandType.Text;
        DropDowncategory.DataSource = cmd.ExecuteReader();
        DropDowncategory.DataTextField = "c_name";
        DropDowncategory.DataValueField = "cid";
        DropDowncategory.DataBind();
        DropDowncategory.Items.Insert(0, new ListItem("-- Select Category --", "0"));
    }



    protected void btnaddcategory_Click(object sender, EventArgs e)
    {

        try
        {
           

                String cs = "Data Source=DESKTOP-L6GFUGE\\YASH;Initial Catalog=artandshopmns;Integrated Security=True";
                SqlConnection conn = new SqlConnection(cs);
                string currentDate = DateTime.Now.ToString("yyyy-MM-dd");
                string subcategory = txtsubcategoryname.Text;
                String category = DropDowncategory.SelectedItem.Text.ToString();
                String query = "insert into tbl_subcategory (sc_name, c_name, added_date) values('" + subcategory + "','" + category + "','" + currentDate + "')";
                conn.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = query;
                cmd.Connection = conn;
                cmd.ExecuteNonQuery();
                txtsubcategoryname.Text = "";
            retrive();
        }
        catch (Exception ex)
        {
            // Handle the exception, e.g., log the error and inform the user
            lblsubcategory.Text = "An error occurred: " + ex.Message;
            lblsubcategory.BackColor = System.Drawing.Color.Red;
        }

    }

    private void Deletesubcategory(int subcatid)
    {

        try
        {
            using (SqlCommand cmd = new SqlCommand("DELETE FROM tbl_subcategory WHERE scid = @subcatid", con))
            {
                cmd.Parameters.AddWithValue("@subcatid", subcatid);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            Response.Redirect("addsubcategory.aspx");
        }
        catch (Exception ex)
        {
            Response.Write("An error occurred: " + ex.Message);
        }
    }




}