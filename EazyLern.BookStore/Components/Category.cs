#region Copyright EazyLearn
//
// All rights are reserved. Reproduction or transmission in whole or in part, 
// in any form or by any means, electronic, mechanical or otherwise, is
// prohibited without the prior written consent of the copyright owner.
//
// Filename        : Administrator.cs    
// Purpose         : To create Administrator object 

// Creation Date   : 19-11-2021
// Author          : Sulfikkar E S
//
// Change History  :
// Changed by      :              
// Date            : 
// Purpose         :
//
#endregion

#region Name spaces

using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
#endregion

namespace EazyLern.BookStore.Components
{
    public class Category
    {
        /// <summary>
        /// Get category Id
        /// </summary>
        public int CategoryId
        {
            get;
            set;
        }

        /// <summary>
        /// Get category name
        /// </summary>
        public string CategoryName
        {
            get;
            set;
        }

        /// <summary>
        /// Status of deletion
        /// </summary>
        public int IsDeleted
        {
            get;
            set;
        }

        #region Public Methods

        #region Get Methods
        /// <summary>
        /// Retrieves all Categories
        /// </summary>
        /// <returns>data's of Category</returns>
        public DataTable GetAllCategories()
        {
            SqlDataAdapter daCategory;

            //string catdbconnectionstring = "Data Source=el-iib-0\\SQLEXPRESS2017;Initial Catalog=dboBookStoreSulfikkar;user id=sa;password=L0ncok#08L0ncok#08";
            string SelectQuery = "prccategoryselect";

            SqlConnection catdbCon = null;
            DataSet dsCategory = new DataSet();

            try
            {
                catdbCon = StoreDBConnection.GetConnection(); //new SqlConnection(catdbconnectionstring);
                catdbCon.Open();

                daCategory = new SqlDataAdapter(SelectQuery, catdbCon);
                daCategory.Fill(dsCategory);
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            finally
            {
                catdbCon.Close();
            }
            return dsCategory.Tables[0];
        }
        #endregion


        #region Insert category
        /// <summary>
        /// Insert a Category to the Category table
        /// </summary>
        /// <returns>numberOfRowsAffected</returns>
        public int InsertACategory()
        {
            int numberOfRowsAffected;
            //string catdbconnectionstring = "Data Source=el-iib-0\\SQLEXPRESS2017;Initial Catalog=dboBookStoreSulfikkar;user id=sa;password=L0ncok#08L0ncok#08";
            string insertQuery = "prccategoryinsert";


            SqlConnection catdbCon = null;

            SqlCommand cmdInsertCategory = null;

            try
            {
                catdbCon = StoreDBConnection.GetConnection();
                catdbCon.Open();

                cmdInsertCategory = new SqlCommand(insertQuery, catdbCon);

               
                cmdInsertCategory.Parameters.AddWithValue("@name",this.CategoryName);
                cmdInsertCategory.CommandType = CommandType.StoredProcedure;
                numberOfRowsAffected = cmdInsertCategory.ExecuteNonQuery();
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            finally
            {
               catdbCon.Close();
            }

            return numberOfRowsAffected;
        }
        #endregion category

        #region edit category
        /// <summary>
        /// Edit a Category in the Category table
        /// </summary>
        /// <returns>numberOfRowsAffected</returns>
        public int EditACategory()
        {
            int numberOfRowsAffected;
            //string perdbconnectionstring = "Data Source=el-iib-0\\SQLEXPRESS2017;Initial Catalog=dboBookStoreSulfikkar;user id=sa;password=L0ncok#08L0ncok#08";
            string editQuery = "UPDATE bss_Category SET cat_category_name=@name where cat_category_id=@id";
            SqlConnection catdbCon = null;

            SqlCommand cmdEditCategory = null;

            try
            {
                catdbCon = StoreDBConnection.GetConnection();//new SqlConnection(perdbconnectionstring);
                catdbCon.Open();

                cmdEditCategory = new SqlCommand(editQuery, catdbCon);

                cmdEditCategory.Parameters.AddWithValue("@id", this.CategoryId);
                cmdEditCategory.Parameters.AddWithValue("@name", this.CategoryName );
              
                //cmdEditPerson.Parameters.AddWithValue("@country", this.CountryId);
               numberOfRowsAffected = cmdEditCategory.ExecuteNonQuery();
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            finally
            {
                catdbCon.Close();
            }

            return numberOfRowsAffected;
        }
        #endregion edit category

        #region update category
        /// <summary>
        /// Edit a Category in the Category table
        /// </summary>
        /// <returns>numberOfRowsAffected</returns>
        public int UpdateACategory()
        {
            int numberOfRowsAffected;
            //string catdbconnectionstring = "Data Source=el-iib-0\\SQLEXPRESS2017;Initial Catalog=dboBookStoreSulfikkar;user id=sa;password=L0ncok#08L0ncok#08";
            string updateQuery = "prccategoryupdate";
            SqlConnection catdbCon = null;

            SqlCommand cmdUpdateCategory = null;

            try
            {
                catdbCon = StoreDBConnection.GetConnection(); //new SqlConnection(catdbconnectionstring);
                catdbCon.Open();

                cmdUpdateCategory = new SqlCommand(updateQuery, catdbCon);
                // parameter creation and added
                //SqlParameter param = new SqlParameter();
                //param.Direction = ParameterDirection.Input;
                //param.ParameterName = "@name";
                //param.SqlDbType = SqlDbType.VarChar;
                //param.Value = this.Category_name;
                //cmdUpdateCategory.Parameters.Add(param);

                //OR

                //SqlParameter param = new SqlParameter("@name", SqlDbType.VarChar, 30);

                //OR

                //cmdUpdateCategory.Parameters.Add(new SqlParameter("@name", SqlDbType.VarChar, 30));
                //cmdUpdateCategory.Parameters["@name"] = this.Category_name;

                cmdUpdateCategory.Parameters.AddWithValue("@id", this.CategoryId);
                cmdUpdateCategory.Parameters.AddWithValue("@name", this.CategoryName );
                cmdUpdateCategory.CommandType = CommandType.StoredProcedure;

                //cmdEditPerson.Parameters.AddWithValue("@country", this.CountryId);
                numberOfRowsAffected = cmdUpdateCategory.ExecuteNonQuery();
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            finally
            {
                catdbCon.Close();
            }

            return numberOfRowsAffected;
        }
        #endregion update category

        #region delete category
        /// <summary>
        /// Delete a Category from the Category table
        /// </summary>
        /// <returns>numberOfRowsAffected</returns>
        public int DeleteACategory(int catgryId)
        {
            int numberOfRowsAffected;
           // string catdbconnectionstring = "Data Source=el-iib-0\\SQLEXPRESS2017;Initial Catalog=dboBookStoreSulfikkar;user id=sa;password=L0ncok#08L0ncok#08";
            string deleteQuery = "prccategorydelete";
            SqlConnection catdbCon = null;

            SqlCommand cmddeleteCategory = null;

            try
            {
                catdbCon = StoreDBConnection.GetConnection(); //new SqlConnection(catdbconnectionstring); 
                catdbCon.Open();

                cmddeleteCategory = new SqlCommand(deleteQuery, catdbCon);

                cmddeleteCategory.Parameters.AddWithValue("@id", catgryId);
                cmddeleteCategory.CommandType = CommandType.StoredProcedure;
                numberOfRowsAffected = cmddeleteCategory.ExecuteNonQuery();
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            finally
            {
                catdbCon.Close();
            }

            return numberOfRowsAffected;
        }
        #endregion delete category
        #endregion Public metords



    }


}
