using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;

public partial class Make_Trip : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            for (int i = 1; i <= 31; i++)
            {
                drplst_endDD.Items.Add(i.ToString());
                drplst_startDD.Items.Add(i.ToString());
            }
            string[] month = { "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" };
            foreach (String x in month)
            {
                drplst_endMM.Items.Add(x);
                drplst_startMM.Items.Add(x);
            }
        }
    } 

    protected void btn_payNow_Click(object sender, EventArgs e)
    {
        Session["locationName"] = drplst_location.Text;
        Session["start"] = drplst_startDD.Text+"/"+drplst_startMM.Text+"/2016";
        Session["end"] = drplst_endDD.Text + "/" + drplst_endMM.Text + "/2016";
        Session["numberOfPeople"] = txt_numberOfPeople.Text;
        SqlCommand hotel_search = new SqlCommand("select hotelid from hotel inner join location on hotel.locationid= location.locationid where hotel.hotelname=@hotel and location.locationname=@locationname",con);
        hotel_search.Parameters.AddWithValue("@hotel",drplst_hotel.Text);
        hotel_search.Parameters.AddWithValue("@locationname", drplst_location.Text);
        con.Open();
        string s = hotel_search.ExecuteScalar().ToString();
        con.Close();
        Session["hotel"] = s;
        Response.Redirect("~/SecurePart/Payment.aspx", false);
    }

    protected void btn_hotelCheck_Click(object sender, EventArgs e)
    {
        drplst_hotel.Items.Clear();
        if (drplst_location.SelectedIndex != 0)
        {
            Session["locationSelected"] = "1";
            Session["locationName"] = drplst_location.Text;
            SqlCommand com_select = new SqlCommand("select hotelid, hotelname from hotel inner join location on hotel.locationid=location.locationid where location.locationname=@location", con);
            com_select.Parameters.AddWithValue("@location", Session["locationName"]);
            con.Open();
            SqlDataReader dr = com_select.ExecuteReader();
            while (dr.Read())
            {
                drplst_hotel.Items.Add(dr.GetString(1));
            }
            con.Close();
        }
        else
        {
            Session["locationSelected"] = "0";
            Session["locationName"] = "";
        }

    }

    protected void btn_book_Click(object sender, EventArgs e)
    {
        int price;
        int numberOfDays;
        DateTime start=Convert.ToDateTime(drplst_startDD.Text + "/" + drplst_startMM.Text + "/2016");
        DateTime end = Convert.ToDateTime(drplst_endDD.Text + "/" + drplst_endMM.Text + "/2016");
        if(start<=DateTime.Now)
        {
            lbl_startDateError.Visible = true;
        }
        else
        {
            lbl_startDateError.Visible = false;
        }
        if (end <= start)
        {
            lbl_endDateError.Visible = true;
        }
        else
        {
            lbl_endDateError.Visible = false;
        }
        if(start > DateTime.Now && end > start)
        {
            numberOfDays = Convert.ToInt32((end - start).TotalDays);
            SqlCommand com_book = new SqlCommand("select farepernight from hotel inner join room on hotel.hotelid=room.hotelid where hotel.hotelname=@hotel and room.typename=@type", con);
            com_book.Parameters.AddWithValue("@hotel", drplst_hotel.Text);
            string ac_check, bed_check;
            if (rdobtn_ac.Checked == true)
            {
                ac_check = "ac";
            }
            else
            {
                ac_check = "nonac";
            }
            if (chkbox_bed.Checked == true)
            {
                bed_check = "double";
            }
            else
            {
                bed_check = "single";
            }
            if (rdobtn_bus.Checked == true)
            {
                Session["typeOfTransport"] = rdobtn_bus.Text;
                price = 200;
            }
            else if (rdobtn_train.Checked == true)
            {
                Session["typeOfTransport"] = rdobtn_train.Text;
                price = 800;
            }
            else
            {
                Session["typeOfTransport"] = rdobtn_flight.Text;
                price = 3000;
            }
            ac_check = ac_check + " " + bed_check;
            Session["typeOfRoom"] = ac_check;
            com_book.Parameters.AddWithValue("@type", ac_check);
            con.Open();
            int fare = Convert.ToInt32(com_book.ExecuteScalar());
            lbl_price.Text = ((fare * numberOfDays) + (price * Convert.ToInt32(txt_numberOfPeople.Text) * 2)).ToString();
            lbl_price.Visible = true;
            btn_payNow.Visible = true;
            Session["fare"] = lbl_price.Text;
            Session["tripType"] = "M";
            con.Close();
        }
        
    }
}