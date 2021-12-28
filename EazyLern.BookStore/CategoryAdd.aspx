<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/BookStore.Master" AutoEventWireup="true" CodeBehind="CategoryAdd.aspx.cs" Inherits="EazyLern.BookStore.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        &nbsp;</p>
    <p>
&nbsp;<h3>New Category</h3>
    <asp:Label ID="lblId" runat="server" Text="Enter Categoty ID"></asp:Label>
    <asp:TextBox ID="txtID" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="lblName" runat="server" Text="Enter Catagory Name"></asp:Label>
    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
    </p>
    <p>
    </p>
    <p>
        &nbsp;</p>
    <p>
    </p>
    <p>
       &nbsp <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save" />
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
