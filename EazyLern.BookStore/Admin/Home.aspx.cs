using EazyLern.BookStore.Admin;
using EazyLern.BookStore.Components;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static EazyLern.BookStore.Admin.Administrator;

namespace EazyLern.BookStore.admin1
{
    public partial class Home : System.Web.UI.Page
    {
      

        protected void Page_Load(object sender, EventArgs e)
        {
            string usrname = Session["username"].ToString();
            lblNameInro.Text = usrname; 
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
           



         

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            



        }

        protected void TxtPassword_TextChanged(object sender, EventArgs e)
        {

        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("CategoryManagment.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("BookAdd.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("BookEditUpdate.aspx");
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("Special.aspx");
        }
    }

            
}