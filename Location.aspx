<%@ Page Title="" Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true" CodeFile="Location.aspx.cs" Inherits="Location" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style15 {
            width: 100%;
            border: 1px solid #E1E5F0;
        }
        .auto-style16 {
            height: 107px;
        }
        .auto-style17 {
            width: 415px;
        }
        .shadow{
            text-shadow:2px 1px;
            padding-right:10px;
        }
        .auto-style19 {
            width: 423px;
            height: 27px;
        }
        .auto-style20 {
            height: 27px;
        }
    </style>
</asp:Content >
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="left" class="auto-style15" style="margin-top:-20px;">
        <tr>
            <td class="auto-style19" colspan="3" style="text-align: center; font-size: xx-large; font-weight: bold; color: #5E308A;align-content:center;">
                <asp:Label ID="lbl_location" runat="server" Text="Location"></asp:Label>
            </td>
            <td class="auto-style20"></td>
            <td class="auto-style20"></td>
        </tr>
       <tr>
            <td class="auto-style17">
                <asp:ImageButton ID="imgbtn_left" runat="server" ImageUrl="~/Images/left.png" style="margin-left:78%;" onmousedown="previous()"/>
                <asp:Label ID="lbl_image1" runat="server" Text="Label" Enabled="False" ForeColor="#E1E5F0"></asp:Label>
                <asp:Label ID="lbl_image2" runat="server" Text="Label" Enabled="False" ForeColor="#E1E5F0"></asp:Label>
                <asp:Label ID="lbl_image3" runat="server" Text="Label" Enabled="False" ForeColor="#E1E5F0"></asp:Label>
                <asp:Label ID="lbl_imageNumber" runat="server" Text="Label" Enabled="False" ForeColor="#E1E5F0"></asp:Label>
            </td>
            <td class="auto-style29" style="width:514px;height:350px; vertical-align: top;padding-top:0px;padding-bottom:20px">
                <asp:Image ID="img_locationDisplay" runat="server" ImageUrl="~/Images/Explore_India_icon.jpg" Width="514px" Height="350px"/>
            </td>
            <td class="auto-style30">
                <asp:ImageButton ID="imgbtn_right" runat="server" ImageUrl="~/Images/right.png" onmousedown="next()"/>
            </td>
        </tr>
         <tr>
            <td class="auto-style33 intro" colspan="3" style="border: medium solid #5E308A; vertical-align: top; color: #1E96ED; font-size: x-large;">
                <asp:Label ID="lbl_text" runat="server"></asp:Label>
             </td>
        </tr>
        <tr>
            <td class="auto-style17" style="text-align: right;color: #5E308A; font-weight: bold; font-style: italic; font-size: xx-large; border-bottom-style: solid; border-left-style: solid; border-bottom-width: medium; border-left-width: medium; border-bottom-color: #1E96ED; border-left-color: #1E96ED; padding-top:50px; vertical-align: top;">ATTRACTIONS:</td>
            <td class="auto-style16" style="border-right-style: solid; border-bottom-style: solid; border-right-width: medium; border-bottom-width: medium; border-right-color: #1E96ED; border-bottom-color: #1E96ED; border-left-width: thick; border-left-style: double; border-left-color: #1E96ED; padding-left:20px; vertical-align: top; padding-top:10px;" colspan="2">
                <asp:GridView ID="grdview_attractions" runat="server" AutoGenerateColumns="False" BorderColor="#E1E5F0" BorderStyle="Solid" OnSelectedIndexChanged="grdview_attractions_SelectedIndexChanged">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Label ID="lbl_attractions" runat="server" Text='<% #Eval("attractionname") %>' ForeColor="#5E308A"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField SelectText="View Attraction" ShowSelectButton="true" />
                    </Columns>
                </asp:GridView>
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
                        document.getElementById("<%=img_locationDisplay.ClientID%>").src = document.getElementById("<%=lbl_image2.ClientID%>").textContent;
                        document.getElementById("<%=lbl_imageNumber.ClientID%>").textContent = "2";
                    }
                    break;
                case "2":
                    if (document.getElementById("<%=lbl_image3.ClientID%>").textContent != "Label")
                    {
                        document.getElementById("<%=img_locationDisplay.ClientID%>").src = document.getElementById("<%=lbl_image3.ClientID%>").textContent;
                        document.getElementById("<%=lbl_imageNumber.ClientID%>").textContent = "3";
                    }
                    else
                    {
                        document.getElementById("<%=img_locationDisplay.ClientID%>").src = document.getElementById("<%=lbl_image1.ClientID%>").textContent;
                        document.getElementById("<%=lbl_imageNumber.ClientID%>").textContent = "1";
                    }
                    break;
                case "3":
                        document.getElementById("<%=img_locationDisplay.ClientID%>").src = document.getElementById("<%=lbl_image1.ClientID%>").textContent;
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
                        document.getElementById("<%=img_locationDisplay.ClientID%>").src = document.getElementById("<%=lbl_image3.ClientID%>").textContent;
                        document.getElementById("<%=lbl_imageNumber.ClientID%>").textContent = "3";
                    }
                    else if(document.getElementById("<%=lbl_image2.ClientID%>").textContent != "Label")
                    {
                        document.getElementById("<%=img_locationDisplay.ClientID%>").src = document.getElementById("<%=lbl_image2.ClientID%>").textContent;
                        document.getElementById("<%=lbl_imageNumber.ClientID%>").textContent = "2";
                    }
                    break;
                case "2":
                        document.getElementById("<%=img_locationDisplay.ClientID%>").src = document.getElementById("<%=lbl_image1.ClientID%>").textContent;
                        document.getElementById("<%=lbl_imageNumber.ClientID%>").textContent = "1";
                    break;
                case "3":
                        document.getElementById("<%=img_locationDisplay.ClientID%>").src = document.getElementById("<%=lbl_image2.ClientID%>").textContent;
                        document.getElementById("<%=lbl_imageNumber.ClientID%>").textContent = "2";
                    break;
            }
        }
    </script>
</asp:Content>

