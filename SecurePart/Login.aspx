<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="SecurePart_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 451px;
        }
        .auto-style2 {
            margin-left: 270px;
            margin-top: 124px;
        }
    </style>
</head>
<body style="background-color: #E1E5F0">
    <form id="form1" runat="server" class="auto-style1">
    <div style="margin-left:15%;margin-top:15%">
    <asp:Login ID="login_tool" runat="server" BackColor="#E3EAEB" CssClass="auto-style2" Height="250px" Width="400px" BorderColor="#5E308A" BorderPadding="4" BorderStyle="Solid" BorderWidth="2px" Font-Names="Verdana" Font-Size="0.9em" ForeColor="#5E308A" TextLayout="TextOnTop" LoginButtonText="LOGIN" OnAuthenticate="Login1_Authenticate" FailureText="Invalid User Name Or Password" RememberMeText="Remember Me">
            <InstructionTextStyle Font-Italic="True" ForeColor="Black"/>
            <LoginButtonStyle BackColor="White" BorderColor="#C5BBAF" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="1.5em" ForeColor="#5E308A" />
            <TextBoxStyle Font-Size="1.5em" />
            <TitleTextStyle ForeColor="White" BackColor="#5E308A" Font-Bold="True" Font-Size="1.2em" />
        </asp:Login>
        <br />
        <asp:LinkButton runat="server" style="margin-left:35%;" PostBackUrl="~/CreateAccount.aspx">CREATE AN ACCOUNT</asp:LinkButton>
    </div>
        
    </form>
</body>
</html>
