using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControldeMigracion
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LlenarGrid();
            }
        }

        protected void LlenarGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT IdRegistro, IdPasajero, FechaEntrada, FechaSalida, LugarEntrada, LugarSalida FROM ENTRADA_SALIDA"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                        }
                    }
                }
            }
        }

        protected void Bregitrar_Click(object sender, EventArgs e)
        {
            // Validar completos
            if (string.IsNullOrEmpty(Tidpasajero.Text) || string.IsNullOrEmpty(Tfechasalida.Text) ||
                string.IsNullOrEmpty(Tfechaentrada.Text) || string.IsNullOrEmpty(Tlugardestino.Text) ||
                string.IsNullOrEmpty(Tlugarregreso.Text))
            {
                Lmensaje.Text = "Por favor, complete todos los campos.";
                return;
            }

            // Validar IdPasajero
            int idPasajero;
            if (!int.TryParse(Tidpasajero.Text, out idPasajero))
            {
                Lmensaje.Text = "El ID de pasajero debe ser un valor numérico.";
                return;
            }

            // Validar el formato de las fechas
            DateTime fechaEntrada, fechaSalida;
            if (!DateTime.TryParse(Tfechaentrada.Text, out fechaEntrada) || !DateTime.TryParse(Tfechasalida.Text, out fechaSalida))
            {
                Lmensaje.Text = "Las fechas deben estar en un formato válido (yyyy-MM-dd).";
                return;
            }

            string s = System.Configuration.ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            using (SqlConnection conexion = new SqlConnection(s))
            {
                try
                {
                    conexion.Open();
                    string query = $"INSERT INTO ENTRADA_SALIDA (IdPasajero, FechaEntrada, FechaSalida, LugarEntrada, LugarSalida) " +
                                   $"VALUES ({idPasajero}, '{fechaEntrada:yyyy-MM-dd}', '{fechaSalida:yyyy-MM-dd}', '{Tlugardestino.Text}', '{Tlugarregreso.Text}')";

                    using (SqlCommand comando = new SqlCommand(query, conexion))
                    {
                        comando.ExecuteNonQuery();
                    }

                    // Limpiar campos después de la inserción
                    Tidpasajero.Text = "";
                    Tfechasalida.Text = "";
                    Tfechaentrada.Text = "";
                    Tlugardestino.Text = "";
                    Tlugarregreso.Text = "";

                    // Opcional: actualizar el GridView si estás usando uno
                    LlenarGrid();

                    // Mensaje de éxito
                    Lmensaje.Text = "Registro agregado con éxito.";
                }
                // Mensaje de error por aquello de que no se respete FK
                catch (SqlException error)
                {
                    Lmensaje.Text = "Error al agregar el registro, Posiblemente no se haya realido la inscripcion como pasajero o no esté igresando su ID correcto " + error.Message;
                }
            }
        }

        protected void Beliminar_Click(object sender, EventArgs e)
        {
            int idpasajero;
            if (!int.TryParse(Tidpasajero.Text, out idpasajero))
            {
                Lmensaje.Text = "El ID del pasajero es un valor numérico, digitar correctamente.";
                return;
            }
            else
            {
                String s = System.Configuration.ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
                SqlConnection conexion = new SqlConnection(s);
                conexion.Open();
                SqlCommand comando = new SqlCommand(" DELETE ENTRADA_SALIDA WHERE IdPasajero = '" + Tidpasajero.Text + "' ", conexion);
                comando.ExecuteNonQuery();
                conexion.Close();
                LlenarGrid();
            }

        }

        //protected void Bmodificar_Click(object sender, EventArgs e)
        //{
        //   
        //    // Validar el formato de las fechas
        //    DateTime fechaEntrada, fechaSalida;
        //    if (!DateTime.TryParseExact(Tfechaentrada.Text, "yyyy-MM-dd", null, System.Globalization.DateTimeStyles.None, out fechaEntrada) ||
        //        !DateTime.TryParseExact(Tfechasalida.Text, "yyyy-MM-dd", null, System.Globalization.DateTimeStyles.None, out fechaSalida))
        //    {
        //        Lmensaje.Text = "Las fechas deben estar en el formato válido (yyyy-MM-dd).";
        //        return;
        //    }
        //    // Conexión y actualización en la base de datos
        //    string s = System.Configuration.ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
        //    using (SqlConnection conexion = new SqlConnection(s))
        //    {
        //        try
        //        {
        //            conexion.Open();
        //            // Asegúrate de que IdRegistro es el campo correcto o cambia a IdPasajero si es necesario
        //            string query = $"UPDATE ENTRADA_SALIDA SET FechaEntrada = '{fechaEntrada:yyyy-MM-dd}', FechaSalida = '{fechaSalida:yyyy-MM-dd}', " +
        //                           $"LugarEntrada = '{Tlugardestino.Text}', LugarSalida = '{Tlugarregreso.Text}' " +
        //                           $"WHERE IdRegistro = {idPasajero}";

        //            using (SqlCommand comando = new SqlCommand(query, conexion))
        //            {
        //                comando.ExecuteNonQuery();
        //            }

        //            // Limpiar campos después de la actualización
        //            Tidpasajero.Text = "";
        //            Tfechasalida.Text = "";
        //            Tfechaentrada.Text = "";
        //            Tlugardestino.Text = "";
        //            Tlugarregreso.Text = "";

        //            // Actualizar el GridView si estás usando uno
        //            LlenarGrid();

        //            // Mensaje de éxito
        //            Lmensaje.Text = "Registro actualizado con éxito.";
        //        }
        //        catch (SqlException ex)
        //        {
        //            Lmensaje.Text = "Error al actualizar el registro: " + ex.Message;
        //        }
        //    }
        //}

        protected void Bmodificar_Click(object sender, EventArgs e)
        {
            // Validar campos completos
            if (string.IsNullOrEmpty(Tidpasajero.Text) || string.IsNullOrEmpty(Tfechasalida.Text) ||
                string.IsNullOrEmpty(Tfechaentrada.Text) || string.IsNullOrEmpty(Tlugardestino.Text) ||
                string.IsNullOrEmpty(Tlugarregreso.Text))
            {
                Lmensaje.Text = "Debe complete todos los campos.";
                return;
            }

            // Validar IdPasajero
            int idPasajero;
            if (!int.TryParse(Tidpasajero.Text, out idPasajero))
            {
                Lmensaje.Text = "El ID de pasajero debe ser un  número.";
                return;
            }
            // Conexión a la base de datos
            string s = System.Configuration.ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            using (SqlConnection conexion = new SqlConnection(s))
            {
                try
                {
                    conexion.Open();

                    // Consulta de actualización
                    string query = $"UPDATE ENTRADA_SALIDA SET FechaEntrada = '{Tfechaentrada.Text}', FechaSalida = '{Tfechasalida.Text}', " +
                                   $"LugarEntrada = '{Tlugardestino.Text}', LugarSalida = '{Tlugarregreso.Text}' " +
                                   $"WHERE IdPasajero = {Tidpasajero.Text}";

                    using (SqlCommand comando = new SqlCommand(query, conexion))
                    {
                        comando.ExecuteNonQuery();
                    }

                    // Limpiar los campos
                    Tidpasajero.Text = "";
                    Tfechasalida.Text = "";
                    Tfechaentrada.Text = "";
                    Tlugardestino.Text = "";
                    Tlugarregreso.Text = "";

                    // Actualizar el GridView
                    LlenarGrid();

                    // Mensaje de éxito
                    Lmensaje.Text = "Registro actualizado con éxito.";
                }
                catch (SqlException ex)
                {
                    Lmensaje.Text = "Error al actualizar el registro: " + ex.Message;
                }
            }
        }

    }
}


            