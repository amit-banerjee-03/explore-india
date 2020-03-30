using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Join_Trip : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_payNow_Click(object sender, EventArgs e)
    {
        if(Convert.ToInt32(lbl_total.Text)>=Convert.ToInt32(txt_numberOfPeople.Text))
        {
            Response.Redirect("~/SecurePart/Payment.aspx", false);
        }
        else
        {
            lbl_error.Visible = true;
        }
        
    }

    protected void btn_findPackages_Click(object sender, EventArgs e)
    {
        drplst_packagehidden.Items.Clear();
        drplst_package.Items.Clear();
        if (drplst_location.SelectedIndex != 0)
        {
            //Session["locationSelected"] = "1";
            Session["locationName"] = drplst_location.Text;
            SqlCommand com_select = new SqlCommand("select packagetrip.packagename,packagetrip.packageid from packagetrip,hotel,location where packagetrip.hotelid=hotel.hotelid and hotel.locationid=location.locationid and location.locationname=@location and packagetrip.validity=@val and packagetrip.packageid like 'J%'", con);
            com_select.Parameters.AddWithValue("@location", drplst_location.Text);
            com_select.Parameters.AddWithValue("@val", true);
            con.Open();
            SqlDataReader dr = com_select.ExecuteReader();
            while (dr.Read())
            {
                drplst_package.Items.Add(dr.GetString(0));
                drplst_packagehidden.Items.Add(dr.GetString(1));
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
        lbl_error.Visible = false;
        int x = drplst_package.SelectedIndex;
        drplst_packagehidden.SelectedIndex = x;
        String s = drplst_packagehidden.Text;
        SqlCommand com_select = new SqlCommand("select startdate, enddate, customerlimit, hotelname, totalcustomers, fareperhead from packagetrip inner join hotel on hotel.hotelid = packagetrip.hotelid and packagetrip.packageid = @id ", con);
        com_select.Parameters.AddWithValue("@id", s);
        con.Open();
        SqlDataReader dr = com_select.ExecuteReader();
        int limit=0, total=0,total1;
        if (dr.Read())
        {
            lbl_startDate.Text = dr.GetDateTime(0).ToShortDateString();
            lbl_endDate.Text = dr.GetDateTime(1).ToShortDateString();
            limit = dr.GetInt32(2);
            total = dr.GetInt32(4);
            total1 = limit - total;
            lbl_total.Text = total1.ToString();
            lbl_hotel.Text = dr.GetString(3);
            lbl_typeTransport.Text = "FLIGHT";
            int n = Convert.ToInt32(txt_numberOfPeople.Text);
            lbl_price.Text = (dr.GetInt32(5)*n).ToString();
        }
        con.Close();
        btn_payNow.Visible = true;
        lbl_price.Visible = true;
        Session["packageID"] = s;
        Session["tripType"] = "J";
        Session["numberofpeople"]=txt_numberOfPeople.Text;
        Session["transport"]="Flight";
        Session["totalcustomer"] = total.ToString();
        Session["limit"] = limit.ToString();
    }
}