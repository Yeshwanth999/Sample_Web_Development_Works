using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DomainModel;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace DataAccess
{
    public class UserDAL
    {
        public static Property GetPropertyByPropertyId(string property_id)
        {
            Property p = new Property();
            SqlConnection conn = new SqlConnection(ConfigurationSettings.AppSettings["connection"]);
            conn.Open();
            try
            {
                using (SqlCommand cmd = new SqlCommand("GetPropertyByPropertyId", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@property_id", SqlDbType.UniqueIdentifier).Value = Guid.Parse(property_id);
                    SqlDataReader sdr = cmd.ExecuteReader();
                    while (sdr.Read())
                    {
                        p.property_id = sdr["property_id"].ToString();
                        p.user_id = sdr["user_id"].ToString();
                        p.city_id = sdr["city_id"].ToString();
                        p.owner_name = sdr["owner_name"].ToString();
                        p.location = sdr["location"].ToString();
                        p.appro_rent = Convert.ToInt32(sdr["appro_rent"]);
                        p.looking_for = sdr["looking_for"].ToString();
                        p.occupancy = sdr["occupancy"].ToString();
                        p.preferences = sdr["preferences"].ToString();
                        p.amenities = sdr["amenities"].ToString();
                        p.description = sdr["description"].ToString();
                    }
                }
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                conn.Close();
            }
            return p;
        }
        public static List<Property> GetPropertiesByCityId(string city_id)
        {
            List<Property> properties = new List<Property>();
            SqlConnection conn = new SqlConnection(ConfigurationSettings.AppSettings["connection"]);
            conn.Open();
            try
            {
                using (SqlCommand cmd = new SqlCommand("GetPropertiesByCityId", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@city_id", SqlDbType.UniqueIdentifier).Value = Guid.Parse(city_id);
                    SqlDataReader sdr = cmd.ExecuteReader();
                    while (sdr.Read())
                    {
                        Property p = new Property();
                        p.property_id = sdr["property_id"].ToString();
                        p.user_id = sdr["user_id"].ToString();
                        p.city_id = sdr["city_id"].ToString();
                        p.owner_name = sdr["owner_name"].ToString();
                        p.location = sdr["location"].ToString();
                        p.appro_rent = Convert.ToInt32(sdr["appro_rent"]);
                        p.looking_for = sdr["looking_for"].ToString();
                        p.occupancy = sdr["occupancy"].ToString();
                        properties.Add(p);
                    }
                }
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                conn.Close();
            }
            return properties;
        }
        public static List<Property> GetProperties()
        {
            List<Property> properties = new List<Property>();
            SqlConnection conn = new SqlConnection(ConfigurationSettings.AppSettings["connection"]);
            conn.Open();
            try
            {
                using (SqlCommand cmd = new SqlCommand("GetProperties", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataReader sdr = cmd.ExecuteReader();
                    while (sdr.Read())
                    {
                        Property p = new Property();
                        p.property_id = sdr["property_id"].ToString();
                        p.user_id = sdr["user_id"].ToString();
                        p.city_id = sdr["city_id"].ToString();
                        p.owner_name = sdr["owner_name"].ToString();
                        p.location = sdr["location"].ToString();
                        p.appro_rent = Convert.ToInt32(sdr["appro_rent"]);
                        p.looking_for = sdr["looking_for"].ToString();
                        p.occupancy = sdr["occupancy"].ToString();
                        properties.Add(p);
                    }
                }
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                conn.Close();
            }
            return properties;
        }
        public static string AddListing(string user_id, string city_id, string owner_name, string location, int appro_rent, string occupancy, string looking_for, string pictures, string amenities, string description, string available_from)
        {
            string msg = string.Empty;
            string preferences = string.Empty;
            SqlConnection conn = new SqlConnection(ConfigurationSettings.AppSettings["connection"]);
            try
            {
                using(SqlCommand cmd= new SqlCommand("GetUserPreferencesByUserId", conn))
                {
                    conn.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@user_id", SqlDbType.UniqueIdentifier).Value = Guid.Parse(user_id);
                    SqlDataReader sdr = cmd.ExecuteReader();
                    if (sdr.Read())
                    {
                        preferences = sdr["preferences"].ToString();
                    }
                    else
                    {
                        preferences = "none";
                    }
                }
            }
            catch(Exception e)
            {

            }
            finally
            {
                conn.Close();
            }
            try
            {
                using(SqlCommand cmd = new SqlCommand("AddListing", conn))
                {
                    conn.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@property_id", SqlDbType.UniqueIdentifier).Value = Guid.NewGuid();
                    cmd.Parameters.Add("@user_id", SqlDbType.UniqueIdentifier).Value = Guid.Parse(user_id);
                    cmd.Parameters.Add("@city_id", SqlDbType.UniqueIdentifier).Value = Guid.Parse(city_id);
                    cmd.Parameters.Add("@owner_name", SqlDbType.VarChar,40).Value = owner_name.ToString();
                    cmd.Parameters.Add("@location", SqlDbType.VarChar,60).Value = location.ToString();
                    cmd.Parameters.Add("@appro_rent", SqlDbType.Int).Value = Convert.ToInt32(appro_rent);
                    cmd.Parameters.Add("@occupancy", SqlDbType.VarChar, 10).Value = occupancy.ToString() ;
                    cmd.Parameters.Add("@looking_for", SqlDbType.VarChar, 10).Value = looking_for.ToString() ;
                    cmd.Parameters.Add("@pictures", SqlDbType.VarChar, 100).Value = pictures.ToString() ;
                    cmd.Parameters.Add("@preferences", SqlDbType.VarChar, 100).Value = preferences.ToString() ;
                    cmd.Parameters.Add("@amenities", SqlDbType.VarChar, 100).Value = amenities.ToString() ;
                    cmd.Parameters.Add("@description", SqlDbType.VarChar, 300).Value = description.ToString() ;
                    cmd.Parameters.Add("@available_from", SqlDbType.VarChar, 10).Value = available_from.ToString();
                    cmd.ExecuteNonQuery();
                    msg = "Property added successfully.";
                }
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                conn.Close();
            }
            return msg;
        }
        public static string GetUserPhoneByUserId(string user_id)
        {
            string msg = string.Empty;
            SqlConnection conn = new SqlConnection(ConfigurationSettings.AppSettings["connection"]);
            conn.Open();
            try
            {
                using (SqlCommand cmd = new SqlCommand("GetUserPhoneByUserId", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@user_guid", SqlDbType.UniqueIdentifier).Value = Guid.Parse(user_id);
                    SqlDataReader sdr = cmd.ExecuteReader();
                    if (sdr.Read())
                    {
                        msg = sdr["phone"].ToString();
                    }
                }
            }
            catch (Exception exp)
            {
                throw exp;
            }
            finally
            {
                conn.Close();
            }
            return msg;
        }
        public static List<Cities> GetCityRecommendations(String hint)
        {
            List<Cities> cities = new List<Cities>();
            SqlConnection conn = new SqlConnection(ConfigurationSettings.AppSettings["connection"]);
            conn.Open();
            try
            {
                using (SqlCommand cmd = new SqlCommand("GetCityRecommendations", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@hint", SqlDbType.VarChar, 10).Value = hint.ToString();
                    SqlDataReader sdr = cmd.ExecuteReader();
                    while (sdr.Read())
                    {
                        Cities c = new Cities();
                        c.city_id = sdr["city_id"].ToString();
                        c.city = sdr["city"].ToString();
                        c.state = sdr["State"].ToString();
                        cities.Add(c);
                    }
                }
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                conn.Close();
            }
            return cities;
        }
        public static string AddPreferences(string user_id, string preferences)
        {
            string msg = string.Empty;
            SqlConnection conn = new SqlConnection(ConfigurationSettings.AppSettings["connection"]);
            conn.Open();
            try
            {
                using(SqlCommand cmd = new SqlCommand("AddPreferences", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@user_id", SqlDbType.UniqueIdentifier).Value = Guid.Parse(user_id);
                    cmd.Parameters.Add("@preferences", SqlDbType.VarChar, 100).Value = preferences.ToString();
                    cmd.ExecuteNonQuery();
                    msg = "Your preferences are saved";
                }
            }
            catch(Exception e)
            {
                throw e;
            }
            finally
            {
                conn.Close();
            }
            return msg;
        }
        public static List<Cities> GetCities()
        {
            List<Cities> cities = new List<Cities>();
            SqlConnection conn = new SqlConnection(ConfigurationSettings.AppSettings["connection"]);
            conn.Open();
            try
            {
                using(SqlCommand cmd = new SqlCommand("GetCities", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataReader sdr = cmd.ExecuteReader();
                    while (sdr.Read())
                    {
                        Cities c = new Cities();
                        c.city_id = sdr["city_id"].ToString();
                        c.city = sdr["city"].ToString();
                        c.state = sdr["State"].ToString();
                        cities.Add(c);
                    }
                }
            }
            catch(Exception e)
            {
                throw e;
            }
            finally
            {
                conn.Close();
            }
            return cities;
        }
        public static User GetUserByPhone(string phone, string password)
        {
            User u = new User();
            SqlConnection conn = new SqlConnection(ConfigurationSettings.AppSettings["connection"]);
            conn.Open();
            try
            {
                using(SqlCommand cmd = new SqlCommand("GetUserByPhone", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@phone", SqlDbType.VarChar, 10).Value = phone.ToString();
                    cmd.Parameters.Add("@password", SqlDbType.VarChar, 25).Value = password.ToString();
                    SqlDataReader sdr = cmd.ExecuteReader();
                    if (sdr.Read())
                    {
                        u.user_guid = sdr["user_guid"].ToString();
                        u.fullname = sdr["fullname"].ToString();
                    }
                }
            }
            catch(Exception exp)
            {
                throw exp;
            }
            finally
            {
                conn.Close();
            }
            return u;
        }
        public static string CheckDuplicateUser(string email, string phone)
        {
            string msg = string.Empty;
            int count = 0;
            SqlConnection conn = new SqlConnection(ConfigurationSettings.AppSettings["connection"]);
            conn.Open();
            try
            {
                using(SqlCommand cmd = new SqlCommand("CheckDuplicateUser", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@email", SqlDbType.VarChar, 50).Value = email;
                    cmd.Parameters.Add("@phone", SqlDbType.VarChar, 10).Value = phone;
                    SqlDataReader sdr = cmd.ExecuteReader();
                    while (sdr.Read())
                    {
                        count = Convert.ToInt32(sdr["duplictae_count"]);
                    }
                    if (count > 0)
                    {
                        msg = "Email or phone number alread exists";
                    }
                }
            }
            catch(Exception exp)
            {
                throw exp;
            }
            finally
            {
                conn.Close();
            }
            return msg;
        }
        public static string SignUp(string fullname, string email, string phone, string pswd)
        {
            string msg = string.Empty;
            SqlConnection conn = new SqlConnection(ConfigurationSettings.AppSettings["connection"]);
            conn.Open();
            Guid user_guid = Guid.NewGuid();
            try
            {
                using(SqlCommand cmd = new SqlCommand("SignUp", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@user_guid", SqlDbType.UniqueIdentifier).Value = user_guid;
                    cmd.Parameters.Add("@fullname", SqlDbType.VarChar, 40).Value = fullname.ToString();
                    cmd.Parameters.Add("@email", SqlDbType.VarChar, 50).Value = email.ToString();
                    cmd.Parameters.Add("@phone", SqlDbType.VarChar, 10).Value = phone.ToString();
                    cmd.Parameters.Add("@password", SqlDbType.VarChar, 25).Value = pswd.ToString();
                    cmd.ExecuteNonQuery();
                    msg = "Registration successful" + "&" + user_guid.ToString();
                }
            }
            catch(Exception exp)
            {
                throw exp;
            }
            finally
            {
                conn.Close();
            }
            return msg;
        }
    }
}
