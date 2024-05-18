using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=DESKTOP-L6GFUGE\\YASH; Initial Catalog=artandshopmns ;Integrated Security=True;");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.Cookies["txtusername"] != null && Request.Cookies["txtpassword"] != null)
            {
                txtusername.Text = Request.Cookies["txtusername"].Value;
                txtpassword.Attributes["value"] = Request.Cookies["txtpassword"].Value;

            }

        }

    }

    protected void btnlogin_Click(object sender, EventArgs e)
    {
        con.Close();
        con.Open();
        SqlCommand selectUser = new SqlCommand("SELECT * FROM tbl_user WHERE email = @Email", con);
        selectUser.Parameters.AddWithValue("@Email", txtusername.Text.Trim());

        SqlDataReader dr = selectUser.ExecuteReader();
        if (dr.Read())
        {
            String password = txtpassword.Text;
            SHA256 sha256 = SHA256.Create();
            byte[] hashedBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < hashedBytes.Length; i++)
            {
                sb.Append(hashedBytes[i].ToString("x2"));
            }
            String hashedPassword = sb.ToString();

            if (dr["password"].ToString().Trim().Equals(hashedPassword.ToString().Trim()))
            {

                //Password matches
                if (chekremember.Checked)
                {
                    // Remember me functionality
                    Response.Cookies["txtusername"].Value = txtusername.Text;
                    Response.Cookies["txtpassword"].Value = txtpassword.Text;
                    Response.Cookies["txtusername"].Expires = DateTime.Now.AddMinutes(1);
                    Response.Cookies["txtpassword"].Expires = DateTime.Now.AddMinutes(1);
                }
                else
                {
                    // Clear cookies
                    Response.Cookies["txtusername"].Expires = DateTime.Now.AddMinutes(-1);
                    Response.Cookies["txtpassword"].Expires = DateTime.Now.AddMinutes(-1);
                }

                Session["useremail"] = txtusername.Text;
                Session["userpassword"] = hashedPassword;
                Session["profilename"] = dr["name"].ToString();
                Session["u_id"] = dr["id"].ToString();

                //int role = (int)dr["role"];
           
                if (dr["role"].ToString() =="1")
                {
                    // Redirect to default page for regular users
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    // Redirect to admin dashboard for admin users
                    Response.Redirect("Admin/Dashboard.aspx");
                }
            }
            else
            {
                // Password is incorrect
                lblemail.Text = "Your Password is Incorrect !!!";
                txtpassword.BackColor = System.Drawing.Color.PaleGreen;
            }
        }
        else
        {
            // Email not found in the database
            lblemail.Text = "Your Email is not registered with us.";
            txtusername.BackColor = System.Drawing.Color.PaleGreen;
        }
    }


}