#region Copyright EazyLearn
//
// All rights are reserved. Reproduction or transmission in whole or in part, 
// in any form or by any means, electronic, mechanical or otherwise, is
// prohibited without the prior written consent of the copyright owner.
//
// Filename        : Customer.cs    
// Purpose         : To create customer object 

// Creation Date   : 19-11-2021
// Author          : Sulfikkar E.S
//
// Change History  :
// Changed by      :              
// Date            : 
// Purpose         :
//
#endregion

#region Name spaces
using EazyLearn.BookStore.Components;
using EazyLern.BookStore.Components;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

#endregion

namespace EazyLearn.BookStore.Components
{
    public class Customer
    {
        #region Public Properties

        /// <summary>
        /// gets or sets the customer name
        /// </summary>
        public string CustomerName
        {
            get;
            set;
        }

        /// <summary>
        /// gets or sets the address of the customer
        /// </summary>
        public string Address
        {
            get;
            set;
        }

        /// <summary>
        /// gets or set the phone number of the customer
        /// </summary>
        public string PhoneNumber
        {
            get;
            set;
        }

        /// <summary>
        /// gets or sets the email id of the customer
        /// </summary>
        public string Email
        {
            get;
            set;
        }

        /// <summary>
        /// gets or sets the state from which the customer is coming
        /// </summary>
        public string State
        {
            get;
            set;
        }

        /// <summary>
        /// gets or sets the zip code of the customer
        /// </summary>
        public string Zip
        {
            get;
            set;
        }

        /// <summary>
        /// gets or sets the city of the customer
        /// </summary>
        public string City
        {
            get;
            set;
        }

        /// <summary>
        /// gets or sets the customer user name
        /// </summary>
        public string CustomerUserName
        {
            get;
            set;
        }


        /// <summary>
        /// gets or sets the password of the customer
        /// </summary>
        public string Password
        {
            get;
            set;
        }

        /// <summary>
        /// gets or sets the status of deletion of customer details in customer table (1 or 0)
        /// </summary>
        public int IsDeleted
        {
            get;
            set;
        }

        #endregion

        #region Public Methods

        #region Insert Methods

        /// <summary>
        /// inserts customer details like name, address, phone, email,state, zip, city, password, isdeleted
        /// </summary>
        /// <returns>int - number of rows affected</returns>
        public int InsertCustomerDetails()
        {
            int numberOfRowsAffected;

            string insertQuery = "procCustomerInsert";

            SqlConnection connectionObj = null;
            SqlCommand cmd = null;

            try
            {
                connectionObj = StoreDBConnection.GetConnection();
                connectionObj.Open();

                cmd = new SqlCommand(insertQuery, connectionObj);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = this.CustomerName;
                cmd.Parameters.Add("@address", SqlDbType.VarChar).Value = this.Address;
                cmd.Parameters.Add("@phone", SqlDbType.Char).Value = this.PhoneNumber;
                cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = this.Email;
                cmd.Parameters.Add("@state", SqlDbType.VarChar).Value = this.State;
                cmd.Parameters.Add("@city", SqlDbType.VarChar).Value = this.City;
                cmd.Parameters.Add("@zip", SqlDbType.VarChar).Value = this.Zip;
                cmd.Parameters.Add("@username", SqlDbType.VarChar).Value = this.CustomerUserName;
                cmd.Parameters.Add("@password", SqlDbType.VarChar).Value = this.Password;

                numberOfRowsAffected = cmd.ExecuteNonQuery();
            }
            catch (SqlException ex)
            {

                throw ex;
            }
            finally
            {
                connectionObj.Close();
            }
            return numberOfRowsAffected;
        }
        #endregion

        #region List Methods

        public DataTable GetUserPassword()
        {
            SqlCommand cmdObj = new SqlCommand();
            SqlConnection conObj = null;
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter();

            try
            {
                conObj = StoreDBConnection.GetConnection(); ;
                conObj.Open();

                cmdObj = new SqlCommand("procCustomerByEmailPasswordOutput", conObj);
                cmdObj.Parameters.Add(new SqlParameter("@email", this.Email));
                cmdObj.CommandType = CommandType.StoredProcedure;
                da.SelectCommand = cmdObj;
                da.Fill(dt);
            }
            catch (SqlException ex)
            {

                throw ex;
            }
            finally
            {
                conObj.Close();
            }
            return dt;
        }
        #endregion

        #region Insert Methods


        public int GetCustomerLoginCheck()
        {
            int count = 0;

            //string perdbconnectionstring = "Data Source=el-iib-0\\SQLEXPRESS2017;Initial Catalog=dbsPersonManagementSystemSulfikkar;user id=sa;password=L0ncok#08L0ncok#08";
            string SelectQuery = "prcuserlogincount1";

            SqlConnection admindbCon = null;
            SqlCommand cmdCountAdmin = null;

            try
            {
                admindbCon = StoreDBConnection.GetConnection(); //new SqlConnection(perdbconnectionstring);
                admindbCon.Open();

                cmdCountAdmin = new SqlCommand(SelectQuery, admindbCon);
                cmdCountAdmin.Parameters.AddWithValue("@name", this.CustomerUserName);
                cmdCountAdmin.Parameters.AddWithValue("@password", this.Password );
                //cmdCountAdmin.Parameters.Add(new SqlParameter("ecount", SqlDbType.Int));
                //cmdCountAdmin.Parameters["@ecount"].Direction = ParameterDirection.Output;

                cmdCountAdmin.CommandType = CommandType.StoredProcedure;

                count = Convert.ToInt32(cmdCountAdmin.ExecuteScalar());



            }
            catch (SqlException ex)
            {
                throw ex;
            }
            finally
            {
                admindbCon.Close();
            }
            return count;
        }
        #endregion

        #endregion
    }
}
