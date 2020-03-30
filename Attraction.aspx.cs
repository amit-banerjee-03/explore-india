using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;


public partial class Attraction : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["searchid"] = "nothing";
        imgbtn_left.Attributes.Add("onclick","return false;");
        imgbtn_right.Attributes.Add("onclick", "return false;");
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        SqlCommand com = new SqlCommand("select * from attractions where locationid=@location and attractionid=@attraction", con);
        com.Parameters.AddWithValue("@location", Request.QueryString["locationID"]);
        com.Parameters.AddWithValue("@attraction", Request.QueryString["attractionID"]);
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        if (dr.Read())
        {
            String s, s1, s2;
            img_attractionDisplay.ImageUrl = dr.GetString(4);
            lbl_attraction.Text = dr.GetString(1);
            try
            {
                lbl_text.Text = dr.GetString(3);
            }
            catch (Exception)
            {
                lbl_text.Text = "";
            }
            s = dr.GetString(4);
            s = s.Substring(1, s.Length - 1);
            lbl_image1.Text = s;
            try
            {
                s1 = dr.GetString(5);
                s1 = s1.Substring(1, s1.Length - 1);
                lbl_image2.Text = s1;
            }
            catch (Exception)
            {

            }
            try
            {
                s2 = dr.GetString(6);
                s2 = s2.Substring(1, s2.Length - 1);
                lbl_image3.Text = s2;
            }
            catch (Exception)
            {

            }
        }
        con.Close();
        lbl_imageNumber.Text = "1";
    }
}