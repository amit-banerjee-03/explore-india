using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;

public partial class Trip_Status : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["payment"] != null && Request.QueryString["payment"] == "done")
        {
            lbl_bookingSuccessful.Visible = true;
           
        }
        else
        {
            lbl_bookingSuccessful.Visible = false;
        }
        SqlDataAdapter data = new SqlDataAdapter("select bookingid from customerbooking inner join packagetrip on customerbooking.packageid=packagetrip.packageid where emailid=@email and customerbooking.validity=@val", con);
        data.SelectCommand.Parameters.AddWithValue("@email", Page.User.Identity.Name);
        data.SelectCommand.Parameters.AddWithValue("@val",true);
        DataSet ds = new DataSet();
        data.Fill(ds, "customerbooking");
        grdview_listOfTrips.DataSource = ds.Tables["customerbooking"];
        grdview_listOfTrips.DataBind();
    }

    protected void grdview_listOfTrips_SelectedIndexChanged(object sender, EventArgs e)
    {
        String hotelID = null;
        String bookingid = (grdview_listOfTrips.SelectedRow.FindControl("lbl_bookingID") as Label).Text;
        SqlCommand com = new SqlCommand("Select hotelid,startdate,enddate,fareperhead,bookingdate,transporttype,noofseats,customerbooking.packageid from packagetrip inner join customerbooking on packagetrip.packageid=customerbooking.packageid where bookingid=@id", con);
        com.Parameters.AddWithValue("@id", bookingid);
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        if (dr.Read())
        {
            lbl_startDate.Text = "Start Date: "+dr.GetDateTime(1).ToShortDateString();
            lbl_endDate.Text = "End Date: " + dr.GetDateTime(2).ToShortDateString();
            lbl_totalFare.Text = "Total Fare: Rs. "+(dr.GetInt32(3) * dr.GetInt32(6)).ToString();
            lbl_bookingDate.Text = "Booking Date: "+dr.GetDateTime(4).ToShortDateString();
            lbl_transport.Text = "Transport: "+dr.GetString(5);
            hotelID = dr.GetString(0);
            lbl_numberOfPeople.Text = "Number Of People: " + dr.GetInt32(6).ToString();
            Session["packageID"] = dr.GetString(7);
        }
        con.Close();
        com = new SqlCommand("Select hotel.hotelname,location.locationname from hotel inner join location on hotel.locationid=location.locationid where hotel.hotelid=@id", con);
        com.Parameters.AddWithValue("@id", hotelID);
        con.Open();
        dr = com.ExecuteReader();
        if (dr.Read())
        {
            lbl_hotelName.Text = "Hotel Name: " + dr.GetString(0);
            lbl_locationName.Text = "Location Name: " + dr.GetString(1);
        }
        con.Close();
        btn_cancel.Visible = true;
    }

    protected void btn_cancel_Click(object sender, EventArgs e)
    {
        SqlCommand com = new SqlCommand("update customerbooking set validity=@val where packageid=@id",con);
        com.Parameters.AddWithValue("@val", false);
        com.Parameters.AddWithValue("@id",Session["packageID"]);
        con.Open();
        com.ExecuteNonQuery();
        con.Close();
        String s = Session["packageID"].ToString();
        char[] c = s.ToCharArray();
        if (c[0]=='M')
        {
            com = new SqlCommand("update packagetrip set validity=@val where packageid=@id", con);
            com.Parameters.AddWithValue("@val", false);
            com.Parameters.AddWithValue("@id", Session["packageID"]);
            con.Open();
            com.ExecuteNonQuery();
            con.Close();
        }
        else if(c[0]=='J')
        {
            String s1 = lbl_numberOfPeople.Text;
            int x = s1.LastIndexOf(" ");
            s1 = s1.Substring(x + 1, s1.Length-x-1);
            int n = Convert.ToInt32(s1);
            com = new SqlCommand("update packagetrip set totalcustomers=totalcustomers-@total where packageid=@id", con);
            com.Parameters.AddWithValue("@total",n);
            com.Parameters.AddWithValue("@id", Session["packageID"]);
            con.Open();
            com.ExecuteNonQuery();
            con.Close();
        }
        Response.Redirect("~/SecurePart/Trip_Status.aspx?pageID=6",false);
    }
}