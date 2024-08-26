using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ControldeMigracion.Clases;

namespace ControldeMigracion
{
    public partial class Inscripciones : System.Web.UI.Page
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
                using (SqlCommand cmd = new SqlCommand("SELECT IdPasajero, Nombre, Apellido, NumPasaporte, Nacionalidad FROM PASAJEROS"))
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

        protected void Binscribir_Click(object sender, EventArgs e)
        {

            // Validar  completos
            if (string.IsNullOrEmpty(tnombre.Text) || string.IsNullOrEmpty(tapellido.Text) ||
                string.IsNullOrEmpty(tnumpasaporte.Text) || string.IsNullOrEmpty(tnacionalidad.Text))
            {
                Lmensaje.Text = "Por favor, complete todos los campos.";
                return;
            }

            // Validar que el número de pasaporte sea un valor numérico
            int numPasaporte;
            if (!int.TryParse(tnumpasaporte.Text, out numPasaporte))
            {
                Lmensaje.Text = "El número de pasaporte debe ser un valor numérico.";
                return;
            }
            
            String s = System.Configuration.ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);
            conexion.Open();
            SqlCommand comando = new SqlCommand("INSERT INTO PASAJEROS(Nombre, Apellido, NumPasaporte, Nacionalidad) VALUES('" + tnombre.Text + "','" + tapellido.Text + "' ,  " + int.Parse(tnumpasaporte.Text) + ", '" + tnacionalidad.Text + "')", conexion);
            comando.ExecuteNonQuery();
                    
            conexion.Close();
            tnombre.Text = "";
            tapellido.Text = "";
            tnumpasaporte.Text = "";
            tnacionalidad.Text = "";
            LlenarGrid();
        }

        protected void Beliminar_Click(object sender, EventArgs e)
        {
            int idpasajero;
            if (!int.TryParse(tidpasajero.Text, out idpasajero))
            {
                Lmensaje.Text = "El ID del pasajero es un valor numérico, insertar correctamente.";
                return;
            }
            else
            {
                String s = System.Configuration.ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
                SqlConnection conexion = new SqlConnection(s);
                conexion.Open();
                SqlCommand comando = new SqlCommand(" DELETE PASAJEROS WHERE IdPasajero = '" + tidpasajero.Text + "' ", conexion);
                comando.ExecuteNonQuery();
                conexion.Close();
                LlenarGrid();
            }

        }

        protected void Bactualizar_Click(object sender, EventArgs e)
        {
            string s = System.Configuration.ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            using (SqlConnection conexion = new SqlConnection(s))
            {
                conexion.Open();

                string query = "UPDATE PASAJEROS " +
                               "SET Nombre = '" + tnombre.Text + "', " +
                               "    Apellido = '" + tapellido.Text + "', " +
                               "    NumPasaporte = " + int.Parse(tnumpasaporte.Text) + ", " +
                               "    Nacionalidad = '" + tnacionalidad.Text + "' " +
                               "WHERE IdPasajero = " + int.Parse(tidpasajero.Text);

                using (SqlCommand comando = new SqlCommand(query, conexion))
                {
                    comando.ExecuteNonQuery();
                }
            }

            tnombre.Text = "";
            tapellido.Text = "";
            tnumpasaporte.Text = "";
            tnacionalidad.Text = "";
            LlenarGrid(); 
        }


    }
}
