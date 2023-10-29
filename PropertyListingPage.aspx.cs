using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

namespace RoomMateWebsite
{
    public partial class PropertyListingPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }
        [System.Web.Services.WebMethod]
        public static ArrayList GetPropertiesByCityId(string city_id)
        {
            ArrayList Properties = new ArrayList();
            try
            {
                UserServiceReference.UserServiceClient userClient = new UserServiceReference.UserServiceClient();
                var properties = userClient.GetPropertiesByCityId(city_id);
                foreach (var p in properties)
                {
                    UserServiceReference.Property P = new UserServiceReference.Property();
                    P.property_id = p.property_id;
                    P.user_id = p.user_id;
                    P.city_id = p.city_id;
                    P.owner_name = p.owner_name;
                    P.location = p.location;
                    P.appro_rent = p.appro_rent;
                    P.looking_for = p.looking_for;
                    P.occupancy = p.occupancy;
                    Properties.Add(p);
                }
            }
            catch (Exception e)
            {
                throw e;
            }
            return Properties;
        }
        [System.Web.Services.WebMethod]
        public static ArrayList GetProperties()
        {
            ArrayList Properties = new ArrayList();
            try
            {
                UserServiceReference.UserServiceClient userClient = new UserServiceReference.UserServiceClient();
                var properties = userClient.GetProperties();
                foreach (var p in properties)
                {
                    UserServiceReference.Property P = new UserServiceReference.Property();
                    P.property_id = p.property_id;
                    P.user_id = p.user_id;
                    P.city_id = p.city_id;
                    P.owner_name = p.owner_name;
                    P.location = p.location;
                    P.appro_rent = p.appro_rent;
                    P.looking_for = p.looking_for;
                    P.occupancy = p.occupancy;
                    Properties.Add(p);
                }
            }
            catch (Exception e)
            {
                throw e;
            }
            return Properties;
        }
        
    }
}