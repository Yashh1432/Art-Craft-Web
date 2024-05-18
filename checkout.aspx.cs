using System;
using System.Collections.Generic;
using Newtonsoft.Json;
using Razorpay.Api;
using System.Data.SqlClient;
using System.Data;

using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class checkout : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=DESKTOP-L6GFUGE\\YASH;Initial Catalog=artandshopmns;Integrated Security=True");
    private const string _key = "rzp_test_rF8hMmCt9Uffwr";
    private const string _secret = "O12fZghOKiuNvo5ELxGvo3Py";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["useremail"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            if (Session["checkout"] != null)
            {
                con.Open();
                String u_id = Session["u_id"].ToString();
                SqlCommand cmd = new SqlCommand("SELECT tbl_cart.c_id, tbl_cart.quantity, tbl_product.pid, tbl_product.pname, tbl_product.img, tbl_product.price FROM tbl_cart INNER JOIN tbl_product ON tbl_cart.p_id=tbl_product.pid where u_id='" + u_id + "'", con);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    DataTable dt = new DataTable();
                    dt.Load(reader);
                    viewcartlist.DataSource = dt;
                    viewcartlist.DataBind();
                    decimal totalAmount = dt.AsEnumerable().Sum(row => Convert.ToDecimal(row["price"]) * row.Field<int>("quantity"));
                    lbltotal.Text = string.Format("&#8377;{0}.00", totalAmount);
                    Session["orderamount"] = string.Format("{0}", totalAmount);
                }

                String email = (String)Session["useremail"];

                // Use separate SqlDataReader instances for different queries
                SqlCommand selectUser = new SqlCommand("SELECT * FROM tbl_user WHERE email='" + email + "'", con);
                SqlDataReader userReader = selectUser.ExecuteReader();

                if (userReader.Read())
                {
                    txtfname.Text = userReader["name"].ToString();
                    txtemail.Text = userReader["email"].ToString();
                    txtcontact.Text = userReader["contact"].ToString();
                }


                con.Close();
            }
            else
            {
                Response.Redirect("Default.aspx");
            }

        }
    }


    protected void btncheckout_Click(object sender, EventArgs e)
    {
        string pay_type = "";



        if (rdbCOD.Checked)
        {

            string inputAmount = (String)Session["orderamount"];
            decimal registrationAmount;

            if (Decimal.TryParse(inputAmount, out registrationAmount))
            {
                pay_type = rdbCOD.Text.ToString();
                DateTime now = DateTime.Now;

                // Format the date and time into a string
                string dateString = now.ToString("yyyyMMddHHmmss");

                // Generate a random number
                Random random = new Random();
                int randomNumber = random.Next(1000, 9999);

                // Combine the date string and the random number to create the order ID
                string orderId = dateString + randomNumber.ToString();
                Session["orderId"] = orderId;

                string profileName = txtfname.Text;
                string profileMobile = txtcontact.Text;
                string profileEmail = txtemail.Text;
                Session["payerfname"] = profileName;
                Session["payeremail"] = profileEmail;
                Session["payercontact"] = profileMobile;
                Session["deliveryaddress"] = txtaddress.Text;
                //Session["payerlname"] = txtlname.Text;
                Session["pay_type"] = pay_type;

                Response.Redirect("done.aspx");
            }
            else
            {
                Console.WriteLine("Invalid input. Please enter a valid decimal number.");
            }



        }
        else
        {
            pay_type = rdbNet.Text.ToString();
            string inputAmount = (String)Session["orderamount"];
            decimal registrationAmount;

            if (Decimal.TryParse(inputAmount, out registrationAmount))
            {


                decimal amountinSubunits = registrationAmount * 100;
                string currency = "INR";
                string name = "ThE ArTiStS";
                string description = "artist Order";
                string imageLogo = "";
                string profileName = txtfname.Text;
                string profileMobile = txtcontact.Text;
                string profileEmail = txtemail.Text;
                Session["payerfname"] = profileName;
                Session["payeremail"] = profileEmail;
                Session["payercontact"] = profileMobile;
                Session["deliveryaddress"] = txtaddress.Text;
                //Session["payerlname"] = txtlname.Text;
                Session["pay_type"] = pay_type;
                Dictionary<string, string> notes = new Dictionary<string, string>()
            {
                { "note 1", "this is a payment note" }, { "note 2", "here another note, you can add max 15 notes" }
            };

                string orderId = CreateOrder(amountinSubunits, currency, notes);
                Session["orderId"]=orderId;
                string jsFunction = "OpenPaymentWindow('" + _key + "', '" + amountinSubunits + "', '" + currency + "', '" + name + "', '" + description + "', '" + imageLogo + "', '" + orderId + "', '" + profileName + "', '" + profileEmail + "', '" + profileMobile + "', '" + JsonConvert.SerializeObject(notes) + "');";
                ClientScript.RegisterStartupScript(this.GetType(), "OpenPaymentWindow", jsFunction, true);
            }
            else
            {
                // Handle the case where the user input is not a valid decimal
                // For example:
                Console.WriteLine("Invalid input. Please enter a valid decimal number.");
            }

        }


    }
    private string CreateOrder(decimal amountInSubunits, string currency, Dictionary<string, string> notes)
    {
        try
        {
            int paymentCapture = 1;

            RazorpayClient client = new RazorpayClient(_key, _secret);
            Dictionary<string, object> options = new Dictionary<string, object>();
            options.Add("amount", amountInSubunits);
            options.Add("currency", currency);
            options.Add("payment_capture", paymentCapture);
            options.Add("notes", notes);

            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls12;
            System.Net.ServicePointManager.Expect100Continue = false;

            Order orderResponse = client.Order.Create(options);
            var orderId = orderResponse.Attributes["id"].ToString();
            return orderId;
        }
        catch (Exception e)
        {
            return e.Message;
        }
    }
}