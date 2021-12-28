using EazyLearn.BookStore.Components;
using EazyLern.BookStore.Components;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EazyLern.BookStore.User
{
    public partial class User : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Category objCategory = new Category();

            gvCategoryList.DataSource = objCategory.GetAllCategories();
            gvCategoryList.DataBind();



            string usrnme = Session["username1"].ToString();
            lblUserName1.Text  = usrnme;
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserLogin.aspx");
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

        protected void gvCategoryList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string id = e.CommandArgument.ToString();
            Response.Redirect("BookListByCategory.aspx?id=" + id);
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            
        }
    }
}