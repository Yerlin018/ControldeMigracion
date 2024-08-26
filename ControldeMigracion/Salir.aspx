<%@ Page Title="" Language="C#" MasterPageFile="~/Pagina.Master" AutoEventWireup="true" CodeBehind="Salir.aspx.cs" Inherits="ControldeMigracion.Salir" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


        <br />
    <br />
    <br />
    <br />
    <div class="auto-style1">   
        <asp:Label ID="Label1" runat="server" Text="¿Desea Salir?"></asp:Label>
    </div>
    <div>
        <p class="auto-style1">
            <asp:Button ID="bacepar" runat="server" Text="Aceptar" OnClick="bacepar_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="batras" runat="server" Text="Atras" OnClick="batras_Click" />
        </p>
        </div>
</asp:Content>
