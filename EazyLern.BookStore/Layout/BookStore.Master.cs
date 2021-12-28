using EazyLern.BookStore.Components;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EazyLern.BookStore.Layout
{
    public partial class BookStore : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Category objCategory = new Category();

            gvCategoryList.DataSource = objCategory.GetAllCategories();
            gvCategoryList.DataBind();

            lblUser.InnerText = Session["username"].ToString();
            

        }

        protected void gvCategoryList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void gvCategoryList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Fill();
            gvCategoryList.PageIndex = e.NewPageIndex;
            gvCategoryList.DataBind();
        }

        void Fill()
        {
            Category catobj = new Category();
            gvCategoryList.DataSource = catobj.GetAllCategories();
            gvCategoryList.DataBind();
        }


        protected void lnkHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminLogin.aspx");
        }
    }
}