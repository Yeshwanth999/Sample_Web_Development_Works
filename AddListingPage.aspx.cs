using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

namespace RoomMateWebsite
{
    public partial class AddListingPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Page P = new Page();
                if (P.Session.Keys.Count == 0)
                {
                    Response.Redirect("UserLogin.aspx");
                }
            }
        }
        [System.Web.Services.WebMethod]
        public static string GetUserPhoneByUserId()
        {
            string msg = string.Empty;
            Page P = new Page();
            string user_id = P.Session["user_id"].ToString();
            try
            {
                UserServiceReference.UserServiceClient userClient = new UserServiceReference.UserServiceClient();
                msg = userClient.GetUserPhoneByUserId(user_id);
            }
            catch (Exception e)
            {
                msg = e.Message;
            }
            return msg;
        }
        [System.Web.Services.WebMethod]
        public static ArrayList GetCityRecommendations(String hint)
        {
            ArrayList Cities = new ArrayList();
            try
            {
                UserServiceReference.UserServiceClient userClient = new UserServiceReference.UserServiceClient();
                var citylist = userClient.GetCityRecommendations(hint);
                foreach (var c in citylist)
                {
                    UserServiceReference.Cities ct = new UserServiceReference.Cities();
                    ct.city = c.city;
                    ct.city_id = c.city_id;
                    ct.state = c.state;
                    Cities.Add(ct);
                }
            }
            catch (Exception e)
            {
                throw e;
            }
            return Cities;
        }
        [System.Web.Services.WebMethod]
        public static string AddListing(string city_id, string location, string appro_rent, string occupancy, string looking_for, string pictures, string amenities, string description, string available_from)
        {
            string msg = string.Empty;
            Page P = new Page();
            string user_id = P.Session["user_id"].ToString();
            string owner_name = P.Session["UserName"].ToString();
            try
            {
                UserServiceReference.UserServiceClient userClient = new UserServiceReference.UserServiceClient();
                msg = userClient.AddListing(user_id, city_id, owner_name, location, Convert.ToInt32(appro_rent), occupancy, looking_for, pictures, amenities, description, available_from);
            }
            catch (Exception e)
            {
                msg = e.Message;
            }
            return msg;
        }
    }
}