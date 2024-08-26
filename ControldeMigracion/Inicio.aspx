<%@ Page Title="" Language="C#" MasterPageFile="~/Pagina.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="ControldeMigracion.Inicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            text-align: justify;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        </div>

<div style="text-align:center; margin-top:20px;">
    <h1 class="auto-style1">Página oficial de Migracion 2024</h1>
    <%--<img src="Carpeta/volaris.jpg" alt="Img, Volaris(2024)" width="400" style="margin-top:20px;" />--%>
    <img src="Carpeta/volaris.gif" alt="Animación de Votaciones 2024" width="400" style="margin-top:20px;" />


      <h3 style="font-weight: normal;"><em>Bienvenido:&nbsp; <asp:Label ID="Lusuario" runat="server" Text="  "></asp:Label>
                </em>
                <h3 style="font-weight: normal;"><em>Su Email de inscripcion es:&nbsp; <asp:Label ID="Lemail" runat="server" Text="  "></asp:Label>
          </h3>
    <h3 style="font-weight: normal;">Estimado usuario, antes de abordar su avión debe realizar el proceso de inscripción. En caso contrario, no podra abordar.</h3>
    <p style="font-weight: normal;">Estimado usuario(a), para un <strong>correcto abordaje</strong> de su vuelo debe de seguir los siguientes pasos: </p>
    <p style="font-weight: normal;" class="auto-style2">1. Primero debe dirigirse al apartado de inscripcion, e inscribir a todos las personas que abordaran el vuelo, un&nbsp; solo usuario puede inscribir a sus acompañantes.</p>
    <p style="font-weight: normal;" class="auto-style2">2. Luego debe ir al apartado RegistrosSalida&nbsp; y responder los datos que se le solicitan, cada pasajero debe realizar su registro de salida. </p>
    <p style="font-weight: normal;" class="auto-style2">3. Posteriormente, en la pantalla Vuelos puede observar los viajes que se ofrecen e información importate al respecto, Finalmente seleccionar el vuelo que va a tomar. </p>
    <p style="font-weight: normal;">&nbsp;</p>
</div>
        </em>
</asp:Content>
