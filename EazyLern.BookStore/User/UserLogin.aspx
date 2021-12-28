<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="EazyLern.BookStore.User.UserLogin" %>
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
                    <h2>User Login</h2>
                    <ul>
                <li class="username">    
                </li>
                    <li>
                        <a href="../images/logo.jpg" class="logo"></a> <br /><br />
           <br /><br />
                        <asp:TextBox class="inputusername" ID="txtUsername" name="Username"  placeholder="User Name" runat="server"></asp:TextBox>
         
                    </li>
                    <li>
                 
                        <asp:TextBox class="inputpassword" ID="txtPassword" name="Password" placeholder="Password" type="password" runat="server"></asp:TextBox><br>&nbsp;</li>
                        <li>
                 
                    </li>
                        <li>
                 
                        <asp:Button class="tr_lgnbtn" ID="Button1" runat="server" Width="100px" Text=" Login" OnClick="Button1_Click" />

                            &nbsp;
                        <asp:Button ID="Button2" runat="server" Width="100px" Text="Register" OnClick="Button2_Click" />

                            <br />
                            <br />
                            <asp:Label ID="lblUserResult" runat="server"></asp:Label>

                    </li>
                        <li>
                 
                        <br />

                    </li>
                        <li>
                 
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 
                            <asp:LinkButton ID="LinkButton1" Width="180px" runat="server" OnClick="LinkButton1_Click">Admin Login </asp:LinkButton>
                            <br />

                    </li>
                    <li>
                   
                        </li>
                       <li class="forgot_password">
                       	<a href="#">Forgot Password</a>
                       </li>

           </ul>

           
        </div>
        </form>
        </div>
    
</body>
</html>
