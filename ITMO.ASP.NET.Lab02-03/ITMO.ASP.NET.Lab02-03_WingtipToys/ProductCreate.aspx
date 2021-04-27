<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductCreate.aspx.cs" Inherits="WingtipToys.ProductCreate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <asp:Label ID="LabelProductName" runat="server" AssociatedControlID="ProductName" Text="Product Name:"></asp:Label>
        <br />
        <asp:TextBox ID="ProductName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="ProductNameValidator" runat="server" ErrorMessage="Product name is required" ControlToValidate="ProductName" Display="Dynamic"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="LabelUnitPrice" runat="server" AssociatedControlID="UnitPrice" Text="Price:"></asp:Label>
        <br />
        <asp:TextBox ID="UnitPrice" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="UnitPriceValidator" runat="server" ErrorMessage="Product price is required" Display="Dynamic" ControlToValidate="UnitPrice"></asp:RequiredFieldValidator>
        <asp:RangeValidator ID="UnitPriceRangeValidator" runat="server" ErrorMessage="Price should be grater then zero. Maximum price is 600$" Display="Dynamic" ControlToValidate="UnitPrice" MinimumValue="0,10" MaximumValue="600,00" Type="Currency"></asp:RangeValidator>
        <br />
        <asp:Label ID="ProductCategoryLabel" runat="server" AssociatedControlID="ProductCategoryList" Text="Category: "></asp:Label>
        <asp:DropDownList ID="ProductCategoryList" runat="server" SelectMethod="GetCategories" ItemType="WingtipToys.Data.Models.Category" DataTextField="CategoryName" DataValueField="CategoryID"></asp:DropDownList>
        <asp:RequiredFieldValidator ID="ProductCategoryListValidator" runat="server" ErrorMessage="Category is required" ControlToValidate="ProductCategoryList" EnableClientScript="True" Display="Dynamic"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="ProductDescriptionLabel" runat="server" AssociatedControlID="ProductDescription" Text="Description:"></asp:Label>
        <br />
        <textarea ID="ProductDescription" name="S2" runat="server"></textarea>
        <asp:RegularExpressionValidator ID="ProductDescriptionLengthValidator" runat="server" ControlToValidate="ProductDescription" ErrorMessage="Description should be maximum 500 symbols long" ValidationExpression="^.{0,500}$"></asp:RegularExpressionValidator>
        <asp:RegularExpressionValidator ID="WordsCountValidator" runat="server" ErrorMessage="Description should contain at least 3 words" ValidationExpression="^\s*\S+(?:\s+\S+){2,}\s*$" Display="Dynamic" ControlToValidate="ProductDescription"></asp:RegularExpressionValidator>
        <br />
        <asp:Label ID="LabelImagePath" runat="server" AssociatedControlID="ImagePath" Text="Product image URL:"></asp:Label>
        <br />
        <asp:TextBox ID="ImagePath" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="UrlValidator" runat="server" ControlToValidate="ImagePath" ErrorMessage="Image should be a valid URL" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" Display="Dynamic"></asp:RegularExpressionValidator>
        <asp:CustomValidator ID="ImageExistsValidator" runat="server" ControlToValidate="ImagePath" ErrorMessage="Url should be an existing image" OnServerValidate="ValidationImageExistence" Display="Dynamic"></asp:CustomValidator>
        <br />
        <asp:Button ID="CreateProductButton" runat="server" Text="Button" />
    </div>
</asp:Content>
