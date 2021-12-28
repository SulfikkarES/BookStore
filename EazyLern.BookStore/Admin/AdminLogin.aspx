<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="EazyLern.BookStore.Admin.AdminLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet"> 
    <link href="../Styles/style.css" rel="stylesheet">
</head>
<body>
    <div class="tr_login"/>
           <div class="tr_loginmain">
                <form id="form1" runat="server">
                    <h2>Admin Login</h2>
                    <ul>
                <li class="username">    
                </li>
                    <li>
                        	<a href="../images/logo.jpg" class="logo"></a> <br /><br />
                        <asp:TextBox class="inputusername" ID="Username" name="Username" placeholder="Username" type="text" runat="server" OnTextChanged="Username_TextChanged"></asp:TextBox><br>

                    </li>
                    <li>
                 
                        <asp:TextBox class="inputpassword" ID="txtPassword" name="Password" placeholder="Password" type="password" runat="server"></asp:TextBox><br>

                    </li>
                    <li>
                   
                        <asp:Button class="tr_lgnbtn" type="button"  runat="server" Text="LOGIN" OnClick="Unnamed1_Click" Width="220px" /><br />
                        <asp:Label ID="lblResult" runat="server" Text=""></asp:Label>
                       </li>
                       <li class="forgot_password">
                       	<a href="#">Forgot Password</a>
                       </li>

                        <li>
                            <br />
                            <br />
                            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">User Login Page</asp:LinkButton>
                        </li>

           </ul>

           
        </div>
        </form>
        </div>
    
</body>
</html>
