using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Configuration;
using System.Data.SqlClient;

public partial class SecurePart_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      
    }

    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        SqlCommand com = new SqlCommand("Select count(*) from customeraccount where emailid=@email and password=@password",con);
        com.Parameters.AddWithValue("@email", login_tool.UserName);
        com.Parameters.AddWithValue("@password",login_tool.Password);
        con.Open();
        int x = Convert.ToInt32(com.ExecuteScalar());
        if(x==1)
        {
            FormsAuthentication.SetAuthCookie(login_tool.UserName,login_tool.RememberMeSet);
            Response.Redirect("~/Home.aspx",false);
        }
    }

  
}