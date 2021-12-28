using EazyLearn.BookStore.Components;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EazyLern.BookStore.User
{
    public partial class BookListByCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
         int categoryId = Convert.ToInt32(Request.QueryString["id"].ToString());



            if (!IsPostBack)
            {
                Book objBook = new Book();
                DataTable dtBook= objBook.GetAllBookDetailsGivenCategoryId(categoryId);
                gvBookListByCategoryId.DataSource = dtBook;
                gvBookListByCategoryId.DataBind();
               //if (dtBook != null && dtBook.Rows.Count > 0)
               // {
               //     lblCategoryName.Text = dtBook.Rows[0]["cat_category_name"].ToString() + " Books";
               //     lblCategoryName.Style.Add("font-size", "30px");
               //     lblCategoryName.Style.Add("font-weight", "bold");
               // }
            }
        }

        protected void gvBookListByCategoryId_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblSpecialPrice = (Label)e.Row.FindControl("lblSpecialPrice");
                if (lblSpecialPrice.Text == "0.00")
                {
                    lblSpecialPrice.Text = "";
                }
            }
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void gvBookListByCategoryId_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}