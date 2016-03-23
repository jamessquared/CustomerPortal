<%@ Page Title="" Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="CustomerPortal.Account.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">

    <%-- Toolbar --%>
    <dx:ASPxRibbon ID="mainToolbar" runat="server" ClientInstanceName="MainToolbar" ShowGroupLabels="False" ShowFileTab="False"  ShowTabs="False" OnCommandExecuted="mainToolbar_CommandExecuted">
        <Styles>
                <Item Width="100px"></Item>
                <GroupExpandButton Width="100px"></GroupExpandButton>
            </Styles>
            <Tabs>
            <dx:RibbonTab Name="Main" Text="">
                <Groups>
                    <dx:RibbonGroup Text="">
                        <Items>
                            <dx:RibbonButtonItem Name="btnBack" Size="Large" Text="Back">
                                <LargeImage Url="~/Images/Reports/Back.png">
                                </LargeImage>
                            </dx:RibbonButtonItem>
                        </Items>
                    </dx:RibbonGroup>
                    <dx:RibbonGroup Text="">
                        <Items>
                            <dx:RibbonButtonItem Name="btnSubmit" Size="Large" Text="Submit">
                                <LargeImage Url="~/Images/General/Submit.png">
                                </LargeImage>
                            </dx:RibbonButtonItem>
                            <dx:RibbonButtonItem Name="btnCancel" Size="Large" Text="Cancel">
                                <LargeImage Url="~/Images/General/Cancel.png">
                                </LargeImage>
                            </dx:RibbonButtonItem>
                        </Items>
                    </dx:RibbonGroup>
                </Groups>
            </dx:RibbonTab>
        </Tabs>
    </dx:ASPxRibbon>

    <%-- Select Contact --%>
     <asp:Table  runat="server" ID="Table1"  HorizontalAlign="Center">
         <asp:TableRow><asp:TableCell><dx:ASPxLabel ID="ASPxLabel12" runat="server" Font-Size="X-Large" Text="Change Password"></dx:ASPxLabel></asp:TableCell></asp:TableRow>
         <asp:TableRow><asp:TableCell></asp:TableCell></asp:TableRow>
         <asp:TableRow><asp:TableCell><dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Enter your existing password, type a new password and then type it again to confirm it."></dx:ASPxLabel></asp:TableCell> </asp:TableRow>
         <asp:TableRow><asp:TableCell></asp:TableCell></asp:TableRow>
     </asp:Table> 

    <asp:Table runat="server" Width="100%" HorizontalAlign="Center">
        <asp:TableRow><asp:TableCell><dx:ASPxLabel ID="lblPasswordChangeFailed" runat="server" Text="Error changing password!  Please try again." Font-Size="Large" ForeColor="Red" Visible="false" Width="100%"></dx:ASPxLabel></asp:TableCell></asp:TableRow>

    </asp:Table>


    <asp:Table runat="server" Width="80%" HorizontalAlign="Left">
        <asp:TableRow>
            <%-- Error Message --%>
            <asp:TableCell><dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Error changing password!  Please try again." Font-Size="Large" ForeColor="Red" Visible="false" Width="100%"></dx:ASPxLabel></asp:TableCell>
        </asp:TableRow>
        <%-- Spacer --%>
        <asp:TableRow></asp:TableRow>
        <%-- Old Password --%>
        <asp:TableRow>
            <%-- Left Margin --%>
            <asp:TableCell  Width="10%"></asp:TableCell>
            <%-- Left Column --%>
                  <asp:TableCell><dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Old Password:"></dx:ASPxLabel></asp:TableCell>
                  <asp:TableCell><dx:ASPxTextBox ID="txtOldPassword" runat="server" Password="true" > </dx:ASPxTextBox></asp:TableCell>
            <%-- Center Margin --%>
            <asp:TableCell Width="10%"></asp:TableCell>
            <%-- Right Column --%>
            <asp:TableCell HorizontalAlign="Right"></asp:TableCell>
            <asp:TableCell><dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Tips for Creating a new Password" Font-Bold="True"></dx:ASPxLabel></asp:TableCell>
            <%-- Right Margin --%>
            <asp:TableCell Width="10%"></asp:TableCell>
        </asp:TableRow>
        <%-- Spacer --%>
        <asp:TableRow>
            <asp:TableCell  Width="10%"></asp:TableCell>
            <%-- Left Column --%>
                  <asp:TableCell></asp:TableCell>
            <%-- Center Margin --%>
            <asp:TableCell Width="10%"></asp:TableCell>
            <%-- Right Column --%>
            <asp:TableCell HorizontalAlign="Right"></asp:TableCell>
            <asp:TableCell><dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="     •     Password must be at least 6 characters in length. i.e. AlongPassword"></dx:ASPxLabel></asp:TableCell>
            <%-- Right Margin --%>
            <asp:TableCell Width="10%"></asp:TableCell>
        </asp:TableRow>
        <%-- New Password --%>
        <asp:TableRow>
            <%-- Left Margin --%>
            <asp:TableCell  Width="10%"></asp:TableCell>
            <%-- Left Column --%>
                  <asp:TableCell><dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="New Password:" ></dx:ASPxLabel></dx:ASPxLabel></asp:TableCell>
                  <asp:TableCell><dx:ASPxButtonEdit ID="btnedNewPassword" runat="server" OnButtonClick="btnedNewPassword_ButtonClick" Password="True" OnValueChanged="btnedNewPassword_ValueChanged" ToolTip="Click the button to switch between hide & display password mode!" ><Buttons><dx:EditButton><Image Url="~/Images/Popups/Password-Eyeball-16.png"></Image></dx:EditButton></Buttons></dx:ASPxButtonEdit></asp:TableCell>
            <%-- Center Margin --%>
            <asp:TableCell><dx:ASPxImage ID="ASPxImage1" runat="server" ShowLoadingImage="true" ImageUrl="~/Images/General/Hint-Large.png"> </dx:ASPxImage></asp:TableCell>
            <%-- Right Column --%>
            <asp:TableCell HorizontalAlign="Right"></asp:TableCell>
            <asp:TableCell><dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="     •     Contain a combination of letters, numbers and characters. i.e. aLongPa55w0rd"></dx:ASPxLabel></asp:TableCell>
            <%-- Right Margin --%>
            <asp:TableCell Width="10%"></asp:TableCell>
        </asp:TableRow>
        <%-- Spacer --%>
        <asp:TableRow>
            <asp:TableCell  Width="10%"></asp:TableCell>
            <%-- Left Column --%>
                  <asp:TableCell></asp:TableCell>
            <%-- Center Margin --%>
            <asp:TableCell Width="10%"></asp:TableCell>
            <%-- Right Column --%>
            <asp:TableCell HorizontalAlign="Right"></asp:TableCell>
            <asp:TableCell><dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="     •    Do not include your first name, last name, screen name or other obvious words. i.e. Jen123"></dx:ASPxLabel></asp:TableCell>
            <%-- Right Margin --%>
            <asp:TableCell Width="10%"></asp:TableCell>
        </asp:TableRow>
        <%-- Confirm New Password --%>
        <asp:TableRow>
            <%-- Left Margin --%>
            <asp:TableCell  Width="10%"></asp:TableCell>
            <%-- Left Column --%>
                  <asp:TableCell><dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Confirm Password:" ></dx:ASPxLabel></asp:TableCell>
                  <asp:TableCell><dx:ASPxButtonEdit ID="btnConfirmPassword" runat="server" OnButtonClick="btnConfirmPassword_ButtonClick" Password="True" OnValidation="btnConfirmPassword_Validation"  ToolTip="Click the button to switch between hide & display password mode!" ><Buttons><dx:EditButton><Image Url="~/Images/Popups/Password-Eyeball-16.png"></Image></dx:EditButton></Buttons></dx:ASPxButtonEdit></asp:TableCell>
            <%-- Center Margin --%>
            <asp:TableCell Width="10%"></asp:TableCell>
            <%-- Right Column --%>
            <asp:TableCell HorizontalAlign="Right"></asp:TableCell>
            <asp:TableCell><dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="     •     Refrain from using words even if they inlude numbers. i.e. Pa55w0rd"> </dx:ASPxLabel></asp:TableCell>
            <%-- Right Margin --%>
            <asp:TableCell Width="10%"></asp:TableCell>
        </asp:TableRow>
        <%-- Spacer --%>
        <asp:TableRow></asp:TableRow>
        <%-- Strength of Password --%>
        <asp:TableRow>
            <%-- Left Margin --%>
            <asp:TableCell  Width="10%"></asp:TableCell>
            <%-- Left Column --%>
                  <asp:TableCell><dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Strength of Password:"  ></dx:ASPxLabel></asp:TableCell>
                  <asp:TableCell><dx:ASPxProgressBar ID="pbStrengthOfPassword" runat="server" DisplayMode="Position" Width="75%"><CaptionSettings HorizontalAlign="Center" Position="Bottom" ShowColon="False" VerticalAlign="Middle" /></dx:ASPxProgressBar></asp:TableCell>
            <%-- Center Margin --%>
            <asp:TableCell Width="10%"></asp:TableCell>
            <%-- Right Column --%>
            <asp:TableCell HorizontalAlign="Right"></asp:TableCell>
            <asp:TableCell></asp:TableCell>
            <%-- Right Margin --%>
            <asp:TableCell Width="10%"></asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    </asp:Content>
