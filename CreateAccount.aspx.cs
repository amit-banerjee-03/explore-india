using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;


public partial class CreateAccout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        for(int i=1; i<=31; i++)
        {
            drplst_dd.Items.Add(i.ToString());
        }
        string[] month={"January", "February", "March" , "April" , "May" , "June" , "July" , "August" , "September" , "October" , "November" , "December" };
        foreach(String x in month)
        {
            drplst_mm.Items.Add(x);
        }
        for(int i=2016;i>=1970;i--)
        {
            drplst_yy.Items.Add(i.ToString());
        }
    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        SqlCommand com = new SqlCommand("select count(*) from customeraccount where emailid=@email",con);
        com.Parameters.AddWithValue("@email", txt_emailID.Text);
        con.Open();
        int x=Convert.ToInt32(com.ExecuteScalar());
        con.Close();
        if (x==0)
        {
            com = new SqlCommand("insert into customeraccount values(@email,@password,@fullName,@address,@gender,@dob,@city,@number1,@number2)", con);
            com.Parameters.AddWithValue("@email", txt_emailID.Text);
            com.Parameters.AddWithValue("@password", txt_password.Text);
            com.Parameters.AddWithValue("@fullName", txt_fullName.Text);
            com.Parameters.AddWithValue("@address", txt_address.Text);
            if (rdobtn_male.Checked)
            {
                com.Parameters.AddWithValue("@gender", rdobtn_male.Text);
            }
            else
            {
                com.Parameters.AddWithValue("@gender", rdobtn_female.Text);
            }
            com.Parameters.AddWithValue("@dob", drplst_dd.Text + "/" + drplst_mm.Text + "/" + drplst_yy.Text);
            com.Parameters.AddWithValue("@city", drplst_city.Text);
            com.Parameters.AddWithValue("@number1", txt_phoneNumber.Text);
            com.Parameters.AddWithValue("@number2", txt_optionalNumber.Text);
            con.Open();
            com.ExecuteNonQuery();
            con.Close();
            Response.Redirect("~/SecurePart/Login.aspx", false);
        }
        else
        {
            lbl_error.Visible = true;
        }
    }

 
}