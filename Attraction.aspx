<%@ Page Title="" Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true" CodeFile="Attraction.aspx.cs" Inherits="Attraction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style15 {
            width: 1344px;
        }
        .auto-style16 {
            width: 423px;
            height: 384px;
        }
        .auto-style17 {
            width: 514px;
            height: 384px;
        }
        .auto-style18 {
            height: 384px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table align="left" class="auto-style15" style="margin-top: -20px;">
        <tr>
            <td class="auto-style19" colspan="3" style="text-align: center; font-size: xx-large; font-weight: bold; color: #5E308A;align-content:center;">
                <asp:Label ID="lbl_attraction" runat="server" Text="Attraction" Font-Size="XX-Large"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style16">
                <asp:ImageButton ID="imgbtn_left" runat="server" ImageUrl="~/Images/left.png" onmousedown="previous()" style="margin-left:78%;" />
                <asp:Label ID="lbl_image1" runat="server" Enabled="False" ForeColor="#E1E5F0" Text="Label"></asp:Label>
            </td>
            <td class="auto-style17" style="vertical-align: top;padding-top:0px;padding-bottom:20px">
                <asp:Image ID="img_attractionDisplay" runat="server" Height="350px" ImageUrl="~/Images/Explore_India_icon.jpg" Width="514px" />
                <asp:Label ID="lbl_imageNumber" runat="server" Enabled="False" ForeColor="#E1E5F0"  Text="Label"></asp:Label>
                <asp:Label ID="lbl_image3" runat="server" Enabled="False" ForeColor="#E1E5F0" Text="Label"></asp:Label>
            </td>
            <td class="auto-style18">
                <asp:ImageButton ID="imgbtn_right" runat="server" ImageUrl="~/Images/right.png" onmousedown="next()" />
                <asp:Label ID="lbl_image2" runat="server" Enabled="False" ForeColor="#E1E5F0" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style33 intro" colspan="3" style="border: medium solid #5E308A; vertical-align: top; color: #1E96ED; font-size: x-large;">
                <asp:Label ID="lbl_text" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <script type="text/javascript">
        function next()
        {
            switch(document.getElementById("<%=lbl_imageNumber.ClientID%>").textContent)
            {
                case "1":
                    if (document.getElementById("<%=lbl_image2.ClientID%>").textContent != "Label")
                    {
                        document.getElementById("<%=img_attractionDisplay.ClientID%>").src = document.getElementById("<%=lbl_image2.ClientID%>").textContent;
                        document.getElementById("<%=lbl_imageNumber.ClientID%>").textContent = "2";
                    }
                    break;
                case "2":
                    if (document.getElementById("<%=lbl_image3.ClientID%>").textContent != "Label")
                    {
                        document.getElementById("<%=img_attractionDisplay.ClientID%>").src = document.getElementById("<%=lbl_image3.ClientID%>").textContent;
                        document.getElementById("<%=lbl_imageNumber.ClientID%>").textContent = "3";
                    }
                    else
                    {
                        document.getElementById("<%=img_attractionDisplay.ClientID%>").src = document.getElementById("<%=lbl_image1.ClientID%>").textContent;
                        document.getElementById("<%=lbl_imageNumber.ClientID%>").textContent = "1";
                    }
                    break;
                case "3":
                        document.getElementById("<%=img_attractionDisplay.ClientID%>").src = document.getElementById("<%=lbl_image1.ClientID%>").textContent;
                        document.getElementById("<%=lbl_imageNumber.ClientID%>").textContent = "1";
                    break;
            }
        }
        function previous()
        {
             switch(document.getElementById("<%=lbl_imageNumber.ClientID%>").textContent)
            {
                case "1":
                    if (document.getElementById("<%=lbl_image3.ClientID%>").textContent != "Label")
                    {
                        document.getElementById("<%=img_attractionDisplay.ClientID%>").src = document.getElementById("<%=lbl_image3.ClientID%>").textContent;
                        document.getElementById("<%=lbl_imageNumber.ClientID%>").textContent = "3";
                    }
                    else if(document.getElementById("<%=lbl_image2.ClientID%>").textContent != "Label")
                    {
                        document.getElementById("<%=img_attractionDisplay.ClientID%>").src = document.getElementById("<%=lbl_image2.ClientID%>").textContent;
                        document.getElementById("<%=lbl_imageNumber.ClientID%>").textContent = "2";
                    }
                    break;
                case "2":
                        document.getElementById("<%=img_attractionDisplay.ClientID%>").src = document.getElementById("<%=lbl_image1.ClientID%>").textContent;
                        document.getElementById("<%=lbl_imageNumber.ClientID%>").textContent = "1";
                    break;
                case "3":
                        document.getElementById("<%=img_attractionDisplay.ClientID%>").src = document.getElementById("<%=lbl_image2.ClientID%>").textContent;
                        document.getElementById("<%=lbl_imageNumber.ClientID%>").textContent = "2";
                    break;
            }
        }
    </script>
</asp:Content>

