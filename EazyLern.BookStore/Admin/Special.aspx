<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/BookStore.Master" AutoEventWireup="true" CodeBehind="Special.aspx.cs" Inherits="EazyLern.BookStore.Admin.Special" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h3>Special Details</h3>
    <asp:GridView ID="gvSpecials" runat="server" AutoGenerateColumns="False" PageSize="10" CellPadding="10" AllowPaging="True" OnPageIndexChanging="gvSpecials_PageIndexChanging">
		<EmptyDataTemplate>
			No books with special prices
		</EmptyDataTemplate>
		<HeaderStyle BackColor="#92B700" ForeColor="White" />
		<PagerStyle HorizontalAlign="Center" />
		<Columns>
			<asp:BoundField DataField="Book Title" HeaderText="Title of Book" />
			<asp:BoundField DataField="Category Name" HeaderText="Category" />
			<asp:BoundField DataField="Book Price" HeaderText="Price" />
			<asp:BoundField DataField="Book Special Price" HeaderText="Special Price" />
		</Columns>
	</asp:GridView>

</asp:Content>
