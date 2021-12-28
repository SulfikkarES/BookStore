using EazyLearn.BookStore.Components;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EazyLern.BookStore.User
{
    public partial class UserLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/AdminLogin.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string username1 = txtUsername.Text.ToString();
            string password = txtPassword.Text.ToString();

            int result;

            Customer cuobj = new Customer();
            cuobj.CustomerUserName = username1;
            cuobj.Password = password;
            result = cuobj.GetCustomerLoginCheck();

            if (result > 0)
            {
                Session["username1"] = txtUsername.Text  ;
                Response.Redirect("Home.aspx");
            }
            else
            {
                lblUserResult.Text = "Invalid Login";
            }
        }
    }
}