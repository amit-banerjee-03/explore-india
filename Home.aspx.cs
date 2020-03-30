using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Home : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            Session["searchid"] = "nothing";
        }
        
        imgbtn_right.Attributes.Add("onclick","return false;");
        imgbtn_left.Attributes.Add("onclick","return false;");
    }

    protected void imgbtn_search_Click(object sender, ImageClickEventArgs e)
    {
        if(lst_search.SelectedIndex!=-1)
        {
            drplst_id.SelectedIndex = lst_search.SelectedIndex;
            Session["searchid"] = drplst_id.Text;
        }
        else
        {
            Session["searchid"] = "nothing";
        }
        if (Session["searchid"].ToString()!="nothing")
        {
            if (Session["searchid"].ToString().ElementAt(0)== 'L')
            {
                Response.Redirect("~/Location.aspx?pageid=3&locationid="+ Session["searchid"].ToString(), false);
            }
            else if(Session["searchid"].ToString().ElementAt(0) == 'A')
            {
                SqlCommand com = new SqlCommand("select locationid from attractions where attractionid=@id",con);
                com.Parameters.AddWithValue("@id", Session["searchid"].ToString());
                con.Open();
                string str = com.ExecuteScalar().ToString();
                con.Close();
                Response.Redirect("~/Attraction.aspx?pageID=7&locationID=" + str + "&attractionID=" + Session["searchid"].ToString(), false);
            }
            else if(Session["searchid"].ToString().ElementAt(0) == 'H')
            {
                Response.Redirect("~/Fooding_And_Lodging.aspx?pageid=2&hotelID="+ Session["searchid"].ToString(), false);
            }
        }
        else
        {
            lst_search.Items.Clear();
            drplst_id.Items.Clear();
            SqlCommand com = new SqlCommand("select locationname,locationid from location where locationname like '" + txt_search.Text + "%'", con);
            con.Open();
            SqlDataReader dr = com.ExecuteReader();
            while (dr.Read())
            {
                lst_search.Items.Add(dr.GetString(0));
                drplst_id.Items.Add(dr.GetString(1));
            }
            con.Close();
            com = new SqlCommand("select attractionname,attractionid from attractions where attractionname like '" + txt_search.Text + "%'", con);
            con.Open();
            dr = com.ExecuteReader();
            while (dr.Read())
            {
                lst_search.Items.Add(dr.GetString(0));
                drplst_id.Items.Add(dr.GetString(1));
            }
            con.Close();
            com = new SqlCommand("select hotelname,hotelid from hotel where hotelname like '" + txt_search.Text + "%'", con);
            con.Open();
            dr = com.ExecuteReader();
            while (dr.Read())
            {
                lst_search.Items.Add(dr.GetString(0));
                drplst_id.Items.Add(dr.GetString(1));
            }
            con.Close();
            int x = lst_search.Items.Count;
            if (x < 5)
            {

                lst_search.Height = x * 20;
            }
            else
            {
                lst_search.Height = 100;
            }
            lst_search.Visible = true;
        }
        
    }
}