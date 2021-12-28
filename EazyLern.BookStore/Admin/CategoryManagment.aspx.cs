using EazyLern.BookStore.Components;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EazyLern.BookStore
{
    public partial class category_managment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillData();
            }
            lblUserName.Text = Session["username"].ToString();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            // Response.Redirect("CategoryAdd.aspx");
            int result;
            string categoryName = txtCategoryName.Text.ToString();

            Category cataddobj = new Category();
           
            cataddobj.CategoryName  = categoryName;

            //cataddobj.InsertACategory();
           
            FillData();
            txtCategoryName.Text = "";
          
            
            result = cataddobj.InsertACategory();

            if (result > 0)
            {
                lbllblResult.Text = "Category Inserted successfully";
            }
            else
            {
                lbllblResult.Text = "Category Insertion faild,Please Try again";
            }
        }

        protected void gvCategories_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvCategories.EditIndex = e.NewEditIndex;
            FillData();
        }

        protected void gvCategories_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int result;

            Category catobj = new Category();
            catobj.CategoryId  = Convert.ToInt32(gvCategories.Rows[e.RowIndex].Cells[0].Text);
            catobj.CategoryName  = ((TextBox)(gvCategories.Rows[e.RowIndex].Cells[1].Controls[0])).Text;

            result = catobj.UpdateACategory();

            if (result>0)
            {
                lbllblResult.Text = "Category updated successfully";
            }
            else
            {
                lbllblResult.Text = "Category updation faild,Please Try again";
            }
            
            FillData();
            gvCategories.EditIndex = -1;
        }
        public void FillData()
        {
            Category catobj = new Category();

            DataTable dtCategory;

            dtCategory = catobj.GetAllCategories();
            gvCategories.DataSource = dtCategory;
            gvCategories.DataBind();

        }

        protected void gvCategories_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvCategories.EditIndex = -1;
            FillData();


        }

        protected void gvCategories_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int result,IdToBeDeleted;

            Category catdobj = new Category();

            IdToBeDeleted = Convert.ToInt32(gvCategories.Rows[e.RowIndex].Cells[0].Text);

            result = catdobj.DeleteACategory(IdToBeDeleted);
           
            if (result > 0)
            {
                lbllblResult.Text = "Category deleted successfully";
            }
            else
            {
                lbllblResult.Text = "Category deletion faild,Please Try again";
            }

            FillData();
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void gvCategories_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCategories.PageIndex = e.NewPageIndex;
            FillData();
        }
    }
}