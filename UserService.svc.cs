using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using DataAccess;
using DomainModel;
using Business;

namespace RoomMateServices
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "UserService" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select UserService.svc or UserService.svc.cs at the Solution Explorer and start debugging.
    public class UserService : IUserService
    {
        public void DoWork()
        {
        }
        public Property GetPropertyByPropertyId(string property_id)
        {
            return UserBLL.GetPropertyByPropertyId(property_id);
        }
        public List<Property> GetPropertiesByCityId(string city_id)
        {
            return UserBLL.GetPropertiesByCityId(city_id);
        }
        public List<Property> GetProperties()
        {
            return UserDAL.GetProperties();
        }
        public string AddListing(string user_id, string city_id, string owner_name, string location, int appro_rent, string occupancy, string looking_for, string pictures, string amenities, string description, string available_from)
        {
            return UserBLL.AddListing(user_id, city_id, owner_name, location, appro_rent, occupancy, looking_for, pictures, amenities, description, available_from);
        }
        public string GetUserPhoneByUserId(string user_id)
        {
            return UserBLL.GetUserPhoneByUserId(user_id);
        }
        public List<Cities> GetCityRecommendations(string hint)
        {
            return UserBLL.GetCityRecommendations(hint);
        }
        public string AddPreferences(string user_id, string preferences)
        {
            return UserBLL.AddPreferences(user_id, preferences);
        }
        public List<Cities> GetCities()
        {
            return UserBLL.GetCities();
        }
        public string SignUp(string fullname, string email, string phone, string pswd)
        {
            string msg = string.Empty;
            msg = UserBLL.SignUp(fullname, email, phone, pswd);
            return msg;
        }
        public User GetUserByPhone(string phone, string password)
        {
            return UserBLL.GetUserByPhone(phone, password);
        }
        public string Random()
        {
            return "HI";
        }
    }
}
