<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/BookStore.Master" AutoEventWireup="true" CodeFile="CategoryManagment.aspx.cs" Inherits="EazyLern.BookStore.category_managment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        &nbsp;</p>
<p>
    <asp:Label ID="lbllblResult" runat="server"></asp:Label>
    </p>
<p>
    &nbsp;&nbsp; 
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    </p>
    <p>
        <asp:Label ID="lblUserName" runat="server" Text="Label"></asp:Label>
    </p>
    <p>
    &nbsp;<h3>Category List</h3></p>
<p>
</p>
<p>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</p>
<p>
    &nbsp;</p>
<p>
    <br />
    <asp:GridView ID="gvCategories" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="626px" style="margin-top: 0px; margin-left: 0px;" AutoGenerateColumns="False" CellPadding="10" ForeColor="Black" GridLines="None" Height="211px" OnRowCancelingEdit="gvCategories_RowCancelingEdit" OnRowDeleting="gvCategories_RowDeleting" OnRowEditing="gvCategories_RowEditing" OnRowUpdating="gvCategories_RowUpdating" AllowPaging="True" OnPageIndexChanging="gvCategories_PageIndexChanging" PageSize="7" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px">
        <Columns>
            <asp:BoundField DataField="cat_category_id" HeaderText="Category ID" ReadOnly="True" SortExpression="cat_category_id" />
            <asp:BoundField DataField="cat_category_name" HeaderText="Category Name" SortExpression="cat_category_name" />
            <asp:CommandField ShowEditButton="True" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
        <EmptyDataTemplate>
            recods<br />No Books
        </EmptyDataTemplate>
       
        <EmptyDataTemplate>
				No Books
			</EmptyDataTemplate>

		<HeaderStyle BackColor="#92B700" ForeColor="White" />
		<PagerStyle HorizontalAlign="Center" />
	
    </asp:GridView>
</p>
<p>
    &nbsp;</p>
<p>
    &nbsp;</p>
    <p>
</p>
    <p>
</p>
    <p>
        &nbsp;</p>
    <p>
</p>
    <p>
</p>
    <p>
</p>   
    <p>
</p>
<p>
    <asp:Label ID="lblCategory1" runat="server" Text="Enter Category"></asp:Label>
    <asp:TextBox ID="txtCategoryName" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
</p>
<p>
</p>
<p>
    
</p>
<p>
</p>
<p>
    <asp:Button ID="btnSubmit" runat="server" OnClick="btnAdd_Click" Text="Add New" />
</p>
<p>
    &nbsp;</p>
    <p>
        &nbsp;</p>
<p>
</p>
<p>
</p>
</asp:Content>
