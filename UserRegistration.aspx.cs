using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RoomMateWebsite
{
    public partial class UserRegistration : System.Web.UI.Page
    {
        UserServiceReference.UserServiceClient UserServiceClient = new UserServiceReference.UserServiceClient("BasicHttpBinding_IUserService");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }
        [System.Web.Services.WebMethod]
        public static string SignUp(string fullname, string email, string phone, string pswd)
        {
            string msg = string.Empty;
            string[] msgs = null;
            try
            {
                UserServiceReference.UserServiceClient user = new UserServiceReference.UserServiceClient();
                msg = user.SignUp(fullname, email, phone, pswd);
                msgs = msg.Split('&');
                Page P = new Page();
                P.Session["User_id"] = msgs[1];
            }
            catch(Exception e)
            {
                msg = e.Message;
            }
            return msgs[0];
        }
        [System.Web.Services.WebMethod]
        public static string AddPreferences(string preferences)
        {
            string msg = string.Empty;
            Page P = new Page();
            string user_id = P.Session["User_id"].ToString();
            try
            {
                UserServiceReference.UserServiceClient user = new UserServiceReference.UserServiceClient();
                msg = user.AddPreferences(user_id, preferences);
            }
            catch(Exception e)
            {
                msg = e.Message;
            }
            return msg;
        }
    }
}