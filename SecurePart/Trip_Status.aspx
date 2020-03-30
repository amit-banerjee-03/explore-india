<%@ Page Title="" Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true" CodeFile="Trip_Status.aspx.cs" Inherits="Trip_Status" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style15 {
            width: 100%;
            background-color: #E1E5F0;
            height: 298px;
        }
        .auto-style16 {
            width: 400px;
        }
        .auto-style17 {
            width: 100%;
        }
        .auto-style18 {
            height: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <table cellpadding="0" class="auto-style17">
        <tr>
            <td style="text-align: center">
                <asp:Label ID="lbl_bookingSuccessful" runat="server" Text="YOUR BOOKING WAS SUCCESSFUL" ForeColor="#006600" Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
    
    <table align="left" class="auto-style15">
        <tr>
            <td class="auto-style16" rowspan="9" style="border: medium solid #1E96ED; vertical-align: top;">
                <asp:GridView ID="grdview_listOfTrips" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="grdview_listOfTrips_SelectedIndexChanged" BorderColor="#E1E5F0">
                    <Columns>
                        <asp:TemplateField HeaderText="LIST OF BOOKINGS" HeaderStyle-ForeColor="#1E96ED">
                            <ItemTemplate>
                                <asp:Label ID="lbl_bookingID" runat="server" Text='<% # Eval("bookingid") %>' ForeColor="#5E308A"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField SelectText="View Details" ShowSelectButton="true" />
                    </Columns>
                </asp:GridView>
            </td>
            <td style="font-size: x-large; font-weight: bold; border-right-style: solid; border-left-style: solid; border-right-width: medium; border-left-width: medium; border-right-color: #5E308A; border-left-color: #5E308A; border-top-style: solid; border-top-width: medium; border-top-color: #5E308A;">
                <asp:Label ID="lbl_locationName" runat="server" ForeColor="#5E308A"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="font-size: x-large; font-weight: bold; border-right-style: solid; border-left-style: solid; border-right-width: medium; border-left-width: medium; border-right-color: #5E308A; border-left-color: #5E308A;">
                <asp:Label ID="lbl_hotelName" runat="server" ForeColor="#5E308A"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="font-size: x-large; font-weight: bold; border-right-style: solid; border-left-style: solid; border-right-width: medium; border-left-width: medium; border-right-color: #5E308A; border-left-color: #5E308A;">
                <asp:Label ID="lbl_startDate" runat="server" ForeColor="#5E308A"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="font-size: x-large; font-weight: bold; border-right-style: solid; border-left-style: solid; border-right-width: medium; border-left-width: medium; border-right-color: #5E308A; border-left-color: #5E308A;">
                <asp:Label ID="lbl_endDate" runat="server" ForeColor="#5E308A"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="font-size: x-large; font-weight: bold; border-right-style: solid; border-left-style: solid; border-right-width: medium; border-left-width: medium; border-right-color: #5E308A; border-left-color: #5E308A;">
                <asp:Label ID="lbl_numberOfPeople" runat="server" ForeColor="#5E308A"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="font-size: x-large; font-weight: bold; border-right-style: solid; border-left-style: solid; border-right-width: medium; border-left-width: medium; border-right-color: #5E308A; border-left-color: #5E308A;">
                <asp:Label ID="lbl_totalFare" runat="server" ForeColor="#5E308A"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="font-size: x-large; font-weight: bold; border-right-style: solid; border-left-style: solid; border-right-width: medium; border-left-width: medium; border-right-color: #5E308A; border-left-color: #5E308A;" class="auto-style18">
                <asp:Label ID="lbl_transport" runat="server" ForeColor="#5E308A"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="font-size: x-large; font-weight: bold; border-right-style: solid; border-left-style: solid; border-right-width: medium; border-left-width: medium; border-right-color: #5E308A; border-left-color: #5E308A;">
                <asp:Label ID="lbl_bookingDate" runat="server" ForeColor="#5E308A"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="font-size: x-large; font-weight: bold; border-right-style: solid; border-left-style: solid; border-right-width: medium; border-left-width: medium; border-right-color: #5E308A; border-left-color: #5E308A; border-bottom-style: solid; border-bottom-width: medium; border-bottom-color: #5E308A; text-align: center;height:300px;">
                <asp:Button ID="btn_cancel" runat="server" BackColor="#1E96ED" BorderColor="#5E308A" BorderStyle="Solid" ForeColor="#E1E5F0" Text="CANCEL BOOKING" Height="45px" Visible="False" OnClick="btn_cancel_Click" />
            </td>
        </tr>
    </table>
</asp:Content>

