<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Payment.aspx.cs" Inherits="SecurePart_Payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            background-color: #E1E5F0;
        }
        .auto-style2 {
            height: 471px;
            margin-top: 156px;
        }
        .auto-style3 {
            width: 606px;
        }
        .auto-style4 {
            margin-top: 0px;
        }
        .auto-style5 {
            width: 606px;
            height: 52px;
        }
        .auto-style6 {
            height: 52px;
        }
    </style>
     <script type="text/javascript" >
        function checkType(s,a)
        {
            if(document.getElementById("rdobtn_credit").checked == false && document.getElementById("rdobtn_debit").checked == false)
            {

                a.IsValid = false;
            } else
            {
                a.IsValid = true;
            }
        }
        function checkExpiry(s,a)
        {
            if(document.getElementById("drplst_dd").selectedIndex==0 || document.getElementById("drplst_mm").selectedIndex==0 || document.getElementById("drplst_yy").selectedIndex==0)
            {
                a.IsValid = false;
            }
            else
            {
                a.IsValid = true;
            }
        }
         </script>
</head>
<body style="background-color:#E1E5F0">
    <form id="form1" runat="server" class="auto-style2">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style3" style="text-align: right; color: #5E308A; font-weight: bold; font-size: xx-large">CARD NUMBER :</td>
                <td>
                    <asp:TextBox ID="txt_cardNumber" runat="server" CssClass="auto-style4" Width="273px" MaxLength="14"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqrdval_cardNumber" runat="server" ErrorMessage="Enter Card Number" ForeColor="Red" ValidationGroup="pay" ControlToValidate="txt_cardNumber"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style5" style="text-align: right; color: #5E308A; font-weight: bold; font-size: xx-large">EXPIRY DATE :</td>
                <td class="auto-style6">
                    <asp:DropDownList ID="drplst_dd" runat="server" Width="99px" Height="24px">
                        <asp:ListItem Selected="True">Date</asp:ListItem>
                    </asp:DropDownList>
                    <asp:DropDownList ID="drplst_mm" runat="server" style="margin-left :10px;margin-right:10px;" Height="24px" Width="99px">
                        <asp:ListItem Selected="True">Month</asp:ListItem>
                    </asp:DropDownList>
                    <asp:DropDownList ID="drplst_yy" runat="server" Height="24px" Width="99px">
                        <asp:ListItem Selected="True">Year</asp:ListItem>
                    </asp:DropDownList>
                &nbsp;&nbsp;
                    <asp:CustomValidator ID="cstmval_dateOfBirth" runat="server" ErrorMessage="Enter Expiry Date" ForeColor="Red" ValidationGroup="pay" ClientValidationFunction="checkExpiry"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3" style="text-align: right; color: #5E308A; font-weight: bold; font-size: xx-large">CVV :</td>
                <td>
                    <asp:TextBox ID="txt_cvv" runat="server" MaxLength="3" Width="88px" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqrdval_cvv" runat="server" ErrorMessage="Enter CVV" ForeColor="Red" ValidationGroup="pay" ControlToValidate="txt_cvv"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3" style="text-align: right; color: #5E308A; font-weight: bold; font-size: xx-large">CARD HOLDER&#39;S NAME :</td>
                <td>
                    <asp:TextBox ID="txt_cardHolderName" runat="server" Width="271px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqrdval_cardHolder" runat="server" ErrorMessage="Enter Card Holder's Name" ForeColor="Red" ValidationGroup="pay" ControlToValidate="txt_cardHolderName"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3" style="text-align: right; color: #5E308A; font-weight: bold; font-size: xx-large">TYPE :</td>
                <td>
                    <asp:RadioButton ID="rdobtn_credit" runat="server" GroupName="typeCard" Text="CREDIT" />
                    <asp:RadioButton ID="rdobtn_debit" runat="server" GroupName="typeCard" Text="DEBIT" />
                    <asp:CustomValidator ID="custval_type" runat="server" ErrorMessage="Enter Type" ForeColor="Red" ValidationGroup="pay" ClientValidationFunction="checkType"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td style="text-align: center; color: #5E308A; font-weight: bold; font-size: xx-large" colspan="2">
                    <asp:Button ID="btn_submit" runat="server" BackColor="#1E96ED" BorderColor="#5E308A" BorderStyle="Solid" OnClick="btn_submit_Click" Text="SUBMIT" ValidationGroup="pay" Width="100px" ForeColor="#E1E5F0" />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
