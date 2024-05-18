using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class profile : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=DESKTOP-L6GFUGE\\YASH; Initial Catalog=artandshopmns ;Integrated Security=True;");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["useremail"] == null)
        {
            Response.Redirect("login.aspx");
        }

        if (!IsPostBack)
        {

            LoadUserData();

        }
    }

    protected void LoadUserData()
    {
        con.Close();
        con.Open();
        String email = (String)Session["useremail"];

        // Use separate SqlDataReader instances for different queries
        SqlCommand selectUser = new SqlCommand("SELECT * FROM tbl_user WHERE email='" + email + "'", con);
        SqlDataReader userReader = selectUser.ExecuteReader();

        if (userReader.Read())
        {
            txtname.Text = userReader["name"].ToString();
            txtemail.Text = userReader["email"].ToString();
            txtcontact.Text = userReader["contact"].ToString();
            string gender = userReader["gender"].ToString();

            if (gender.Contains("Male"))
            {
                radiomale.Checked = true;
            }
            else if (gender.Contains("Female"))
            {
                radiofemale.Checked = true;
            }
            else if (gender.Contains("Other"))
            {
                radioother.Checked = true;
            }


            // Close the userReader after reading data
            // Close the stateReader after reading data
            // Close the statenameReader after reading data
        }

    }

    protected void btnupdate_Click(object sender, EventArgs e)
    {
        con.Close();
        con.Open();

        string gender = string.Empty;
        if (radiomale.Checked)
        {
            gender = "Male";
        }
        else if (radiofemale.Checked)
        {
            gender = "Female";
        }
        else if (radioother.Checked)
        {
            gender = "Other";
        }

        String email = (String)Session["useremail"];

        // Use parameterized query to avoid SQL injection
        SqlCommand updateCommand = new SqlCommand("UPDATE tbl_user SET name=@name, " +
            "contact=@contact, gender=@gender WHERE email=@email", con);

        // Add parameters
        updateCommand.Parameters.AddWithValue("@name", txtname.Text);
        updateCommand.Parameters.AddWithValue("@contact", txtcontact.Text);
        updateCommand.Parameters.AddWithValue("@gender", gender);

        updateCommand.Parameters.AddWithValue("@email", email);

        // Execute the update query
        updateCommand.ExecuteNonQuery();

        con.Close();
        LoadUserData();
        // Redirect or display a message after updating
        Response.Redirect("Default.aspx");
    }

}