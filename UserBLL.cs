using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DomainModel;
using DataAccess;

namespace Business
{
    public class UserBLL
    {
        public static Property GetPropertyByPropertyId(string property_id)
        {
            return UserDAL.GetPropertyByPropertyId(property_id);
        }
        public static List<Property> GetPropertiesByCityId(string city_id)
        {
            return UserDAL.GetPropertiesByCityId(city_id);
        }
        public static List<Property> GetProperties()
        {
            return UserDAL.GetProperties();
        }
        public static string AddListing(string user_id, string city_id, string owner_name, string location, int appro_rent, string occupancy, string looking_for, string pictures, string amenities, string description, string available_from)
        {
            return UserDAL.AddListing(user_id, city_id, owner_name, location, appro_rent, occupancy, looking_for, pictures, amenities, description, available_from);
        }
        public static string GetUserPhoneByUserId(string user_id)
        {
            return UserDAL.GetUserPhoneByUserId(user_id);
        }
        public static List<Cities> GetCityRecommendations(string hint)
        {
            return UserDAL.GetCityRecommendations(hint);
        }
        public static string AddPreferences(string user_id, string preferences)
        {
            return UserDAL.AddPreferences(user_id, preferences);
        }
        public static List<Cities> GetCities()
        {
            return UserDAL.GetCities();
        }
        public static User GetUserByPhone(string phone, string password)
        {
            return UserDAL.GetUserByPhone(phone, password);
        }
        public static string SignUp(string fullname, string email, string phone, string pswd)
        {
            string msg = string.Empty;
            msg = UserDAL.CheckDuplicateUser(email, phone);
            if (msg == string.Empty)
            {
                msg = UserDAL.SignUp(fullname, email, phone, pswd);
            }
            return msg;
        }
    }
}
