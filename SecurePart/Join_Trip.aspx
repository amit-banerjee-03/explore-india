<%@ Page Title="" Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true" CodeFile="Join_Trip.aspx.cs" Inherits="Join_Trip" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        .auto-style15 {
            width: 100%;
            background-color: #E1E5F0;
        }
        .auto-style23 {
            height: 62px;
        }
        .padding{
            padding-top:20px;
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
        .auto-style21 {
            width: 507px;
            height: 28px;
        }
        .auto-style22 {
            height: 28px;
        }
        .auto-style20 {
            height: 22px;
        }
        .auto-style26 {
            margin-left: 14px;
        }
        .auto-style27 {
            width: 507px;
            height: 11px;
        }
        .auto-style28 {
            height: 11px;
        }
        .auto-style29 {
            width: 507px;
            height: 48px;
        }
        .auto-style30 {
            height: 48px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="0" class="auto-style15" style="border-top-style: solid; border-bottom-style: solid; border-top-width: medium; border-bottom-width: medium; border-top-color: #5E308A; border-bottom-color: #5E308A;margin-top:40px; border-spacing: 5px;">
        <tr>
            <td colspan="2" style="text-align: center; font-size: xx-large; color: #1E96ED; font-weight: bold; border-bottom-style: solid; border-bottom-width: medium; border-bottom-color: #5E308A;" class="auto-style23">JOIN A TRIP</td>
        </tr>
        <tr class="padding">
            <td class="auto-style27" style="text-align: right; color: #5E308A; font-size: large; vertical-align: bottom;">LOCATION:</td>
            <td style="vertical-align: bottom;" class="auto-style28">
                <asp:DropDownList ID="drplst_location" runat="server" Height="17px" Width="150px">
                    <asp:ListItem Value="0">SELECT LOCATION</asp:ListItem>
                    <asp:ListItem>GOA</asp:ListItem>
                    <asp:ListItem>HARIDWAR</asp:ListItem>
                    <asp:ListItem>KOLKATA</asp:ListItem>
                    <asp:ListItem>MANALI</asp:ListItem>
                </asp:DropDownList>

                <asp:CustomValidator ID="custval_location" runat="server" ErrorMessage="Select A Location" ForeColor="Red" ValidationGroup="find" ClientValidationFunction="checkLocation"></asp:CustomValidator>

            </td>
        </tr>
        <tr class="padding">
            <td class="auto-style29" style="text-align: right; color: #5E308A; font-size: large; vertical-align: bottom;">PACKAGE:</td>
            <td style="vertical-align: bottom;" class="auto-style30">
                <asp:DropDownList ID="drplst_package" runat="server" Height="17px" Width="150px">
                </asp:DropDownList>
                <asp:Button ID="btn_findPackages" runat="server" BackColor="#1E96ED" BorderColor="#5E308A" BorderStyle="Solid" ForeColor="#E1E5F0" Text="FIND PACKAGES" ValidationGroup="find" CssClass="auto-style26" Width="119px" OnClick="btn_findPackages_Click" />

                <asp:CustomValidator ID="custval_package" runat="server" ErrorMessage="Select A Package" ForeColor="Red" ValidationGroup="book" ClientValidationFunction="checkPackage"></asp:CustomValidator>

                <asp:DropDownList ID="drplst_packagehidden" runat="server" Height="17px" Width="150px" Visible="False">
                </asp:DropDownList>

            </td>
        </tr>
        <tr>
            <td class="auto-style16" rowspan="2" style="text-align: right; color: #5E308A; font-size: large;">NUMBER OF DAYS:</td>
            <td style="font-size: large; color: #5E308A" class="auto-style20">START:
                <asp:Label ID="lbl_startDate" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="font-size: large; color: #5E308A">END:&nbsp;&nbsp;&nbsp;&nbsp; 
                <asp:Label ID="lbl_endDate" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style17" style="text-align: right; color: #5E308A; font-size: large;">NUMBER OF PEOPLE:</td>
            <td class="auto-style18" style="font-size: large; color: #5E308A">
                <asp:TextBox ID="txt_numberOfPeople" runat="server" TextMode="Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="Rqrdval_number" runat="server" ErrorMessage="Enter Number Of People" ForeColor="Red" ValidationGroup="book" ControlToValidate="txt_numberOfPeople"></asp:RequiredFieldValidator>
                <asp:Label ID="lbl_error" runat="server" ForeColor="Red" Text="Number Of People Greater Than Slots Available" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style17" style="text-align: right; color: #5E308A; font-size: large;">&nbsp;NUMBER OF SLOTS LEFT:</td>
            <td class="auto-style18" style="font-size: large; color: #5E308A">
                <asp:Label ID="lbl_total" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style21" style="text-align: right; color: #5E308A; font-size: large;">HOTEL:</td>
            <td style="font-size: large; color: #5E308A" class="auto-style22">
                <asp:Label ID="lbl_hotel" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style16" style="text-align: right; color: #5E308A; font-size: large;">TYPE OF TRANSPORT:</td>
            <td style="font-size: large; color: #5E308A">
                <asp:Label ID="lbl_typeTransport" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Button ID="btn_book" runat="server" BackColor="#1E96ED" BorderColor="#5E308A" BorderStyle="Solid" ForeColor="#E1E5F0" Text="GET DETAILS" ValidationGroup="book" OnClick="btn_book_Click" />
            </td>
        </tr>
        <tr>
            <td class="auto-style16" style="text-align: right; color: #5E308A; font-size: large;">TOTAL PRICE (IN RUPEES):</td>
            <td style="font-size: large; color: #5E308A">
                <asp:Label ID="lbl_price" runat="server" Text="TOTAL AMOUNT WILL APPEAR HERE" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Button ID="btn_payNow" runat="server" BackColor="#1E96ED" BorderColor="#5E308A" BorderStyle="Solid" ForeColor="#E1E5F0" Text="PAY NOW" OnClick="btn_payNow_Click" Visible="False" />
            </td>
        </tr>
    </table>
    <script>
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
        function checkPackage(s, a) {
            if (document.getElementById("<%=drplst_package.ClientID%>").selectedIndex >= 0)
            {
                a.IsValid = true;
            }
            else
            {
                a.IsValid = false;
            }

        }

    </script>
</asp:Content>

