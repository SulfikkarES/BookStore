<%@ Page Title="" Language="C#"  AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="EazyLern.BookStore.User.Registration" %>
<html>
    <head>
        <title>New User Registration</title>
        <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet"> 
    <link href="../Styles/style.css" rel="stylesheet">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script>
$(document).ready(function(){
    $(".toggle").click(function(){
        $(".sidebar").toggleClass("main");
		$(".toggle_ico_hide").toggleClass("main");
		$(".sidebar ul li a").toggleClass("main");
		$(".tr_right_content").toggleClass("main");
		
    }); 
});
</script>
    </head>
    <body>
        <form id="regform" runat="server">
    <h3>New User Registration</h3>
    <div class="registration-table-container">

			<div class="adminForm">
			

				<ul>
					<li>
						<label>
							Name :
						</label>
						<input type="text" id="txtName" runat="server" name="Name" />
					</li>

					<li>
						<label>
							Address :
						</label>
						<textarea id="txtAddress" runat="server" name="Address"></textarea>
					</li>
					<li>
						<label>
							Phone :
						</label>
						<input type="number" id="txtPhone" runat="server" name="Phone" />
					</li>
					<li>
						<label>
							Email :
						</label>
						<input type="email" id="txtEmail" runat="server" name="Email" />
					</li>
					<li>
						<label>
							State :
						</label>
						<input type="text" id="txtState" runat="server" name="State" />
					</li>
					<li>
						<label>
							City :
						</label>
						<input type="text" id="txtCity" runat="server" name="City" />
					</li>
					<li>
						<label>
							Zip Code :
						</label>
						<input type="number" id="txtZipCode" runat="server" name="Zip Code" />
					</li>
                    <li>
						<label>
							User Name :
						</label>
						<input type="text" id="txtUserName" runat="server" name="User NameName" />
					</li>

					<li>
						<label>
							Password :
						</label>
						<input type="password" id="txtPassword" runat="server" name="Password" />
					</li>
					<li>
						<label></label>
						<span>
							<input type="button" value="submit" name="submit" id="btnSubmit" runat="server" />
							<input type="button" class="can" value="Cancel" name="cancel" id="btnCancel" runat="server" />
						</span>
					</li>
					<li>
						<label id="txtValidation" runat="server"></label>
						<a href="UserLogin.aspx">Back to Login</a>
					</li>
				</ul>
			</div>
		</div>
            </form>
        </body>
</html>
