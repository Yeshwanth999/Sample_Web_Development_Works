using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RoomMateWebsite
{
    public partial class PreferencePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Page P = new Page();
                if (P.Session.Keys.Count==0)
                {
                    Response.Redirect("UserRegistration.aspx");
                }
            }
        }
    }
}