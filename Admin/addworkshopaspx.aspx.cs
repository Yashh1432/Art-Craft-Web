using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_addworkshopaspx : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=DESKTOP-L6GFUGE\\YASH;Initial Catalog=artandshopmns;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request.QueryString["wid"]))
        {
            int wid;
            if (int.TryParse(Request.QueryString["wid"], out wid))
            {
                Deletecategory(wid);
            }
        }

        con.Close();
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from tbl_workshop", con);
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
        String myquery = "Select * from tbl_workshop where wname='" + txtname.Text + "'";
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

    protected void btnaddworkshop_Click(object sender, EventArgs e)
    {

        if (checkcategory() == true)
        {

            workshoperror.Text = "Your Enter Name is Already Exists";
            txtname.Text = "";
            workshoperror.BackColor = System.Drawing.Color.IndianRed;

        }
        else
        {


            string wname = txtname.Text;
            string link = txtlink.Text;
            string description = txtdescription.Text;
            string mode = txtmode.Text;

            if (link.Contains("youtube.com"))
            {
                link = link.Substring(link.IndexOf("v=") + 2);
                if (link.Contains("&"))
                {
                    link = link.Substring(0, link.IndexOf("&"));
                }
            }
            else if (link.Contains("youtu.be"))
            {
                link = link.Substring(link.LastIndexOf("/") + 1);
            }
            else
            {
                workshoperror.Text = "Invaild Link !!";
                return;
            }

            string currentDate = DateTime.Now.ToString("yyyy-MM-dd");

            String query = "insert into tbl_workshop (wname, description, link, mode, added_date) values('" + wname + "','" + link + "','" + description + "','" + mode + "', '" + currentDate + "')";
            String mycon = "Data Source=DESKTOP-L6GFUGE\\YASH;Initial Catalog=artandshopmns;Integrated Security=True";
            SqlConnection con = new SqlConnection(mycon);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = query;
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            txtname.Text = "";
            Response.Redirect("addworkshopaspx.aspx");
        }

    }
    private void Deletecategory(int wid)
    {

        con.Open();
        using (SqlCommand cmd = new SqlCommand("DELETE FROM tbl_workshop WHERE wid = @wid", con))
        {
            cmd.Parameters.AddWithValue("@wid", wid);
            cmd.ExecuteNonQuery();
        }


        // Redirect back to the product page after deleting
        Response.Redirect("addworkshopaspx.aspx");
    }
}