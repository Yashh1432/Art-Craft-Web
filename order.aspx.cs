using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class order : System.Web.UI.Page
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





            con.Close();
            con.Open();
            String u_id = (String)Session["u_id"].ToString();
            SqlCommand cmd = new SqlCommand("SELECT * from tbl_order where u_id='" + u_id + "'", con);

            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                DataTable dt = new DataTable();
                dt.Load(reader);
                vieworderlist.DataSource = dt;
                vieworderlist.DataBind();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showToastdanget", "showToastdanget('Empty No Orders List !!!');", true);

            }

            con.Close();
        }
    }
}