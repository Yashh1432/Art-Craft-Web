using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing.Printing;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class Admin_customer : System.Web.UI.Page
{    SqlConnection con = new SqlConnection("Data Source=DESKTOP-L6GFUGE\\YASH; Initial Catalog=artandshopmns ;Integrated Security=True;");

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!string.IsNullOrEmpty(Request.QueryString["userid"]))
        {
            int userid;
            if (int.TryParse(Request.QueryString["userid"], out userid))
            {
                DeleteUser(userid);
            }
        }

        con.Close();
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from tbl_user where role='1'", con);
        cmd.ExecuteNonQuery();
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        viewcustomer.DataSource = dt;
        viewcustomer.DataBind();
        con.Close();
    }
    private void DeleteUser(int userid)
    {

        con.Open();
        using (SqlCommand cmd = new SqlCommand("DELETE FROM tbl_user WHERE id = @userid", con))
        {
            cmd.Parameters.AddWithValue("@userid", userid);
            cmd.ExecuteNonQuery();
        }


        // Redirect back to the product page after deleting
        Response.Redirect("customer.aspx");
    }

    protected void btnprint_Click(object sender, EventArgs e)
    {
        //Response.ContentType = "application/pdf"; // corrected content type
        //Response.AddHeader("Content-Disposition", "attachment; filename=customer_report.pdf"); // corrected "attachment"
        //Response.Cache.SetCacheability(HttpCacheability.NoCache);
        //StringWriter sw = new StringWriter();
        //HtmlTextWriter hw = new HtmlTextWriter(sw);
        //print.RenderControl(hw);
        //Document doc = new Document(PageSize.A4, 50f, 50f, 30f, 30f);
        //PdfWriter.GetInstance(doc, Response.OutputStream);
        //doc.Open();
        //HTMLWorker htw = new HTMLWorker(doc);
        //StringReader sr = new StringReader(sw.ToString());
        //htw.Parse(sr);
        //doc.Close();
        //Response.End();
    }
}