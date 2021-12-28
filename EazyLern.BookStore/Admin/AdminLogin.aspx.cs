using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EazyLern.BookStore.Admin
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Username_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            string username = Username.Text.ToString();
            string password = txtPassword.Text.ToString();

            int result;

            Administrator adobj = new Administrator();
            adobj.User_Name = username;
            adobj.Password = password;
            result = adobj.admninistratorCount();

            if (result>0)
            {
                Session["username"] = Username.Text;
                Response.Redirect("Home.aspx");
            }
            else
            {
                lblResult.Text = "Invalid Login";
            }

            


        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/User/UserLogin.aspx");
        }
    }
}