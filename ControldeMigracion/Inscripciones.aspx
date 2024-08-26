<%@ Page Title="" Language="C#" MasterPageFile="~/Pagina.Master" AutoEventWireup="true" CodeBehind="Inscripciones.aspx.cs" Inherits="ControldeMigracion.Inscripciones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>     <h1 class="auto-style1">Inscripción de Pasajeros</h1>
   </div>
      <div>     <h3 class="auto-style1">&nbsp;</h3>
          <h3 class="auto-style1">Estimado(a) usuario, cada pasajero debe inscribirse en esta sección antes del abordaje de su avión.</h3>
            <h3 class="auto-style1">Si desea eliminar su inscripción basta con digitar correctamente su Id de Pasajero.</h3>
          <p class="auto-style1">&nbsp;</p>
  </div>
    <div>
   
        <asp:GridView ID="GridView1" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
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
                    <div>
    <div class="mb-3">
        <label class="form-label">IdPasajero  </label>
        <asp:TextBox class="form-control" ID="tidpasajero" AutoComplete type="int" runat="server"></asp:TextBox>
    </div>

    <br />
    <div class="mb-3">
        <label class="form-label">Nombre  </label>
        <asp:TextBox class="form-control" ID="tnombre" runat="server"></asp:TextBox>
    </div>
    <br />
    <div class="mb-3">
        <label class="form-label">Apellido  </label>
        <asp:TextBox class="form-control" ID="tapellido" runat="server"></asp:TextBox>
    </div>
    <br />

    <div class="mb-3">
        <label class="form-label">Numero de Pasaporte  </label>
        <asp:TextBox class="form-control" ID="tnumpasaporte" type="int" runat="server"></asp:TextBox>
    </div>
    <br />

<div class="mb-3">
       <label class="form-label">Nacionalidad&nbsp;&nbsp;  </label>
       <asp:TextBox class="form-control" ID="tnacionalidad" runat="server"></asp:TextBox>
</div>
    <br />
<div>   
<%--    <asp:Label ID="Lmensaje" runat="server" Text=" "></asp:Label>--%>
    <asp:Label ID="Lmensaje" runat="server" ForeColor="Red" Text=" "></asp:Label>
    <asp:Label ID="Lid" runat="server" ForeColor="Red" Text=" "></asp:Label>

</div>
   
    <br />
     <div>
       <br />
            
    </div>
         <asp:Button ID="Binscribir" class="btn btn-outline-primary" runat="server" Text="Inscribir" OnClick="Binscribir_Click" />
          <asp:Button ID="Beliminar" class="btn btn-outline-danger" runat="server" Text="Eliminar" OnClick="Beliminar_Click" />
          <asp:Button ID="Bactualizar" class="btn btn-outline-primary" runat="server" Text="Modificar" OnClick="Bactualizar_Click" />
     </div>
    </div>
    </asp:GridView>
</asp:Content>
