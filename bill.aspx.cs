using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using Razorpay.Api;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Printing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class bill : System.Web.UI.Page
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

            if (Session["orderId"] != null)
            {
                String orderId = (String)Session["orderId"].ToString();
                con.Close();
                con.Open();

                SqlCommand selectUser = new SqlCommand("select * from tbl_order where order_id='" + orderId + "'", con);
                SqlDataReader dr = selectUser.ExecuteReader();
                if (dr.Read())
                {
                    DateTime currentDate = DateTime.Now;
                    //string id = dr["p_id"].ToString();
                    //Session["pid"] = id;
                    String fname = dr["fname"].ToString();
                    lblcustomername.Text = fname ;
                    lbladdress.Text = dr["address"].ToString();
                    lblcontact.Text = dr["contact"].ToString();
                    lblorder_id.Text = dr["order_id"].ToString();
                    lblemail.Text = dr["email"].ToString();
                    lbldate.Text = currentDate.ToString();



                }

                dr.Close();
                String u_id = Session["u_id"].ToString();

                SqlCommand cmd = new SqlCommand("SELECT tbl_order_item.o_i_d, tbl_product.pid, tbl_product.pname, tbl_product.img, tbl_product.brand, tbl_product.price,  tbl_order_item.quantity  FROM tbl_order_item INNER JOIN tbl_product ON tbl_order_item.p_id=tbl_product.pid where order_id='" + orderId + "'", con);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    DataTable dt = new DataTable();
                    dt.Load(reader);
                    view_order_details.DataSource = dt;
                    view_order_details.DataBind();
                    decimal totalAmount = dt.AsEnumerable().Sum(row => Convert.ToDecimal(row["price"]) * row.Field<int>("quantity"));
                    lblamount1.Text = string.Format("&#8377;{0}.00", totalAmount);
                    lblamount.Text = string.Format("&#8377;{0}.00", totalAmount);

                }
                reader.Close();
                con.Close();
            }

        }
    }

    protected void btnprint_Click(object sender, EventArgs e)
    {
        Response.ContentType = "application/pdf";
        Response.AddHeader("Content-Disposition", "attachement; filename=Invoice.pdf");
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        StringWriter sw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(sw);
        DivToPrint.RenderControl(hw);
        Document doc = new Document(PageSize.A4, 50f, 50f, 30f, 30f);
        HTMLWorker htw = new HTMLWorker(doc);
        PdfWriter.GetInstance(doc, Response.OutputStream);
        doc.Open();
        StringReader sr = new StringReader(sw.ToString());
        htw.Parse(sr);
        doc.Close();
        Response.Write(doc);
        Response.End();
    }

    public override void VerifyRenderingInServerForm(Control control)
    {

    }
}