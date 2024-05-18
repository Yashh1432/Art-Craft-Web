using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_changepassword : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["useremail"] == null)
        {
            Response.Redirect("login.aspx");
        }

    }
    protected void btnchange_Click(object sender, EventArgs e)
    {
        String pass = (String)Session["userpassword"];

        String usermail = (String)Session["useremail"];

        //New password convert into HASHED

        String newpass = txtnewpassword.Text;
        SHA256 sha256 = SHA256.Create();
        byte[] hashedBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(newpass));
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < hashedBytes.Length; i++)
        {
            sb.Append(hashedBytes[i].ToString("x2"));
        }
        String newPasswordtext = sb.ToString();


        //OLDPASSWORD CONVERT INTO HASHED

        StringBuilder s = new StringBuilder();
        byte[] hashedbytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(txtoldpassword.Text));
        for (int i = 0; i < hashedBytes.Length; i++)
        {
            s.Append(hashedbytes[i].ToString("x2"));
        }
        String oldPasswordtext = s.ToString();

        //NEW PASSWORD CONVERT INTO HASEGD

        StringBuilder sn = new StringBuilder();
        byte[] hashedbyteses = sha256.ComputeHash(Encoding.UTF8.GetBytes(pass));
        for (int i = 0; i < hashedbyteses.Length; i++)
        {
            sn.Append(hashedbyteses[i].ToString("x2"));
        }
        String oldpass = s.ToString();

        lblnew.Text = "Session Password:" + oldpass;
        Label1.Text = "Entered OLd PAssword" + oldPasswordtext;
        lblpass.Text = "Enterd New Passsword" + newPasswordtext;
        if (oldpass == oldPasswordtext)
        {
            String query = "update tbl_user set password='" + newPasswordtext + "' where email='" + usermail + "'";
            String mycon = "Data Source=DESKTOP-L6GFUGE\\YASH;Initial Catalog=project;Integrated Security=True";
            SqlConnection con = new SqlConnection(mycon);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = query;
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            Response.Redirect("Dashboard.aspx");




        }
        else
        {
            lblpass.Text = "Your Entered Password Is Worng!!!";

            txtoldpassword.BackColor = System.Drawing.Color.PaleGreen;
        }


    }
}