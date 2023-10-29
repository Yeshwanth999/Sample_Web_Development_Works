using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

namespace RoomMateWebsite
{
    public partial class HomePage : System.Web.UI.Page
    {
        UserServiceReference.UserServiceClient UserServiceClient = new UserServiceReference.UserServiceClient("BasicHttpBinding_IUserService");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
        }
        [System.Web.Services.WebMethod]
        public static string GetSessionValues()
        {
            string msg = string.Empty;
            Page p = new Page();
            if(p.Session.Keys.Count != 0)
            {
                msg = p.Session["userName"].ToString();
            }
            else
            {
                msg = "Session Expired";
            }
            return msg;
            
        }
        [System.Web.Services.WebMethod]
        public static ArrayList GetCities()
        {
            ArrayList Cities = new ArrayList();
            try
            {
                UserServiceReference.UserServiceClient userClient = new UserServiceReference.UserServiceClient();
                var citylist = userClient.GetCities();
                foreach (var c in citylist)
                {
                    UserServiceReference.Cities ct = new UserServiceReference.Cities();
                    ct.city = c.city;
                    ct.city_id = c.city_id;
                    ct.state = c.state;
                    Cities.Add(ct);
                }
            }
            catch(Exception e)
            {
                throw e;
            }
            return Cities;
        }
        [System.Web.Services.WebMethod]
        public static string LogOut()
        {
            string msg = string.Empty;
            Page p = new Page();
            if (p.Session.Keys.Count > 0)
            {
                p.Session.Clear();
                msg = "cleared";
            }
            return msg;
        }


    }
}