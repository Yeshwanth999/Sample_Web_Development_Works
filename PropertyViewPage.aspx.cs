using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

namespace RoomMateWebsite
{
    public partial class PropertyViewPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UserServiceReference.UserServiceClient UserServiceClient = new UserServiceReference.UserServiceClient("BasicHttpBinding_IUserService");
            if (!IsPostBack)
            {
                Page p = new Page();
                if (p.Session.Keys.Count == 0)
                {
                    Response.Redirect("PropertyListingPage.aspx");
                }
            }
        }
        [System.Web.Services.WebMethod]
        public static Array GetPropertyByPropertyId(string property_id)
        {
            string[] prop;
            try
            {
                UserServiceReference.UserServiceClient userClient = new UserServiceReference.UserServiceClient();
                UserServiceReference.Property p = userClient.GetPropertyByPropertyId(property_id);
                prop = new string[] { p.owner_name, p.location, p.appro_rent.ToString(), p.looking_for, p.occupancy, p.preferences, p.amenities, p.description};
            }
            catch (Exception e)
            {
                throw e;
            }
            return prop;
        }
    }
}