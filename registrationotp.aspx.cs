using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class registrationotp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["otp"] == null)
        {
            Response.Redirect("registration.aspx");
        }
    }

    protected void btnverify_Click(object sender, EventArgs e)
    {
        String uname = (string)Session["name"];
        String contact = (string)Session["contact"];
        String email = (string)Session["email"];
        String password = (string)Session["password"];
        String gender = (string)Session["gender"];
        String otp = (string)Session["otp"];
        String userotp = txtotp.Text;


        SHA256 sha256 = SHA256.Create();
        byte[] hashedBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < hashedBytes.Length; i++)
        {
            sb.Append(hashedBytes[i].ToString("x2"));
        }

        String hashedPassword = sb.ToString();


        if (otp == userotp)
        {

            String query = "insert into tbl_user (name, email, password, contact, gender, role) values( '" + uname + "','" + email + "','" + hashedPassword + "','" + contact + "','" + gender + "',1 )";
            String mycon = "Data Source=DESKTOP-L6GFUGE\\YASH;Initial Catalog=artandshopmns;Integrated Security=True";
            SqlConnection con = new SqlConnection(mycon);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = query;
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            Response.Redirect("login.aspx");
        }
        else
        {
            Response.Write("<script>alert('OTP NOT MATCHED!!!!');</script>");
            Response.Write(otp);
        }
    }
   
}