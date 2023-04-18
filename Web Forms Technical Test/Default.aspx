<%@ Page Title="Home Page" Async="true" EnableEventValidation="false" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Web_Forms_Technical_Test._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <script src="Scripts/jquery-3.4.1.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $('#MainContent_PostcodeDropdown').change(function () {
                var address = $('#MainContent_PostcodeDropdown');
                var addressText = address[0].options[address[0].selectedIndex].text;
                var addressArray = addressText.split(",");
                for (let i = 0; i < addressArray.length && i < 5; i++) {
                    document.getElementById(`MainContent_AddressLine${i + 1}`).value = addressArray[i];
                }
            });
        });
    </script>
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>Postcode Lookup</h2>
    <table>
        <thead>
            <asp:TextBox ID="PostcodeText" Style="margin: 10px;" runat="server"></asp:TextBox>
            <asp:Button ID="SubmitPostcode" runat="server" Style="margin: 10px" Text="Submit" OnClick="SubmitPostcode_Click" /><br />
            <asp:Label ID="ErrorMsg" runat="server" Style="margin: 10px; display:none; color:red;" Text="You must enter a valid postcode"></asp:Label><br />
            <asp:DropDownList ID="PostcodeDropdown" OnClientSelectedIndexChanged="setAddressFields(); return false;" Style="margin: 10px; width: 200px;" runat="server"></asp:DropDownList><br />
            <asp:Label ID="Label1" runat="server" Style="margin: 10px" Text="Address Line 1"></asp:Label><br />
            <asp:TextBox ID="AddressLine1" Style="margin: 10px" runat="server"></asp:TextBox><br />
            <asp:Label ID="Label2" runat="server" Style="margin: 10px" Text="Address Line 2"></asp:Label><br />
            <asp:TextBox ID="AddressLine2" Style="margin: 10px" runat="server"></asp:TextBox><br />
            <asp:Label ID="Label3" runat="server" Style="margin: 10px" Text="Address Line 3"></asp:Label><br />
            <asp:TextBox ID="AddressLine3" Style="margin: 10px" runat="server"></asp:TextBox><br />
            <asp:Label ID="Label4" runat="server" Style="margin: 10px" Text="Address Line 4"></asp:Label><br />
            <asp:TextBox ID="AddressLine4" Style="margin: 10px" runat="server"></asp:TextBox><br />
            <asp:Label ID="Label5" runat="server" Style="margin: 10px" Text="Address Line 5"></asp:Label><br />
            <asp:TextBox ID="AddressLine5" Style="margin: 10px" runat="server"></asp:TextBox><br />
        </thead>
        <tbody id="postcodeLookup">
        </tbody>
    </table>
</asp:Content>
