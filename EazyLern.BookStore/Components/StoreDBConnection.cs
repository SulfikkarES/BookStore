#region Copyright EazyLearn
//
// All rights are reserved. Reproduction or transmission in whole or in part, 
// in any form or by any means, electronic, mechanical or otherwise, is
// prohibited without the prior written consent of the copyright owner.
//
// Filename        : Payment.cs    
// Purpose         : To create customer payment class

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
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
#endregion

namespace EazyLern.BookStore.Components
{
    public class StoreDBConnection
    {
        #region Public Static Properties

        /// <summary>
        /// Connection string
        /// </summary>
        public static string bssConnectionString
        {
            get;
            set;
        }
        #endregion Public Static Properties

        #region Public Static Methods

        /// <summary>
        /// To create database object for database connection
        /// </summary>
        /// <returns>Connection object</returns>

        public static SqlConnection GetConnection()
        {
            SqlConnection conObj;

            bssConnectionString = ConfigurationManager.ConnectionStrings["BookStore"].ConnectionString; //"Data Source=el-iib-0\\SQLEXPRESS2017;Initial Catalog=dboBookStoreSulfikkar;user id=sa;password=L0ncok#08L0ncok#08";
            conObj = new SqlConnection(bssConnectionString);

            return conObj;
        }
        #endregion
    }
}