using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web_Forms_Technical_Test.Models
{
    public class AddressModel
    {
        public string Id { get; set; }
        public string Address { get; set; }
        public string Url { get; set; }
    }

    public class GetAddressResponseModel
    {
        public List<AddressModel> Suggestions { get; set; }
    }
}