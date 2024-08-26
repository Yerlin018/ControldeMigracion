using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControldeMigracion
{
    public partial class Salir : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void bacepar_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void batras_Click(object sender, EventArgs e)
        {
            Response.Redirect("inicio.aspx");
        }
    }
}
