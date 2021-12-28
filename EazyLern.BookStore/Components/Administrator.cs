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
using EazyLern.BookStore.Components;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
#endregion

namespace EazyLern.BookStore.Admin
{
    public class Administrator
    {
        #region Public Properties
        /// <summary>
        /// Get Admin Id
        /// </summary>
        public int Admin_Id
            {
                get;
                set;
            }

        /// <summary>
        /// Get Admin USER NAME
        /// </summary>
        public string User_Name
            {
                get;
                set;
            }

        /// <summary>
        /// Get Admin password
        /// </summary>
        public string Password
            {
                get;
                set;
            }
        #endregion

        #region Public Methods

        #region Insert Methods


        public int admninistratorCount()
            {
                int count=0;
              
                //string perdbconnectionstring = "Data Source=el-iib-0\\SQLEXPRESS2017;Initial Catalog=dbsPersonManagementSystemSulfikkar;user id=sa;password=L0ncok#08L0ncok#08";
                string SelectQuery = "prcadminlogincount1";

                SqlConnection admindbCon = null;
                SqlCommand cmdCountAdmin = null;

                try
                {
                    admindbCon = StoreDBConnection.GetConnection(); //new SqlConnection(perdbconnectionstring);
                    admindbCon.Open();

                    cmdCountAdmin = new SqlCommand(SelectQuery, admindbCon);
                    cmdCountAdmin.Parameters.AddWithValue("@name",this.User_Name);
                    cmdCountAdmin.Parameters.AddWithValue("@password",this.Password);
                    //cmdCountAdmin.Parameters.Add(new SqlParameter("ecount", SqlDbType.Int));
                    //cmdCountAdmin.Parameters["@ecount"].Direction = ParameterDirection.Output;
                   
                    cmdCountAdmin.CommandType = CommandType.StoredProcedure;

                 count=Convert.ToInt32(cmdCountAdmin.ExecuteScalar() );
               


            }
                catch (SqlException ex)
                {
                    throw ex;
                }
                finally
                {
                    admindbCon.Close();
                }
                return count ;
            }
        #endregion

        #region insert
        public int InsertAnAdmin()
            {
                int numberOfRowsAffected;
                string admdbconnectionstring = "Data Source=el-iib-0\\SQLEXPRESS2017;Initial Catalog=dboBookStoreSulfikkar;user id=sa;password=L0ncok#08L0ncok#08";
                string insertQuery = "prcadminlogincount1";


                SqlConnection admdbCon = null;

                SqlCommand cmdInsertAdmin = null;

                try
                {
                    admdbCon = new SqlConnection(admdbconnectionstring);//StoreDBConnection.GetConnection();
                    admdbCon.Open();

                    cmdInsertAdmin = new SqlCommand(insertQuery, admdbCon);


                    cmdInsertAdmin.Parameters.AddWithValue("@name", this.User_Name);
                    cmdInsertAdmin.Parameters.AddWithValue("@password", this.Password);
                    cmdInsertAdmin.CommandType = CommandType.StoredProcedure;
                    numberOfRowsAffected = cmdInsertAdmin.ExecuteNonQuery();
                }
                catch (SqlException ex)
                {
                    throw ex;
                }
                finally
                {
                    admdbCon.Close();
                }

                return numberOfRowsAffected;
            }
        #endregion
        #endregion public methords



    }
}