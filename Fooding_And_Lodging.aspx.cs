using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Fooding_And_Lodging : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["searchid"] = "nothing";
        imgbtn_right.Attributes.Add("onclick", "return false;");
        imgbtn_left.Attributes.Add("onclick", "return false;");
        String hotelID =Request.QueryString["hotelID"];
        if (hotelID!=null)
        {
            SqlCommand com = new SqlCommand("Select * from hotel where hotelid=@hotel", con);
            com.Parameters.AddWithValue("@hotel", hotelID);
            con.Open();
            SqlDataReader dr = com.ExecuteReader();
            string s, s1, s2;
            if (dr.Read())
            {
                lbl_foodingAndLodging.Text= dr.GetString(1);
                img_hotelDisplay.ImageUrl = dr.GetString(3);
                s = dr.GetString(3);
                s = s.Substring(1, s.Length - 1);
                lbl_image1.Text = s;
                try
                {
                    s1= dr.GetString(4);
                    s1 = s1.Substring(1, s1.Length - 1);
                    lbl_image2.Text = s1;
                }
                catch (Exception)
                {
                }
                try
                {
                    s2 = dr.GetString(5);
                    s2 = s2.Substring(1, s2.Length - 1);
                    lbl_image3.Text = s2;
                }
                catch (Exception)
                {
                }
                //END OF HOTEL PICS
                try
                {
                    lbl_text.Text = dr.GetString(7);
                }
                catch (Exception)
                {
                    lbl_text.Text = "**Text Yet To Be Added**";
                }
                s = dr.GetString(8);
                s = s.Substring(1, s.Length - 1);
                lbl_room1.Text = s;
                try
                {
                    s1 = dr.GetString(9);
                    s1 = s1.Substring(1, s1.Length - 1);
                    lbl_room2.Text = s1;
                }

                catch (Exception)
                {
                }
                try
                {
                    s2 = dr.GetString(10);
                    s2 = s2.Substring(1, s2.Length - 1);
                    lbl_room3.Text = s2;
                }
                catch (Exception)
                {
                }

            }
            con.Close();
            lbl_imageNumber.Text = "1";
        }
        

    }
}