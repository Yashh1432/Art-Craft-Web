using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    private Boolean checkemail()
    {
        Boolean emailavailable = false;
        String mycon = "Data Source=DESKTOP-L6GFUGE\\YASH;Initial Catalog=artandshopmns;Integrated Security=True";
        String myquery = "Select * from tbl_user where email='" + txtemail.Text + "'";
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
            emailavailable = true;

        }
        con.Close();

        return emailavailable;
    }



    protected void btnregister_Click(object sender, EventArgs e)
    {
        if (checkemail() == true)
        {

            lblemail.Text = "Your Email Already Registered with Us";
            txtemail.BackColor = System.Drawing.Color.PaleGreen;





        }
        else
        {

            String name = txtname.Text;
            String email = txtemail.Text;
            String password = txtpassword.Text;
            String contact = txtcontact.Text;

            string gender = "";

            if (radiomale.Checked)
            {
                gender = radiomale.Text.ToString();
            }
            if (radiofemale.Checked)
            {
                gender = radiofemale.Text.ToString();
            }
            if (radioother.Checked)
            {
                gender = radioother.Text.ToString();
            }

            Session["name"] = name;
            Session["Password"] = password;
            Session["contact"] = contact;
            Session["gender"] = gender;
            Session["email"] = email;



            Random random = new Random();
            int otp = random.Next(10000, 999999);
            string userotp = otp.ToString();

            Session["otp"] = userotp;
            String fromMail = "21bmiit144@gmail.com";
            String fromPassword = "jnen iocs veid agdz";
            //vwcu gfbq vuav xcil

            MailMessage message = new MailMessage();
            message.From = new MailAddress(fromMail);
            message.Subject = "ART AND CRAFT SHOP MANAGEMENT SYSTEM ";
            message.To.Add(new MailAddress(email));
            message.Body = "<html><body>Your OTP is " + userotp + "</body></html>";
            message.IsBodyHtml = true;

            var smtpClient = new SmtpClient("smtp.gmail.com")
            {
                Port = 587,
                Credentials = new NetworkCredential(fromMail, fromPassword),
                EnableSsl = true,
            };
            smtpClient.Send(message);
            Response.Redirect("registrationotp.aspx");


        }
    }

}

