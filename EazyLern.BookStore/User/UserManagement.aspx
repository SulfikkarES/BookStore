<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/BookStore.Master" AutoEventWireup="true" CodeBehind="UserManagement.aspx.cs" Inherits="EazyLern.BookStore.User.UserManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <br />
    </p>
    <p>
    </p>
    <p>
        <asp:Label ID="lblBooks" runat="server" Text="Book Details"></asp:Label>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" PageSize="5" AutoGenerateColumns="False">
           
            	<EmptyDataTemplate>
			No books with special prices
		</EmptyDataTemplate>
		<HeaderStyle BackColor="#92B700" ForeColor="White" />
		<PagerStyle HorizontalAlign="Center" />
	
            <Columns>
                <asp:BoundField DataField="boo_title" HeaderText="Title" SortExpression="boo_title" />
                <asp:BoundField DataField="boo_auther" HeaderText="Auther" SortExpression="boo_auther" />
                <asp:BoundField DataField="boo_price" HeaderText="Price" SortExpression="boo_price" />
                <asp:BoundField DataField="boo_special_price" HeaderText="Special Price" SortExpression="boo_special_price" />
                <asp:BoundField DataField="boo_special_price_Status" HeaderText="Special Price Status" SortExpression="boo_special_price_Status" />
            </Columns>
             </asp:GridView>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
</asp:Content>
