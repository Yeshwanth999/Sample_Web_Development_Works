using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

namespace RoomMateWebsite
{
    public partial class UserLogin : System.Web.UI.Page
    {
        UserServiceReference.UserServiceClient UserServiceClient = new UserServiceReference.UserServiceClient("BasicHttpBinding_IUserService");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }
        [System.Web.Services.WebMethod]
        public static string SignIn(string phone, string password)
        {
            string msg = string.Empty;
            try
            {
                UserServiceReference.UserServiceClient userClient = new UserServiceReference.UserServiceClient();
                UserServiceReference.User user = userClient.GetUserByPhone(phone, password);
                Page p = new Page();
                if (user.user_guid == null)
                {
                    msg = "Phone number or password is invalid";
                }
                else
                {
                    p.Session["user_id"] = user.user_guid;
                    p.Session["UserName"] = user.fullname;
                }
            }
            catch(Exception e)
            {
                msg = e.Message;
            }
            return msg;
        }

    }
}