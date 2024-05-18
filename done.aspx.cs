using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading.Tasks;
using Razorpay.Api;
using System.Text;
using System.Net.Http;

public partial class done : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=DESKTOP-L6GFUGE\\YASH;Initial Catalog=artandshopmns;Integrated Security=True");
    protected async void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            binddata();
            String pay_type = Session["pay_type"].ToString();
            if (pay_type == "Cash On Delivery")
            {
                String orderId = (String)Session["orderId"].ToString();

                String amount = Session["orderamount"].ToString();
                String profileFName = Session["payerfname"].ToString();
                ////String profileLName = Session["payerlname"].ToString();
                String profileEmail = Session["payeremail"].ToString();
                String profileMobile = Session["payercontact"].ToString();
                String deliveryaddress = Session["deliveryaddress"].ToString();

                String u_id = Session["u_id"].ToString();
                String order_status = "Pendding";

                lbl1.Text = "Payment type :" + pay_type;
                Label3.Text = "Order id :" + orderId;

                Label4.Text = "profile name :" + profileFName + " :: amount :: " + amount + "::: profile email :" + profileEmail + "::: contact :" + profileMobile + "::delvery: " + deliveryaddress;


                try
                {

                    lbl1.Text = "Payment type :" + pay_type;
                    Label3.Text = "Order id :" + orderId;

                    Label4.Text = "profile name :" + profileFName + " :: amount :: " + amount + "::: profile email :" + profileEmail + "::: contact :" + profileMobile + "::delvery: " + deliveryaddress;

                    con.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO tbl_order (order_id, fname, email, contact, address, amount, u_id, pay_type, order_status) VALUES (@order_id, @fname, @email, @contact, @address, @amount, @u_id, @pay_type, @order_status)", con);
                    cmd.Parameters.AddWithValue("@order_id", orderId);

                    cmd.Parameters.AddWithValue("@fname", profileFName);
                    //cmd.Parameters.AddWithValue("@lname", profileLName);
                    cmd.Parameters.AddWithValue("@email", profileEmail);
                    cmd.Parameters.AddWithValue("@contact", profileMobile);
                    cmd.Parameters.AddWithValue("@address", deliveryaddress);
                    cmd.Parameters.AddWithValue("@amount", amount);
                    cmd.Parameters.AddWithValue("@u_id", u_id);
                    cmd.Parameters.AddWithValue("@pay_type", pay_type);
                    cmd.Parameters.AddWithValue("@order_status", order_status);

                    cmd.ExecuteNonQuery();


                    lbl1.Text = "Oder is done";


                    lbl1.Text = "Payment type :" + pay_type;
                    Label3.Text = "Order id :" + orderId;

                    Label4.Text = "profile name :" + profileFName + " :: amount :: " + amount +  "::: profile email :" + profileEmail + "::: contact :" + profileMobile + "::delvery: " + deliveryaddress;



                    // Insert each item into the orderitem table
                    foreach (RepeaterItem item in viewcartlist.Items)
                    {

                        int p_id = Convert.ToInt32(((Label)item.FindControl("p_idLabel")).Text);
                     
                        int quantity = Convert.ToInt32(((Label)item.FindControl("quantityLabel")).Text);


                        SqlCommand cmd2 = new SqlCommand("INSERT INTO tbl_order_item (order_id, p_id, quantity, u_id) VALUES (@order_id, @p_id, @quantity, @u_id)", con);
                        cmd2.Parameters.AddWithValue("@order_id", orderId);
                        cmd2.Parameters.AddWithValue("@p_id", p_id);
              
                        cmd2.Parameters.AddWithValue("@quantity", quantity);
                        cmd2.Parameters.AddWithValue("@u_id", u_id);

                        cmd2.ExecuteNonQuery();

                    }



                    Label4.Text = "Stock complted";





                    // Remove the items from the cart table
                    SqlCommand cmd3 = new SqlCommand("DELETE FROM tbl_cart WHERE u_id = @u_id", con);
                    cmd3.Parameters.AddWithValue("@u_id", u_id);
                    cmd3.ExecuteNonQuery();


                    String token = await GetAuthTokenAsync();

                    var response = await CreateOrderAsync(token , orderId ,  profileFName , deliveryaddress , profileEmail , profileMobile , "COD");



                    con.Close();
                    String bill = "genrate";
                    Session["bill"] = bill;
                    Response.Redirect("bill.aspx");

                }
                catch (Exception ex)
                {
                    // Handle the exception appropriately, for example:
                    Response.Write("An error occurred while inserting data into the database: " + ex.Message);
                }
                finally
                {

                }



            }
            else
            {

                String orderId = Request.QueryString["orderId"];
                String payId = Request.QueryString["paymentId"];
                String amount = Session["orderamount"].ToString();
                String profileFName = Session["payerfname"].ToString();
                //String profileLName = Session["payerlname"].ToString();
                String profileEmail = Session["payeremail"].ToString();
                String profileMobile = Session["payercontact"].ToString();
                String deliveryaddress = Session["deliveryaddress"].ToString();
                String pay_type1 = Session["pay_type"].ToString();
                String u_id = Session["u_id"].ToString();
                String order_status = "Completed";
                try
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO tbl_order (order_id, pay_id, fname, email, contact, address, amount, u_id, pay_type, order_status) VALUES (@order_id, @pay_id, @fname, @email, @contact, @address, @amount, @u_id, @pay_type, @order_status)", con);
                    cmd.Parameters.AddWithValue("@order_id", orderId);
                    cmd.Parameters.AddWithValue("@pay_id", payId);
                    cmd.Parameters.AddWithValue("@fname", profileFName);
                    //cmd.Parameters.AddWithValue("@lname", profileLName
                    cmd.Parameters.AddWithValue("@email", profileEmail);
                    cmd.Parameters.AddWithValue("@contact", profileMobile);
                    cmd.Parameters.AddWithValue("@address", deliveryaddress);
                    cmd.Parameters.AddWithValue("@amount", amount);
                    cmd.Parameters.AddWithValue("@u_id", u_id);
                    cmd.Parameters.AddWithValue("@pay_type", pay_type1);
                    cmd.Parameters.AddWithValue("@order_status", order_status);

                    cmd.ExecuteNonQuery();


                    lbl1.Text = "Order is done";

                    // Insert each item into the orderitem table
                    foreach (RepeaterItem item in viewcartlist.Items)
                    {

                        int p_id = Convert.ToInt32(((Label)item.FindControl("p_idLabel")).Text);
                
                        int quantity = Convert.ToInt32(((Label)item.FindControl("quantityLabel")).Text);


                        SqlCommand cmd2 = new SqlCommand("INSERT INTO tbl_order_item (order_id, p_id,  quantity, u_id) VALUES (@order_id, @p_id, @quantity, @u_id)", con);
                        cmd2.Parameters.AddWithValue("@order_id", orderId);
                        cmd2.Parameters.AddWithValue("@p_id", p_id);
                       
                        cmd2.Parameters.AddWithValue("@quantity", quantity);
                        cmd2.Parameters.AddWithValue("@u_id", u_id);

                        cmd2.ExecuteNonQuery();

                    }


                    foreach (RepeaterItem item in viewcartlist.Items)
                    {
                        Label2.Text = "stock  Is Doen";
                        int p_id = Convert.ToInt32(((Label)item.FindControl("p_idLabel")).Text);
                       
                        int quantity = Convert.ToInt32(((Label)item.FindControl("quantityLabel")).Text);
                        Label3.Text =  quantity.ToString();


                        SqlCommand cmd4 = new SqlCommand("UPDATE tbl_stock set quantity=quantity-@quantity where pname=@p_id ", con);
                        cmd4.Parameters.AddWithValue("@order_id", orderId);
                        cmd4.Parameters.AddWithValue("@p_id", p_id);
                   
                        cmd4.Parameters.AddWithValue("@quantity", quantity);


                        cmd4.ExecuteNonQuery();


                    }
                    Label4.Text = "Stock complted";





                    // Remove the items from the cart tableA
                    SqlCommand cmd3 = new SqlCommand("DELETE FROM tbl_cart WHERE u_id = @u_id", con);
                    cmd3.Parameters.AddWithValue("@u_id", u_id);
                    cmd3.ExecuteNonQuery();

                    String token = await GetAuthTokenAsync();

                    var response = await CreateOrderAsync(token, orderId, profileFName, deliveryaddress, profileEmail, profileMobile, "Prepaid");


                    String bill = "genrate";
                    Session["bill"] = bill;
                    Response.Redirect("bill.aspx");

                }
                catch (Exception ex)
                {
                    // Handle the exception appropriately, for example:
                    Response.Write("An error occurred while inserting data into the database: " + ex.Message);
                }
                finally
                {
                    con.Close();

                }

            }


        }
    }

    static async Task<String> CreateOrderAsync(string token , string oid, string cname, string address , string email , string phone , string order_type)
    {
        var client = new HttpClient();
        DateTime curentDate = DateTime.Now;
        // Construct the order data
        var orderData = new
        {
            order_id = "art_"+ oid,
            order_date =  curentDate.ToString("yyyy-MM-dd HH:mm"),
            pickup_location = "PRIYANK",
            channel_id = "",
            comment = "order from art ",
            billing_customer_name = cname,
            billing_last_name = "",
            billing_address = address,
            billing_address_2 = "",
            billing_city = "surat",
            billing_pincode = "394180",
            billing_state = "Gujarat",
            billing_country = "India",
            billing_email = email,
            billing_phone = phone,
            shipping_is_billing = true,
            shipping_customer_name = "",
            shipping_last_name = "",
            shipping_address = "",
            shipping_address_2 = "",
            shipping_city = "",
            shipping_pincode = "",
            shipping_country = "",
            shipping_state = "",
            shipping_email = "",
            shipping_phone = "",
            order_items = new[]
            {
                new
                {
                    name = "ARt",
                    sku = "art_1",
                    units = 1,
                    selling_price = "90",
                    discount = "",
                    tax = "",
                    hsn = 441122
                }
            },
            payment_method = order_type,
            shipping_charges = 0,
            giftwrap_charges = 0,
            transaction_charges = 0,
            total_discount = 0,
            sub_total = 9000,
            length = 10,
            breadth = 15,
            height = 20,
            weight = 2.5
        };

        string orderDataJson = Newtonsoft.Json.JsonConvert.SerializeObject(orderData);

        // Construct the request
        var request = new HttpRequestMessage
        {
            RequestUri = new Uri("https://apiv2.shiprocket.in/v1/external/orders/create/adhoc"),
            Method = System.Net.Http.HttpMethod.Post,
            Content = new StringContent(orderDataJson, Encoding.UTF8, "application/json")
        };

        //request.Headers.Add("Authorization", $"Bearer {token}");
        request.Headers.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);


        // Send the request and get the response
        var response = await client.SendAsync(request);
        var responseContent = await response.Content.ReadAsStringAsync();

        Console.WriteLine(responseContent);

        // get value from response
        dynamic responseObject = Newtonsoft.Json.JsonConvert.DeserializeObject(responseContent);


        //{
        //                    "order_id": 536391450,
        //    "channel_order_id": "224-448",
        //    "shipment_id": 534496590,
        //    "status": "CANCELED",
        //    "status_code": 5,
        //    "onboarding_completed_now": 0,
        //    "awb_code": "",
        //    "courier_company_id": "",
        //    "courier_name": ""
        //}

        // Get the shipment ID, order ID, and channel order ID from the response
        //long shipmentId = responseObject.shipment_id;
       // long orderId = responseObject.order_id;
        // string channelOrderId = responseObject.channel_order_id;

        // Return the response content
        return responseContent;
    }
    static async Task<string> GetAuthTokenAsync()
    {
        string email = "21bmiit145@gmail.com";
        string password = "Priyank@8414";

        using (var client = new HttpClient())
        {
            var requestContent = new StringContent(
                $"{{\"email\": \"{email}\", \"password\": \"{password}\"}}",
                Encoding.UTF8,
                "application/json");

            var response = await client.PostAsync("https://apiv2.shiprocket.in/v1/external/auth/login", requestContent);
            var responseContent = await response.Content.ReadAsStringAsync();

            // Extract token from response
            dynamic responseObject = Newtonsoft.Json.JsonConvert.DeserializeObject(responseContent);
            string token = responseObject.token;

            return token;
        }
    }



    private void binddata()
    {
        con.Open();
        if (Request.QueryString["u_id"] != null)
        {
            // Get the value of the "redirect" parameter
            string uid = Request.QueryString["u_id"];

            // Perform redirection to the specified URL
            Response.Redirect("done.aspx");
        }
        else
        {
            // If the "redirect" parameter is not present, display a message
            Response.Write("No redirection specified.");
        }

        String u_id = (String)Session["u_id"].ToString();
        SqlCommand cmd = new SqlCommand("SELECT tbl_cart.c_id,  tbl_cart.quantity, tbl_product.pid, tbl_product.pname, tbl_product.price FROM tbl_cart INNER JOIN tbl_product ON tbl_cart.p_id=tbl_product.pid where u_id='" + u_id + "'", con);
        SqlDataReader reader = cmd.ExecuteReader();

        if (reader.HasRows)
        {
            DataTable dt = new DataTable();
            dt.Load(reader);
            viewcartlist.DataSource = dt;
            viewcartlist.DataBind();
            decimal totalAmount = dt.AsEnumerable().Sum(row => Convert.ToDecimal(row["price"]) * row.Field<int>("quantity"));




        }
        else
        {
            // No items in cart, display appropriate message
            ScriptManager.RegisterStartupScript(this, GetType(), "showToastdanget", "showToastdanget('Empty Cart !!!');", true);

            viewcartlist.Visible = false; // Hide repeater


        }

        con.Close();

    }
}