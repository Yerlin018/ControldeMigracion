<%@ Page Title="" Language="C#" MasterPageFile="~/Pagina.Master" AutoEventWireup="true" CodeBehind="RegistroSalidaEntrada.aspx.cs" Inherits="ControldeMigracion.Registro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div> <h1 class="auto-style1">Registro salida y entrada</h1>
      <p class="auto-style1">&nbsp;</p>
      <p class="auto-style1">&nbsp;</p>
</div>  
    <div>   
    <asp:GridView ID="GridView1" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" AutoGenerateColumns="False">
    <Columns>
        <asp:BoundField DataField="IdRegistro" HeaderText="IdRegistro" />
        <asp:BoundField DataField="IdPasajero" HeaderText="IdPasajero" />
        <asp:BoundField DataField="LugarEntrada" HeaderText="LugarEntrada" />
        <asp:BoundField DataField="LugarSalida" HeaderText="LugarSalida" />
        <asp:BoundField DataField="FechaEntrada" HeaderText="FechaEntrada"
                        DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="false" />
        <asp:BoundField DataField="FechaSalida" HeaderText="FechaSalida"
                        DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="false" />
    </Columns>
    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
    <SortedAscendingCellStyle BackColor="#FFF1D4" />
    <SortedAscendingHeaderStyle BackColor="#B95C30" />
    <SortedDescendingCellStyle BackColor="#F1E5CE" />
    <SortedDescendingHeaderStyle BackColor="#93451F" />
</asp:GridView>

    </div>

    <div>
        <h3>Realice su registro de entrada y salida</h3>

    </div>
    <div>   

        ID Pasajero&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="Tidpasajero" runat="server"></asp:TextBox>
        <br />
        Fecha de Salida&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="Tfechasalida" type="Date" runat="server"></asp:TextBox>
&nbsp;<br />
        Fecha de Entrada
        <asp:TextBox ID="Tfechaentrada" type="Date"  runat="server"></asp:TextBox>
        <br />
        Lugar de Destino&nbsp;
        <asp:TextBox ID="Tlugardestino" runat="server"></asp:TextBox>
        <br />
        Lugar de Regreso
        <asp:TextBox ID="Tlugarregreso" runat="server"></asp:TextBox>
<div>
    <asp:Label ID="Lmensaje" runat="server" ForeColor="Red" Text=" "></asp:Label>
</div>
            

    </div>
    <asp:Button ID="Bregitrar" runat="server" Text="Registrar" OnClick="Bregitrar_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Beliminar" runat="server" Text="Eliminar" OnClick="Beliminar_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Bmodificar" runat="server" Text="Modificar" OnClick="Bmodificar_Click" />
</asp:Content>
