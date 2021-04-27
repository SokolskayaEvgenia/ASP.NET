<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ITMO.ASP.NET.Lab01_DemoWebForms._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Hello, world!!
        <asp:Literal ID="TitleLiteral" runat="server" Text="Hello from aspnet control"></asp:Literal>
    </h1>
    <div>This is my webforms app</div>


</asp:Content>
