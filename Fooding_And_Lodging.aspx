<%@ Page Title="" Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true" CodeFile="Fooding_And_Lodging.aspx.cs" Inherits="Fooding_And_Lodging" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style15 {
            width: 100%;
            border-style: solid;
            border-width: 1px;
            background-color: #E1E5F0;
        }
        .auto-style17 {
            width: 236px;
        }
        .auto-style18 {
            width: 235px;
        }
        .auto-style19 {
            margin-left: 58px;
        }
        .tree{

        }
        .makeSmall
        {
            font-size:xx-small;
        }
        .link
        {
            color:#1E96ED;
        }
        .auto-style20 {
            width: 235px;
            height: 27px;
        }
        .auto-style21 {
            height: 27px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="0" class="auto-style15">
        <tr>
            <td class="auto-style17" rowspan="3" style="vertical-align: top; padding-top: 10px; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-right-width: medium; border-bottom-width: medium; border-left-width: medium; border-right-color: #1E96ED; border-bottom-color: #1E96ED; border-left-color: #1E96ED;">
                <asp:TreeView ID="treeview_hotels" runat="server" CssClass="tree">
                    <Nodes>
                        <asp:TreeNode Text="Goa" Value="Goa">
                            <asp:TreeNode NavigateUrl="~/Fooding_And_Lodging.aspx?pageid=2&amp;hotelID=H101" Text="Arya Cottages" Value="Arya Cottages"></asp:TreeNode>
                            <asp:TreeNode NavigateUrl="~/Fooding_And_Lodging.aspx?pageid=2&amp;hotelID=H104" Text="Deltin Palms Riverfront" Value="Deltin Palms Riverfront"></asp:TreeNode>
                            <asp:TreeNode NavigateUrl="~/Fooding_And_Lodging.aspx?pageid=2&amp;hotelID=H103" Text="Dunhill Beach Resort" Value="Dunhill Beach Resort"></asp:TreeNode>
                        </asp:TreeNode>
                        <asp:TreeNode Text="Haridwar" Value="Haridwar">
                            <asp:TreeNode Text="La Casa" Value="No Hotel" NavigateUrl="~/Fooding_And_Lodging.aspx?pageid=2&amp;hotelID=H106"></asp:TreeNode>
                        </asp:TreeNode>
                        <asp:TreeNode Text="Kolkata" Value="Kolkata">
                            <asp:TreeNode Text="Taj Bengal" Value="No Hotel" NavigateUrl="~/Fooding_And_Lodging.aspx?pageid=2&amp;hotelID=H105"></asp:TreeNode>
                        </asp:TreeNode>
                        <asp:TreeNode Text="Manali" Value="Manali">
                            <asp:TreeNode NavigateUrl="~/Fooding_And_Lodging.aspx?pageid=2&amp;hotelID=H102" Text="Apple Country Resort" Value="Apple Country Resort"></asp:TreeNode>
                        </asp:TreeNode>
                    </Nodes>
                </asp:TreeView>
                <br />
                <asp:Label ID="lbl_imageNumber" runat="server" Text="Label" CssClass="makeSmall" ForeColor="#E1E5F0"></asp:Label>
                <asp:Label ID="lbl_room1" runat="server" Text="Label" CssClass="makeSmall" ForeColor="#E1E5F0"></asp:Label>
                <asp:Label ID="lbl_image3" runat="server" Text="Label" CssClass="makeSmall" ForeColor="#E1E5F0"></asp:Label>
                <br />
                <asp:Label ID="lbl_image1" runat="server" Text="Label" CssClass="makeSmall" ForeColor="#E1E5F0"></asp:Label>
                <asp:Label ID="lbl_image2" runat="server" Text="Label" CssClass="makeSmall" ForeColor="#E1E5F0"></asp:Label>
                <br />
                <asp:Label ID="lbl_room2" runat="server" Text="Label" CssClass="makeSmall" ForeColor="#E1E5F0"></asp:Label>
                <asp:Label ID="lbl_room3" runat="server" Text="Label" CssClass="makeSmall" ForeColor="#E1E5F0"></asp:Label>
            </td>
            <td class="auto-style20"></td>
            <td class="auto-style21" style="text-align: center">
                <asp:Label ID="lbl_foodingAndLodging" runat="server" Font-Bold="True" Font-Size="XX-Large" ForeColor="#5E308A" Text="FOODING &amp; LODGING"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style18">
                <asp:ImageButton ID="imgbtn_left" runat="server" ImageUrl="~/Images/left.png" style="margin-left:85%;" onmousedown="previous()"/>
            </td>
            <td class="auto-style29" style="width:514px;height:350px; vertical-align: top;padding-top:0px;padding-bottom:20px">
                <asp:Image ID="img_hotelDisplay" runat="server" ImageUrl="~/Images/foodingAndLodging.jpg" Width="514px" Height="350px" CssClass="auto-style19"/>
            </td>
            <td class="auto-style30">
                <asp:ImageButton ID="imgbtn_right" runat="server" ImageUrl="~/Images/right.png" onmousedown="next()"/>
                <br />
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
                        document.getElementById("<%=img_hotelDisplay.ClientID%>").src = document.getElementById("<%=lbl_image2.ClientID%>").textContent;
                        document.getElementById("<%=lbl_imageNumber.ClientID%>").textContent = "2";
                    }
                    else
                    {
                        document.getElementById("<%=img_hotelDisplay.ClientID%>").src = document.getElementById("<%=lbl_room1.ClientID%>").textContent;
                        document.getElementById("<%=lbl_imageNumber.ClientID%>").textContent = "4";
                    }
                    break;
                case "2":
                    if (document.getElementById("<%=lbl_image3.ClientID%>").textContent != "Label")
                    {
                        document.getElementById("<%=img_hotelDisplay.ClientID%>").src = document.getElementById("<%=lbl_image3.ClientID%>").textContent;
                        document.getElementById("<%=lbl_imageNumber.ClientID%>").textContent = "3";
                    }
                    else
                    {
                        document.getElementById("<%=img_hotelDisplay.ClientID%>").src = document.getElementById("<%=lbl_room1.ClientID%>").textContent;
                        document.getElementById("<%=lbl_imageNumber.ClientID%>").textContent = "4";
                    }
                    break;
                case "3":
                        document.getElementById("<%=img_hotelDisplay.ClientID%>").src = document.getElementById("<%=lbl_room1.ClientID%>").textContent;
                        document.getElementById("<%=lbl_imageNumber.ClientID%>").textContent = "4";
                    break;
                case "4":
                    if (document.getElementById("<%=lbl_room2.ClientID%>").textContent != "Label")
                    {
                        document.getElementById("<%=img_hotelDisplay.ClientID%>").src = document.getElementById("<%=lbl_room2.ClientID%>").textContent;
                        document.getElementById("<%=lbl_imageNumber.ClientID%>").textContent = "5";
                    }
                    else
                    {
                        document.getElementById("<%=img_hotelDisplay.ClientID%>").src = document.getElementById("<%=lbl_image1.ClientID%>").textContent;
                        document.getElementById("<%=lbl_imageNumber.ClientID%>").textContent = "1";
                    }
                    break;
                case "5":
                    if (document.getElementById("<%=lbl_room3.ClientID%>").textContent != "Label")
                    {
                        document.getElementById("<%=img_hotelDisplay.ClientID%>").src = document.getElementById("<%=lbl_room3.ClientID%>").textContent;
                        document.getElementById("<%=lbl_imageNumber.ClientID%>").textContent = "6";
                    }
                    else
                    {
                        document.getElementById("<%=img_hotelDisplay.ClientID%>").src = document.getElementById("<%=lbl_image1.ClientID%>").textContent;
                        document.getElementById("<%=lbl_imageNumber.ClientID%>").textContent = "1";
                    }
                    break;
                case "6":
                    document.getElementById("<%=img_hotelDisplay.ClientID%>").src = document.getElementById("<%=lbl_image1.ClientID%>").textContent;
                    document.getElementById("<%=lbl_imageNumber.ClientID%>").textContent = "1";
                    break;
            }
        }
        function previous()
        {
             switch(document.getElementById("<%=lbl_imageNumber.ClientID%>").textContent)
            {
                case "1":
                    if (document.getElementById("<%=lbl_room3.ClientID%>").textContent != "Label")
                    {
                        document.getElementById("<%=img_hotelDisplay.ClientID%>").src = document.getElementById("<%=lbl_room3.ClientID%>").textContent;
                        document.getElementById("<%=lbl_imageNumber.ClientID%>").textContent = "6";
                    }
                    else if(document.getElementById("<%=lbl_room2.ClientID%>").textContent != "Label")
                    {
                        document.getElementById("<%=img_hotelDisplay.ClientID%>").src = document.getElementById("<%=lbl_room2.ClientID%>").textContent;
                        document.getElementById("<%=lbl_imageNumber.ClientID%>").textContent = "5";
                    }
                    else
                    {
                        document.getElementById("<%=img_hotelDisplay.ClientID%>").src = document.getElementById("<%=lbl_room1.ClientID%>").textContent;
                        document.getElementById("<%=lbl_imageNumber.ClientID%>").textContent = "4";
                    }
                    break;
                case "2":
                        document.getElementById("<%=img_hotelDisplay.ClientID%>").src = document.getElementById("<%=lbl_image1.ClientID%>").textContent;
                        document.getElementById("<%=lbl_imageNumber.ClientID%>").textContent = "1";
                    break;
                case "3":
                        document.getElementById("<%=img_hotelDisplay.ClientID%>").src = document.getElementById("<%=lbl_image2.ClientID%>").textContent;
                        document.getElementById("<%=lbl_imageNumber.ClientID%>").textContent = "2";
                    break;
                 case "4":
                    if (document.getElementById("<%=lbl_image3.ClientID%>").textContent != "Label")
                    {
                        document.getElementById("<%=img_hotelDisplay.ClientID%>").src = document.getElementById("<%=lbl_image3.ClientID%>").textContent;
                        document.getElementById("<%=lbl_imageNumber.ClientID%>").textContent = "3";
                    }
                    else if(document.getElementById("<%=lbl_image2.ClientID%>").textContent != "Label")
                    {
                        document.getElementById("<%=img_hotelDisplay.ClientID%>").src = document.getElementById("<%=lbl_image2.ClientID%>").textContent;
                        document.getElementById("<%=lbl_imageNumber.ClientID%>").textContent = "2";
                    }
                    else
                    {
                        document.getElementById("<%=img_hotelDisplay.ClientID%>").src = document.getElementById("<%=lbl_image1.ClientID%>").textContent;
                        document.getElementById("<%=lbl_imageNumber.ClientID%>").textContent = "1";
                    }
                     break;
                 case "5":
                     document.getElementById("<%=img_hotelDisplay.ClientID%>").src = document.getElementById("<%=lbl_room1.ClientID%>").textContent;
                     document.getElementById("<%=lbl_imageNumber.ClientID%>").textContent = "4";
                     break;
                 case "6":
                     document.getElementById("<%=img_hotelDisplay.ClientID%>").src = document.getElementById("<%=lbl_room2.ClientID%>").textContent;
                     document.getElementById("<%=lbl_imageNumber.ClientID%>").textContent = "5";
                     break;
            }
        }
    </script>
</asp:Content>

