<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="ControldeMigracion.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="CSS/login.css" rel="stylesheet" />
	<title>Login</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-wrap">
	<div class="login-html">
		&nbsp;<div class="login-form">
	        <div class="auto-style2">
        <div>
                <h1 class="titulo-ingreso">Ingreso de Sistema migratorio</h1>
        </div>

                <div class="page">
  <div class="container">
    <div class="left">
      <div class="login">Ingreso</div>
      <div class="eula">Estimado usuario, debe indentificarse con la clave y su contraseña en el espacion asignado.</div>
    </div>
    <div class="right">
      <svg viewBox="0 0 320 300">
        <defs>
          <linearGradient
                          inkscape:collect="always"
                          id="linearGradient"
                          x1="13"
                          y1="193.49992"
                          x2="307"
                          y2="193.49992"
                          gradientUnits="userSpaceOnUse">
            <stop
                  style="stop-color:#ff00ff;"
                  offset="0"
                  id="stop876" />
            <stop
                  style="stop-color:#ff0000;"
                  offset="1"
                  id="stop878" />
          </linearGradient>
        </defs>
        <path d="m 40,120.00016 239.99984,-3.2e-4 c 0,0 24.99263,0.79932 25.00016,35.00016 0.008,34.20084 -25.00016,35 -25.00016,35 h -239.99984 c 0,-0.0205 -25,4.01348 -25,38.5 0,34.48652 25,38.5 25,38.5 h 215 c 0,0 20,-0.99604 20,-25 0,-24.00396 -20,-25 -20,-25 h -190 c 0,0 -20,1.71033 -20,25 0,24.00396 20,25 20,25 h 168.57143" />
      </svg>




      <div class="form">
           <label for="Tusuario">Usuario</label>
          <asp:TextBox ID="Tusuario" runat="server"></asp:TextBox>
       
       
        <label for="Tcontraseña">Contraseña</label>
          <asp:TextBox ID="Tcontraseña" type="password" runat="server"></asp:TextBox>
          <asp:Button  ID="bingresar" runat="server" Text="Ingresar" OnClick="bingresar_Click"/>
          <asp:Label ID="Lmensaje" runat="server" Text="  "></asp:Label>
      </div>
    </div>
  </div>
</div>
			</div>
		</div>
	</div>
</div>

    </form>
</body>
</html>
