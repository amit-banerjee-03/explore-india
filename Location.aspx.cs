using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Location : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["searchid"] = "nothing";
        imgbtn_right.Attributes.Add("onclick","return false;");
        imgbtn_left.Attributes.Add("onclick", "return false;");
        SqlCommand com = new SqlCommand("Select image1,locationname,text,image2,image3 from Location where locationid=@id",con);
        com.Parameters.AddWithValue("@id", Request.QueryString["locationid"]);
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        String s,s1, s2;
        if(dr.Read())
        {
            img_locationDisplay.ImageUrl = dr.GetString(0);
            lbl_location.Text = dr.GetString(1);
            s = dr.GetString(0);
            s = s.Substring(1, s.Length - 1);
            lbl_image1.Text = s;
            try
            {
                lbl_text.Text = dr.GetString(2);
            }
            catch(Exception)
            {
                lbl_text.Text = "**Text Yet To Be Added**";
            }
            try
            {
                 s1= dr.GetString(3);
                 s1 = s1.Substring(1, s1.Length - 1);
                 lbl_image2.Text = s1;
            }
            catch(Exception)
            {

            }
            try
            {
                s2 = dr.GetString(4);
                s2 = s2.Substring(1, s2.Length - 1);
                lbl_image3.Text = s2;
            }
            catch (Exception)
            {

            }
        }
        con.Close();
        lbl_imageNumber.Text = "1";
        loadAttractions();
    }
    private void loadAttractions()
    {
        SqlDataAdapter data = new SqlDataAdapter("select attractionname,attractionid,locationid from attractions where locationid=@id",con);
        data.SelectCommand.Parameters.AddWithValue("@id", Request.QueryString["locationid"]);
        DataSet ds = new DataSet();
        data.Fill(ds,"attractions");
        grdview_attractions.DataSource = ds.Tables["attractions"];
        grdview_attractions.DataBind();
    }

    protected void grdview_attractions_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlCommand com = new SqlCommand("select attractionid from attractions where attractionname=@name and locationid=@location", con);
        com.Parameters.AddWithValue("@name", (grdview_attractions.SelectedRow.FindControl("lbl_attractions") as Label).Text);
        com.Parameters.AddWithValue("@location", Request.QueryString["locationid"]);
        con.Open();
        String id = com.ExecuteScalar().ToString();
        con.Close();
        Response.Redirect("~/Attraction.aspx?pageID=7&locationID="+ Request.QueryString["locationid"]+"&attractionID="+id,false);
    }
}