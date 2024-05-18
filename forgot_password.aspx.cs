using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class forgot_password : System.Web.UI.Page
{
    protected void btnverify_Click(object sender, EventArgs e)
    {

        String forgotemail = (String)Session["forgotemail"];
        String forgotpassword = txtpassword.Text;

        SHA256 sha256 = SHA256.Create();
        byte[] hashedBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(forgotpassword));
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < hashedBytes.Length; i++)
        {
            sb.Append(hashedBytes[i].ToString("x2"));
        }
        String hashedPassword = sb.ToString();
        String query = "update tbl_user set password='" + hashedPassword + "' where email='" + forgotemail + "'";
        String mycon = "Data Source=DESKTOP-L6GFUGE\\YASH;Initial Catalog=artandshopmns;Integrated Security=True";
        SqlConnection con = new SqlConnection(mycon);
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = query;
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
        Response.Redirect("login.aspx");
    }
}