using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;

public partial class SecurePart_Payment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        for (int i = 1; i <= 31; i++)
        {
            drplst_dd.Items.Add(i.ToString());
        }
        string[] month = { "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" };
        foreach (String x in month)
        {
            drplst_mm.Items.Add(x);
        }
        for (int i = 2016; i <= 2030; i++)
        {
            drplst_yy.Items.Add(i.ToString());
        }

    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);


        if (Session["tripType"].ToString() == "M")
        {
            SqlCommand com = new SqlCommand("select count(*) from packagetrip where packageid like 'M%'", con);
            con.Open();
            int count = Convert.ToInt32(com.ExecuteScalar());
            count++;
            string package_id = "M" + count.ToString();
            con.Close();
            SqlCommand com_insert = new SqlCommand("insert into packagetrip values(@packageID, 'custom', @hotelid, @startdate, @enddate, @fareperhead, @customerlimit, '', @totalcustomers, @validity)", con);
            com_insert.Parameters.AddWithValue("@packageID", package_id);
            com_insert.Parameters.AddWithValue("@hotelid", Session["hotel"].ToString());
            com_insert.Parameters.AddWithValue("@startdate", Session["start"].ToString());
            com_insert.Parameters.AddWithValue("@enddate", Session["end"].ToString());
            int fare_per_head = Convert.ToInt32(Session["fare"]) / Convert.ToInt32(Session["numberOfPeople"]);
            com_insert.Parameters.AddWithValue("@fareperhead", fare_per_head);
            com_insert.Parameters.AddWithValue("@customerlimit", Convert.ToInt32(Session["numberOfPeople"]));
            com_insert.Parameters.AddWithValue("@totalcustomers", Convert.ToInt32(Session["numberOfPeople"]));
            com_insert.Parameters.AddWithValue("@validity", true);
            con.Open();
            com_insert.ExecuteNonQuery();
            con.Close();
            com = new SqlCommand("select count(*) from customerbooking", con);
            con.Open();
            count = Convert.ToInt32(com.ExecuteScalar());
            count++;
            string booking_id = "B" + count.ToString();
            con.Close();
            com_insert = new SqlCommand("insert into customerbooking values(@emailid, @packageid, @bookingid, @bookingdate, @transporttype, @noofseats,@validity)", con);
            com_insert.Parameters.AddWithValue("@packageid", package_id);
            com_insert.Parameters.AddWithValue("@emailid", Page.User.Identity.Name);
            com_insert.Parameters.AddWithValue("@bookingid", booking_id);
            com_insert.Parameters.AddWithValue("@bookingdate", DateTime.Now.ToShortDateString());
            com_insert.Parameters.AddWithValue("@transporttype", Session["typeOfTransport"].ToString());
            com_insert.Parameters.AddWithValue("@noofseats", Convert.ToInt32(Session["numberOfPeople"]));
            com_insert.Parameters.AddWithValue("@validity", true);
            con.Open();
            com_insert.ExecuteNonQuery();
            con.Close();
            com_insert = new SqlCommand("insert into payment values(@emailid,@bookingid, @cardnumber, @expirydate, @cardname, @type)", con);
            com_insert.Parameters.AddWithValue("@bookingid", booking_id);
            com_insert.Parameters.AddWithValue("@emailid", Page.User.Identity.Name);
            com_insert.Parameters.AddWithValue("@cardnumber", txt_cardNumber.Text);
            com_insert.Parameters.AddWithValue("@cardname", txt_cardHolderName.Text);
            String date= drplst_dd.Text + "/" + drplst_mm.Text +"/"+ drplst_yy.Text ;
            com_insert.Parameters.AddWithValue("@expirydate", date);
            if (rdobtn_credit.Checked == true)
            {
                com_insert.Parameters.AddWithValue("@type", rdobtn_credit.Text);
            }
            else
            {
                com_insert.Parameters.AddWithValue("@type", rdobtn_debit.Text);
            }
            con.Open();
            com_insert.ExecuteNonQuery();
            con.Close();
            Response.Redirect("~/SecurePart/Trip_Status.aspx?pageID=6&payment=done");
        }
        else if(Session["tripType"].ToString()=="J")
        {
            int count;
            SqlCommand com = new SqlCommand("select count(*) from customerbooking", con);
            con.Open();
            count = Convert.ToInt32(com.ExecuteScalar());
            con.Close();
            count++;
            String bookingID = "B" + count.ToString();
            com = new SqlCommand("insert into customerbooking values(@email,@packageid,@bookingid,@bookingdate,@transporttype,@noofseats,@validity)", con);
            com.Parameters.AddWithValue("@email",Page.User.Identity.Name);
            com.Parameters.AddWithValue("@packageid", Session["packageID"]);
            com.Parameters.AddWithValue("@bookingid", bookingID);
            com.Parameters.AddWithValue("@bookingdate", DateTime.Now.ToShortDateString());
            com.Parameters.AddWithValue("@transporttype", Session["transport"]);
            com.Parameters.AddWithValue("@noofseats", Session["numberofpeople"]);
            com.Parameters.AddWithValue("@validity", true);
            con.Open();
            com.ExecuteNonQuery();
            con.Close();
            int n = Convert.ToInt32(Session["totalcustomer"]) + Convert.ToInt32(Session["numberofpeople"]);
            bool flag;
            if(Convert.ToInt32(Session["limit"])-n==0)
            {
                flag = false;
            }
            else
            {
                flag = true;
            }
            com = new SqlCommand("update packagetrip set validity=@val where packageid=@id",con);
            com.Parameters.AddWithValue("@val",flag);
            com.Parameters.AddWithValue("@id",Session["packageID"]);
            con.Open();
            com.ExecuteNonQuery();
            con.Close();
            com = new SqlCommand("update packagetrip set totalcustomers=@total where packageid=@id", con);
            com.Parameters.AddWithValue("@total", n);
            com.Parameters.AddWithValue("@id", Session["packageID"]);
            con.Open();
            com.ExecuteNonQuery();
            con.Close();
            SqlCommand com_insert;
            com_insert = new SqlCommand("insert into payment values(@emailid,@bookingid, @cardnumber, @expirydate, @cardname, @type)", con);
            com_insert.Parameters.AddWithValue("@bookingid", bookingID);
            com_insert.Parameters.AddWithValue("@emailid", Page.User.Identity.Name);
            com_insert.Parameters.AddWithValue("@cardnumber", txt_cardNumber.Text);
            com_insert.Parameters.AddWithValue("@cardname", txt_cardHolderName.Text);
            String date = drplst_dd.Text + "/" + drplst_mm.Text + "/" + drplst_yy.Text;
            com_insert.Parameters.AddWithValue("@expirydate", date);
            if (rdobtn_credit.Checked == true)
            {
                com_insert.Parameters.AddWithValue("@type", rdobtn_credit.Text);
            }
            else
            {
                com_insert.Parameters.AddWithValue("@type", rdobtn_debit.Text);
            }
            con.Open();
            com_insert.ExecuteNonQuery();
            con.Close();
            Response.Redirect("~/SecurePart/Trip_Status.aspx?pageID=6&payment=done");
        }

    }
}