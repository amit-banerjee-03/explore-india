using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Web.Security;
using System.Data.SqlClient;
using System.Configuration;

public partial class Template : System.Web.UI.MasterPage
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    private int pageID=1;
    void change_background(Button selected, Button b1, Button b2, Button b3, Button b4, Button b5)
    {
        selected.BorderColor = Color.FromArgb(94, 48, 138);
        b1.BorderColor = Color.FromArgb(30, 150, 237);
        b2.BorderColor = Color.FromArgb(30, 150, 237);
        b3.BorderColor = Color.FromArgb(30, 150, 237);
        b4.BorderColor = Color.FromArgb(30, 150, 237);
        b5.BorderColor = Color.FromArgb(30, 150, 237);
        selected.BorderWidth = 3;

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        pageID = Convert.ToInt32(Request.QueryString["pageid"]);
        if(pageID==0)
        {
            Response.Redirect("~/Home.aspx?pageid=1");
        }
        switch (pageID)
        {
            case 1:
                change_background(btn_home, btn_fooding, btn_location, btn_jointrip, btn_maketrip, btn_tripstatus);
                break;
            case 2:
                change_background(btn_fooding, btn_location, btn_home, btn_jointrip, btn_maketrip, btn_tripstatus);
                break;
            case 3:
                change_background(btn_location, btn_fooding, btn_home, btn_jointrip, btn_maketrip, btn_tripstatus);
                break;
            case 4:
                change_background(btn_maketrip, btn_fooding, btn_home, btn_jointrip, btn_location, btn_tripstatus);
                break;
            case 5:
                change_background(btn_jointrip, btn_fooding, btn_home, btn_location, btn_maketrip, btn_tripstatus);
                break;
            case 6:
                change_background(btn_tripstatus, btn_fooding, btn_home, btn_location, btn_maketrip, btn_jointrip);
                break;
        }
        if(Page.User.Identity.IsAuthenticated)
        {
            SqlCommand com = new SqlCommand("select fullname from customeraccount where emailId=@email", con);
            com.Parameters.AddWithValue("@email", Page.User.Identity.Name);
            con.Open();
            string name = com.ExecuteScalar().ToString();
            int i = name.IndexOf(" ");
            name= name.Substring(0, i + 1);
            menu_items.Items[0].ChildItems[0].Text = name;
            menu_items.Items[0].ChildItems[1].Text = "Log Out";
        }
        else
        {
            menu_items.Items[0].ChildItems[0].Text = ".";
            menu_items.Items[0].ChildItems[1].Text = "Login";
        }
        
    }

    protected void btn_location_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Location.aspx?pageid=3&locationid=L104", false);
    }

    protected void btn_home_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Home.aspx?pageid=1", false);
    }

    protected void btn_fooding_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Fooding_And_Lodging.aspx?pageid=2", false);
    }

    protected void btn_maketrip_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/SecurePart/Make_Trip.aspx?pageid=4", false);
    }

    protected void btn_jointrip_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/SecurePart/Join_Trip.aspx?pageid=5", false);
    }

    protected void btn_tripstatus_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/SecurePart/Trip_Status.aspx?pageid=6", false);
    }



    protected void menu_items_MenuItemClick(object sender, MenuEventArgs e)
    {
        if(menu_items.Items[0].ChildItems[1].Selected)
        {
            if (Page.User.Identity.IsAuthenticated)
            {
                FormsAuthentication.SignOut();
                Response.Redirect("~/Home.aspx",false);
            }
            else
            {
                Response.Redirect("~/SecurePart/Login.aspx",false);
            }
        }
    }
}
