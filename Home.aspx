<%@ Page Title="" Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style15 {
            width: 100%;
            background-color: #E1E5F0;
        }
        .auto-style19 {
            width: 423px;
            height: 26px;
        }
        .auto-style20 {
            height: 26px;
        }
        .auto-style21 {
            height: 26px;
            width: 122px;
        }
        .auto-style23 {
            margin-left: 0px;
        }
        .search{
            height:20px;
            border-radius:20px;
            width:500px;
            border-style:solid;
            border-color:#5E308A;
            padding-left:5px;
            padding-right:5px;
        }
        .search_icon{
            margin-top:5px;
        }
        .auto-style28 {
            width: 423px;
            height: 374px;
        }
        .auto-style29 {
            height: 374px;
            width: 122px;
        }
        .auto-style30 {
            height: 374px;
        }
        .auto-style33 {
            height: 120px;
        }
        .intro{
            box-shadow:2px 2px;
        }
        .left_button{
            margin-right:-90px;
        }
        .auto-style34 {
            height: 20px;
            border-radius: 20px;
            width: 500px;
            border-style: solid;
            border-color: #5E308A;
            padding-left: 5px;
            padding-right: 5px;
            margin-left: 0px;
        }
        .auto-style35 {
            margin-top: 0px;
        }
        .lst{
            margin-top:-200px;
            margin-bottom:25px;
            border-radius: 20px;
            border-style: solid;
            border-color: #5E308A;
            padding-left: 5px;
            padding-right: 5px;
            padding-top:5px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">
    
    <table class="auto-style15" style="margin-top:-20px;">
        <tr>
            <td class="auto-style19"></td>
            <td class="auto-style21" style="align-content:flex-start">
            <asp:TextBox ID="txt_search" runat="server" Width="500px" CssClass="auto-style34"></asp:TextBox>
            </td>
            <td class="auto-style20">
            <asp:ImageButton ID="imgbtn_search" runat="server" CssClass="auto-style23 search_icon" Height="20px" ImageUrl="~/Images/search.png" Width="33px" OnClick="imgbtn_search_Click" />
                <asp:DropDownList ID="drplst_id" runat="server" Visible="False">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style28" style="text-align: right;">
                <asp:ImageButton ID="imgbtn_left" runat="server" ImageUrl="~/Images/left.png" onmousedown="previous()" CssClass="left_button"/>
                <asp:Label ID="lbl_image1" runat="server" ForeColor="#E1E5F0" Text="/Images/1.jpg"></asp:Label>
            </td>
            <td class="auto-style29" style="width:514px;height:350px; vertical-align: top;padding-top:20px;padding-bottom:20px">
                <asp:ListBox ID="lst_search" runat="server" CssClass="auto-style35 lst" Height="18px" Width="514px" Visible="False"></asp:ListBox>
                <asp:Image ID="img_homeDisplay" runat="server" ImageUrl="~/Images/Explore_India_icon.jpg" Width="514px" Height="350px"/>
                <asp:Label ID="lbl_imageNumber" runat="server" ForeColor="#E1E5F0" Text="1"></asp:Label>
                <asp:Label ID="lbl_image2" runat="server" ForeColor="#E1E5F0" Text="/Images/2.jpg"></asp:Label>
            </td>
            <td class="auto-style30">
                <asp:ImageButton ID="imgbtn_right" runat="server" ImageUrl="~/Images/right.png" onmousedown="next()"/>
                <asp:Label ID="lbl_image3" runat="server" ForeColor="#E1E5F0" Text="/Images/3.jpg"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style33 intro" colspan="3" style="border: medium solid #5E308A; vertical-align: top; color: #1E96ED; font-size: x-large;">Now you can stop worrying about planning your own trips. We are here for you to make all the arrangements. You want to go on a trip so that you can relax and be free from all the worries of life. So why plan your own trip? Let us help you. We guarantee complete customer satisfaction. You can select the place where you want to go and with just a click all your worries become our responsibility. If you are not yet a member of our family then sign up and be a part of this wonderful experience.</td>
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
                        document.getElementById("<%=img_homeDisplay.ClientID%>").src = document.getElementById("<%=lbl_image2.ClientID%>").textContent;
                        document.getElementById("<%=lbl_imageNumber.ClientID%>").textContent = "2";
                    }
                    break;
                case "2":
                    if (document.getElementById("<%=lbl_image3.ClientID%>").textContent != "Label")
                    {
                        document.getElementById("<%=img_homeDisplay.ClientID%>").src = document.getElementById("<%=lbl_image3.ClientID%>").textContent;
                        document.getElementById("<%=lbl_imageNumber.ClientID%>").textContent = "3";
                    }
                    else
                    {
                        document.getElementById("<%=img_homeDisplay.ClientID%>").src = document.getElementById("<%=lbl_image1.ClientID%>").textContent;
                        document.getElementById("<%=lbl_imageNumber.ClientID%>").textContent = "1";
                    }
                    break;
                case "3":
                        document.getElementById("<%=img_homeDisplay.ClientID%>").src = document.getElementById("<%=lbl_image1.ClientID%>").textContent;
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
                        document.getElementById("<%=img_homeDisplay.ClientID%>").src = document.getElementById("<%=lbl_image3.ClientID%>").textContent;
                        document.getElementById("<%=lbl_imageNumber.ClientID%>").textContent = "3";
                    }
                    else if(document.getElementById("<%=lbl_image2.ClientID%>").textContent != "Label")
                    {
                        document.getElementById("<%=img_homeDisplay.ClientID%>").src = document.getElementById("<%=lbl_image2.ClientID%>").textContent;
                        document.getElementById("<%=lbl_imageNumber.ClientID%>").textContent = "2";
                    }
                    break;
                case "2":
                        document.getElementById("<%=img_homeDisplay.ClientID%>").src = document.getElementById("<%=lbl_image1.ClientID%>").textContent;
                        document.getElementById("<%=lbl_imageNumber.ClientID%>").textContent = "1";
                    break;
                case "3":
                        document.getElementById("<%=img_homeDisplay.ClientID%>").src = document.getElementById("<%=lbl_image2.ClientID%>").textContent;
                        document.getElementById("<%=lbl_imageNumber.ClientID%>").textContent = "2";
                    break;
            }
        }
    </script>
</asp:Content>


