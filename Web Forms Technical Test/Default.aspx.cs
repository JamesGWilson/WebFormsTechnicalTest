using System;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web_Forms_Technical_Test.Models;

namespace Web_Forms_Technical_Test
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        public async Task GetPostCodesAsync()
        {
            var postcode = PostcodeText.Text;

            var httpClient = new HttpClient();
            var response = await httpClient.GetAsync($"https://api.getAddress.io/autocomplete/{postcode}?api-key=QC8mDHAxvUGr_92xDiEpug39150 ");

            if (response.IsSuccessStatusCode)
            {
                var addressSuggestions = await response.Content.ReadAsAsync<GetAddressResponseModel>();

                if(addressSuggestions.Suggestions.Count > 0)
                {
                    PostcodeDropdown.Items.Add(new ListItem(""));

                    foreach (var address in addressSuggestions.Suggestions)
                    {
                        var item = new ListItem(address.Address);
                        PostcodeDropdown.Items.Add(item);
                    }
                } else
                {
                    ErrorMsg.Style.Remove("Display");
                }


            } else
            {
                ErrorMsg.Style.Remove("Display");
            }
        }

        protected void SubmitPostcode_Click(object sender, EventArgs e)
        {
            ClearFields();
            RegisterAsyncTask(new PageAsyncTask(GetPostCodesAsync));
        }

        private void ClearFields()
        {
            PostcodeDropdown.ClearSelection();
            PostcodeDropdown.Items.Clear();
            ErrorMsg.Style.Add("Display", "none");
            AddressLine1.Text = "";
            AddressLine2.Text = "";
            AddressLine3.Text = "";
            AddressLine4.Text = "";
            AddressLine5.Text = "";
        }
    }
}