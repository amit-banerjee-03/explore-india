<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CreateAccount.aspx.cs" Inherits="CreateAccout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script type="text/javascript" >
        function check(s,a)
        {
            if(document.getElementById("rdobtn_male").checked == false && document.getElementById("rdobtn_female").checked == false)
            {

                a.IsValid = false;
            } else {
                a.IsValid = true;
            }
        }
        function checkDOB(s,a)
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
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 456px;
        }
        .auto-style2 {
            width: 100%;
            background-color: #E1E5F0;
            height: 369px;
        }
        .auto-style3 {
            width: 205px;
        }
        .auto-style5 {
            width: 205px;
            height: 28px;
        }
        .auto-style8 {
            width: 205px;
            height: 32px;
        }
        .auto-style16 {
            width: 170px;
        }
        .auto-style17 {
            width: 170px;
            height: 32px;
        }
        .auto-style18 {
            width: 170px;
            height: 28px;
        }
        .auto-style19 {
            width: 205px;
            height: 31px;
        }
        .auto-style20 {
            width: 170px;
            height: 31px;
        }
    </style>
</head>
<body style="background-color:#E1E5F0;">
    <form id="form1" runat="server">
    <div class="auto-style1">
    
        <table align="left" cellpadding="0" class="auto-style2" style="border-color: #5E308A; margin-top:10%; border-top-style: solid; border-bottom-style: solid; border-top-width: 3px; border-bottom-width: 3px;">
            <tr>
                <td class="auto-style19" style="text-align: right; color: #5E308A;">
                    <asp:Label ID="lbl_fullName" runat="server" Text="FULL NAME :"></asp:Label>
                </td>
                <td class="auto-style20">
                    <asp:TextBox ID="txt_fullName" runat="server" Width="320px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqrdval_fullName" runat="server" ControlToValidate="txt_fullName" ErrorMessage="Enter Full Name" ForeColor="Red" ValidationGroup="create"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3" style="text-align: right; color: #5E308A;">
                    <asp:Label ID="lbl_phoneNumber" runat="server" Text="PHONE NUMBER :"></asp:Label>
                </td>
                <td class="auto-style16">
                    <asp:TextBox ID="txt_phoneNumber" runat="server" MaxLength="10" Width="320px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqrdval_phoneNumber" runat="server" ControlToValidate="txt_phoneNumber" ErrorMessage="Enter Phone Number" ForeColor="Red" ValidationGroup="create"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3" style="text-align: right; color: #5E308A;">
                    <asp:Label ID="lbl_optionalNumber" runat="server" Text="OPTIONAL NUMBER :"></asp:Label>
                </td>
                <td class="auto-style16">
                    <asp:TextBox ID="txt_optionalNumber" runat="server" Width="320px"></asp:TextBox>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style3" style="text-align: right; color: #5E308A;">
                    <asp:Label ID="lbl_emailID" runat="server" Text="EMAIL ID :"></asp:Label>
                </td>
                <td class="auto-style16">
                    <asp:TextBox ID="txt_emailID" runat="server" Width="320px"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="rqrdval_emailID" runat="server" ControlToValidate="txt_emailID" ErrorMessage="Enter Email ID" ForeColor="Red" ValidationGroup="create"></asp:RequiredFieldValidator>
                    <asp:Label ID="lbl_error" runat="server" ForeColor="Red" Text="Email ID Already Exists" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3" style="text-align: right; color: #5E308A;">
                    <asp:Label ID="lbl_password" runat="server" Text="PASSWORD :"></asp:Label>
                </td>
                <td class="auto-style16">
                    <asp:TextBox ID="txt_password" runat="server" Width="320px" Height="16px" MaxLength="16" TextMode="Password"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="rqrdval_password" runat="server" ControlToValidate="txt_password" ErrorMessage="Enter Password" ForeColor="Red" ValidationGroup="create"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style8" style="text-align: right; color: #5E308A;">
                    <asp:Label ID="lbl_confirmPassword" runat="server" Text="CONFIRM PASSWORD :"></asp:Label>
                </td>
                <td class="auto-style17">
                    <asp:TextBox ID="txt_confirmPassword" runat="server" Width="320px" MaxLength="16" TextMode="Password"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="rqrdval_confirmPassword" runat="server" ControlToValidate="txt_confirmPassword" ErrorMessage="Confirm Password" ForeColor="Red" ValidationGroup="create"></asp:RequiredFieldValidator>
                &nbsp;<asp:CompareValidator ID="cmpval_confirmPassword" runat="server" ControlToCompare="txt_password" ControlToValidate="txt_confirmPassword" ErrorMessage="Passwords Do Not Match" ForeColor="Red" ValidationGroup="create"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3" style="text-align: right; color: #5E308A;">
                    <asp:Label ID="lbl_gender" runat="server" Text="GENDER :"></asp:Label>
                </td>
                <td class="auto-style16">
                    <asp:RadioButton ID="rdobtn_male" runat="server" GroupName="gender" Text="MALE" style="padding-left:10px;" ValidationGroup="create" />
                    <asp:RadioButton ID="rdobtn_female" runat="server" GroupName="gender" Text="FEMALE" style="padding-left:10px;" ValidationGroup="create"/>
                &nbsp; 
                    <asp:CustomValidator ID="cstmval_gender" runat="server" ClientValidationFunction="check" ErrorMessage="Select Your Gender" ForeColor="Red" ValidationGroup="create"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3" style="text-align: right; color: #5E308A;">
                    <asp:Label ID="lbl_dateOfBirth" runat="server" Text="DATE OF BIRTH :"></asp:Label>
                </td>
                <td class="auto-style16">
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
                    <asp:CustomValidator ID="cstmval_dateOfBirth" runat="server" ClientValidationFunction="checkDOB" ErrorMessage="Enter Date Of Birth" ForeColor="Red" ValidationGroup="create"></asp:CustomValidator>
                    </td>
            </tr>
            <tr>
                <td class="auto-style3" style="text-align: right; color: #5E308A;">
                    <asp:Label ID="lbl_address" runat="server" Text="ADDRESS :"></asp:Label>
                </td>
                <td class="auto-style16">
                    <asp:TextBox ID="txt_address" runat="server" Height="52px" TextMode="MultiLine" Width="320px"></asp:TextBox>
                &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5" style="text-align: right; color: #5E308A;">
                    <asp:Label ID="lbl_city" runat="server" Text="CITY :"></asp:Label>
                </td>
                <td class="auto-style18">
                    <asp:DropDownList ID="drplst_city" runat="server" Width="131px" Height="24px">
                        <asp:ListItem Selected="True" Value="Select City">Select City</asp:ListItem>
                        <asp:ListItem>Allahabad</asp:ListItem>
                        <asp:ListItem>Bangalore</asp:ListItem>
                        <asp:ListItem>Chandigarh</asp:ListItem>
                        <asp:ListItem>Chennai</asp:ListItem>
                        <asp:ListItem>Delhi</asp:ListItem>
                        <asp:ListItem>Hyderabad</asp:ListItem>
                        <asp:ListItem>Jaipur</asp:ListItem>
                        <asp:ListItem>Kolkata</asp:ListItem>
                        <asp:ListItem>Lucknow</asp:ListItem>
                        <asp:ListItem>Mumbai</asp:ListItem>
                    </asp:DropDownList>
                &nbsp;
                     <asp:RequiredFieldValidator ID="rqrdval_city" runat="server" ControlToValidate="drplst_city" ErrorMessage="Select Your City" ForeColor="Red" ValidationGroup="create" InitialValue="Select City"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style5" style="text-align: right; color: #5E308A;">
                    &nbsp;</td>
                <td class="auto-style18">
                    <asp:Button ID="Button1" runat="server" Text="REGISTER" Width="100px" Height="30px" style="margin-left:105px;" OnClick="Button1_Click" ValidationGroup="create" BackColor="#1E96ED" BorderColor="#5E308A" BorderStyle="Solid" ForeColor="#E1E5F0" />
                </td>
            </tr>
            </table>
        <asp:LinkButton runat="server" style="margin-left:48.5%;" PostBackUrl="~/SecurePart/Login.aspx">LOGIN</asp:LinkButton>
    
    </div>
    </form>
</body>
</html>
