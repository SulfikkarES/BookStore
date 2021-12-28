<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login1.aspx.cs" Inherits="AdminLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>TeamRally</title>
    <link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet"> 
    <link href="Styles/style.css" rel="stylesheet">
   
</head>
<body>
    <form id="form1" runat="server">
        <div>
            



 
  
  <div class="tr_login">
  
  			<div class="tr_loginmain">
            <h1>User Login</h1>
            <ul>
                <li class="username">    
                </li>
                    <li>
                        <asp:TextBox ID="Username" name="Username" placeholder="Username" type="text" runat="server"></asp:TextBox>
                    </li>
                    <li>
                        <asp:TextBox ID="txtPassword" name="Password" placeholder="Password" type="password" runat="server"></asp:TextBox>
                        </li>
                    <li class="tr_lgnbtn">
                        
                        <asp:Button ID="btnLogin" runat="server" Text="LOGIN" />
                       </li>
                       <li class="forgot_password">
                       	<a href="#">Forgot Password</a>
                       </li>

           </ul>
        </div>
    
  </div><!--tr_login-->
  
  <p class="login_copy">
  
  			<a href="#">&copy 2016.  All rights reserved.</a>
  	
  </p>



        </div>
    </form>
</body>
</html>
