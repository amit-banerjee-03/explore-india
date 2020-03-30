<%@ Page Title="" Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true" CodeFile="Make_Trip.aspx.cs" Inherits="Make_Trip" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style15 {
            width: 100%;
            background-color: #E1E5F0;
        }
        .auto-style16 {
            width: 507px;
        }
        .auto-style17 {
            width: 507px;
            height: 24px;
        }
        .auto-style18 {
            height: 24px;
        }
        .auto-style19 {
            width: 507px;
            height: 22px;
        }
        .auto-style20 {
            height: 22px;
        }
        .auto-style21 {
            width: 507px;
            height: 28px;
        }
        .auto-style22 {
            height: 28px;
        }
        .auto-style23 {
            height: 62px;
        }
        .padding{
            padding-top:20px;
        }
        .auto-style24 {
            width: 507px;
            height: 39px;
        }
        .auto-style25 {
            height: 39px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="0" class="auto-style15" style="border-top-style: solid; border-bottom-style: solid; border-top-width: medium; border-bottom-width: medium; border-top-color: #5E308A; border-bottom-color: #5E308A;margin-top:40px; border-spacing: 10px;">
        <tr>
            <td colspan="2" style="text-align: center; font-size: xx-large; color: #1E96ED; font-weight: bold; border-bottom-style: solid; border-bottom-width: medium; border-bottom-color: #5E308A;" class="auto-style23">MAKE YOUR OWN TRIP</td>
        </tr>
        <tr class="padding">
            <td class="auto-style24" style="text-align: right; color: #5E308A; font-size: large; vertical-align: bottom;">LOCATION:</td>
            <td style="vertical-align: bottom;" class="auto-style25">
                <asp:DropDownList ID="drplst_location" runat="server" Width="172px">
                    <asp:ListItem Selected="True" Value="0">SELECT LOCATION</asp:ListItem>
                    <asp:ListItem>GOA</asp:ListItem>
                    <asp:ListItem>HARIDWAR</asp:ListItem>
                    <asp:ListItem>KOLKATA</asp:ListItem>
                    <asp:ListItem>MANALI</asp:ListItem>
                </asp:DropDownList>

                <asp:CustomValidator ID="custval_location" runat="server" ErrorMessage="Select A Location" ForeColor="Red" ValidationGroup="book" ClientValidationFunction="checkLocation"></asp:CustomValidator>

            </td>
        </tr>
        <tr>
            <td class="auto-style16" rowspan="2" style="text-align: right; color: #5E308A; font-size: large;">NUMBER OF DAYS:</td>
            <td style="font-size: large; color: #5E308A">START:
                <asp:DropDownList ID="drplst_startDD" runat="server">
                    <asp:ListItem>DD</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="drplst_startMM" runat="server">
                    <asp:ListItem>MM</asp:ListItem>
                </asp:DropDownList>
                <asp:CustomValidator ID="custval_startDate" runat="server" ErrorMessage="Select A Start Date" ForeColor="Red" ValidationGroup="book" ClientValidationFunction="checkStartDate"></asp:CustomValidator>
                <asp:Label ID="lbl_startDateError" runat="server" ForeColor="Red" Text="Enter A Valid Start Date" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="font-size: large; color: #5E308A">END:&nbsp;&nbsp;&nbsp;&nbsp; <asp:DropDownList ID="drplst_endDD" runat="server">
                <asp:ListItem>DD</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="drplst_endMM" runat="server">
                    <asp:ListItem>MM</asp:ListItem>
                </asp:DropDownList>
                <asp:CustomValidator ID="custval_endDate" runat="server" ErrorMessage="Select An End Date" ForeColor="Red" ValidationGroup="book" ClientValidationFunction="checkEndDate"></asp:CustomValidator>
                <asp:Label ID="lbl_endDateError" runat="server" ForeColor="Red" Text="Enter A Valid End Date" Visible="False"></asp:Label>
            </td>
        </tr>

        <tr>
            <td class="auto-style17" style="text-align: right; color: #5E308A; font-size: large;">NUMBER OF PEOPLE:</td>
            <td class="auto-style18" style="font-size: large; color: #5E308A">
                <asp:TextBox ID="txt_numberOfPeople" runat="server" TextMode="Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="Rqrdval_number" runat="server" ErrorMessage="Enter Number Of People" ForeColor="Red" ValidationGroup="book" ControlToValidate="txt_numberOfPeople"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style21" style="text-align: right; color: #5E308A; font-size: large;">HOTEL:</td>
            <td style="font-size: large; color: #5E308A" class="auto-style22">
                <asp:DropDownList ID="drplst_hotel" runat="server" Height="20px" Width="130px">
                </asp:DropDownList>
                <asp:Button ID="btn_hotelCheck" runat="server" BackColor="#1E96ED" BorderColor="#5E308A" BorderStyle="Solid" ForeColor="#E1E5F0" Text="Check Hotels" OnClick="btn_hotelCheck_Click" />
                <asp:CustomValidator ID="custval_hotel" runat="server" ErrorMessage="Select Hotel" ForeColor="Red" ValidationGroup="book" ClientValidationFunction="checkHotel"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style19" style="text-align: right; color: #5E308A; font-size: large;">TYPE OF ROOM:</td>
            <td class="auto-style20" style="font-size: large; color: #5E308A">
                <asp:RadioButton ID="rdobtn_ac" runat="server" GroupName="typeRoom" Text="AC" />
                <asp:RadioButton ID="rdobtn_nonAC" runat="server" GroupName="typeRoom" Text="NON AC" />
                <asp:CheckBox ID="chkbox_bed" runat="server" Text="DOUBLE BED" />
                <asp:CustomValidator ID="custval_roomType" runat="server" ErrorMessage="Choose A Room Type" ForeColor="Red" ValidationGroup="book" ClientValidationFunction="check"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style16" style="text-align: right; color: #5E308A; font-size: large;">TYPE OF TRANSPORT:</td>
            <td style="font-size: large; color: #5E308A">
                <asp:RadioButton ID="rdobtn_flight" runat="server" GroupName="typeTransport" Text="FLIGHT" />
                <asp:RadioButton ID="rdobtn_train" runat="server" GroupName="typeTransport" Text="TRAIN" />
                <asp:RadioButton ID="rdobtn_bus" runat="server" GroupName="typeTransport" Text="BUS" />
                <asp:CustomValidator ID="custval_transportType" runat="server" ErrorMessage="Choose A Transport Type" ForeColor="Red" ValidationGroup="book" ClientValidationFunction="checkTransport"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Button ID="btn_book" runat="server" BackColor="#1E96ED" BorderColor="#5E308A" BorderStyle="Solid" ForeColor="#E1E5F0" Text="BOOK" ValidationGroup="book" OnClick="btn_book_Click" />
            </td>
        </tr>
        <tr>
            <td class="auto-style16" style="text-align: right; color: #5E308A; font-size: large;">TOTAL PRICE(IN RUPEES):</td>
            <td style="font-size: large; color: #5E308A">
                <asp:Label ID="lbl_price" runat="server" Text="TOTAL AMOUNT WILL APPEAR HERE" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Button ID="btn_payNow" runat="server" BackColor="#1E96ED" BorderColor="#5E308A" BorderStyle="Solid" ForeColor="#E1E5F0" Text="PAY NOW" OnClick="btn_payNow_Click" ValidationGroup="book" Visible="False" />
            </td>
        </tr>
    </table>
    <script type="text/javascript" >
        function check(s,a)
        {
            if(document.getElementById("<%=rdobtn_ac.ClientID%>").checked == false && document.getElementById("<%=rdobtn_nonAC.ClientID%>").checked == false)
            {

                a.IsValid = false;
            } else 
            {
                a.IsValid = true;
            }
        }
        function checkStartDate(s,a)
        { 
            if(document.getElementById("<%=drplst_startDD.ClientID%>").selectedIndex==0 || document.getElementById("<%=drplst_startMM.ClientID%>").selectedIndex==0)
            {
                a.IsValid = false;
            }
            else
            {
                a.IsValid = true;
            }
        }
        function checkEndDate(s, a) {
            if (document.getElementById("<%=drplst_endDD.ClientID%>").selectedIndex == 0 || document.getElementById("<%=drplst_endMM.ClientID%>").selectedIndex == 0)
            {
                a.IsValid = false;
            }
            else {
                a.IsValid = true;
            }
        }
        function checkTransport(s, a) {
            if (document.getElementById("<%=rdobtn_bus.ClientID%>").checked == false && document.getElementById("<%=rdobtn_flight.ClientID%>").checked == false && document.getElementById("<%=rdobtn_train.ClientID%>").checked == false)
            {

                a.IsValid = false;
            } else
            {
                a.IsValid = true;
            }
        }
        function checkHotel(s, a)
        {
            if (document.getElementById("<%=drplst_hotel.ClientID%>").selectedIndex == -1)
            {
                a.IsValid = false;
            }
            else
            {
                a.IsValid = true;
            }
        }
        function checkLocation(s, a) {
            if (document.getElementById("<%=drplst_location.ClientID%>").selectedIndex == 0)
            {
                a.IsValid = false;
            }
            else
            {
                a.IsValid = true;
            }
        }

    </script>
</asp:Content>

