using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using DomainModel;
using DataAccess;
using Business;

namespace RoomMateServices
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IUserService" in both code and config file together.
    [ServiceContract]
    public interface IUserService
    {
        [OperationContract]
        void DoWork();

        [OperationContract]
        [WebInvoke(UriTemplate = "GetUserByPhone?phone={phone}&password={password}", Method = "GET", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json)]
        User GetUserByPhone(string phone, string password);
        [OperationContract]
        [WebInvoke(UriTemplate = "GetPropertyByPropertyId?property_id={property_id}", Method = "GET", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json)]
        Property GetPropertyByPropertyId(string property_id);
        [OperationContract]
        [WebInvoke(UriTemplate = "SignUp?fullname={fullname}&email={email}&phone={phone}&pswd={pswd}", Method = "POST", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json)]
        string SignUp(string fullname, string email, string phone, string pswd);
        [OperationContract]
        [WebInvoke(UriTemplate = "GetCities", Method = "GET", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json)]
        List<Cities> GetCities();
        [OperationContract]
        [WebInvoke(UriTemplate = "GetCityRecommendations?hint={hint}", Method = "GET", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json)]
        List<Cities> GetCityRecommendations(string hint);
        [OperationContract]
        [WebInvoke(UriTemplate = "AddPreferences?user_id={user_id}&preferences={preferences}", Method = "POST", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json)]
        string AddPreferences(string user_id, string preferences);
        [OperationContract]
        [WebInvoke(UriTemplate = "GetUserPhoneByUserId?user_id={user_id}", Method = "POST", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json)]
        string GetUserPhoneByUserId(string user_id);
        [OperationContract]
        [WebInvoke(UriTemplate = "AddListing?user_id={user_id}&city_id={city_id}&owner_name={owner_name}&location={location}&appro_rent={appro_rent}&occupancy={occupancy}&looking_for={looking_for}&pictures={pictures}&amenities={amenities}&description={description}&available_from={available_from}", Method = "POST", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json)]
        string AddListing(string user_id, string city_id, string owner_name, string location, int appro_rent, string occupancy, string looking_for, string pictures, string amenities, string description, string available_from);
        [OperationContract]
        [WebInvoke(UriTemplate = "GetProperties", Method = "GET", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json)]
        List<Property> GetProperties();
        [OperationContract]
        [WebInvoke(UriTemplate = "GetPropertiesByCityId?user_id={city_id}", Method = "GET", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json)]
        List<Property> GetPropertiesByCityId(string city_id);
        [OperationContract]
        [WebInvoke(UriTemplate = "Random", Method = "GET", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json)]
        string Random();
    }
}
