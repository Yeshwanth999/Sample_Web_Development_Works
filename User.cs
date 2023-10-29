using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.Serialization;

namespace DomainModel
{
    [DataContract]
    public class User
    {
        [DataMember]
        public string user_guid { get; set; }
        [DataMember]
        public string fullname { get; set; }
        [DataMember]
        public string email { get; set; }
        [DataMember]
        public string phone { get; set; }
        [DataMember]
        public string password { get; set; }

    }
    public class Cities
    {
        [DataMember]
        public string city_id { get; set; }
        [DataMember]
        public string city { get; set; }
        [DataMember]
        public string state { get; set; }
    }
    public class Property
    {
        [DataMember]
        public string property_id { get; set; }
        [DataMember]
        public string user_id { get; set; }
        [DataMember]
        public string city_id { get; set; }
        [DataMember]
        public string owner_name { get; set; }
        [DataMember]
        public string location { get; set; }
        [DataMember]
        public int appro_rent { get; set; }
        [DataMember]
        public string occupancy { get; set; }
        [DataMember]
        public string looking_for { get; set; }
        [DataMember]
        public string pictures { get; set; }
        [DataMember]
        public string preferences { get; set; }
        [DataMember]
        public string amenities { get; set; }
        [DataMember]
        public string description { get; set; }
        [DataMember]
        public string available_from { get; set; }

    }
}
