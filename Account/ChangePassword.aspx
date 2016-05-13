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

    <%-- Form Header Label --%>
     <asp:Table  runat="server" ID="Table2"  HorizontalAlign="Center">
         <asp:TableRow HorizontalAlign="Center">
               <asp:TableCell></asp:TableCell>
                <asp:TableCell><dx:ASPxLabel ID="ASPxLabel13" runat="server" Font-Size="X-Large" Text="Change Password"></dx:ASPxLabel></asp:TableCell>
                <asp:TableCell></asp:TableCell>
         </asp:TableRow>
          <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
          <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
         <asp:TableRow HorizontalAlign="Center">
             <asp:TableCell></asp:TableCell>
             <asp:TableCell><dx:ASPxLabel ID="ASPxLabel14" runat="server" Wrap="True" Text="In order to change your password, you must first.  Enter your existing password.  Then type a new password and type it again to confirm it.  An acceptable password must have a password strength of at least 'Average'.  Please read the tips on the right for help creating a password."></dx:ASPxLabel></asp:TableCell> 
             <asp:TableCell></asp:TableCell>
         </asp:TableRow>
     </asp:Table> 
    <br />
    <br />
    <asp:Table runat="server" Width="100%" HorizontalAlign="Center">
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell></asp:TableCell>
            <asp:TableCell><dx:ASPxLabel ID="lblPasswordChangeFailed" runat="server" Text="Error changing password!  Please try again." Font-Size="Large" ForeColor="Red" Visible="false" Width="100%"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell></asp:TableCell>
        </asp:TableRow>
    </asp:Table>


        <asp:Table runat="server" id="Table1" Width="100%" >
            <asp:TableRow>
                <%-- Input --%>
                <asp:TableCell>
                    <%-- Change Password Input --%>
                    <asp:Table runat="server" id="MainForm" >
                        <%-- Select Contact --%>
                        <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
                        <%-- Line 1 --%>
                        <asp:TableRow>
                            <%-- Left Margin --%>
                            <asp:TableCell  Width="10%"></asp:TableCell>
                            <%-- Left Column --%>
                             <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Old Password:"></dx:ASPxLabel></asp:TableCell>
                            <asp:TableCell><dx:ASPxTextBox ID="txtOldPassword" runat="server" OnValidation="txtOldPassword_Validation" ></dx:ASPxTextBox></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
                        <%-- Line 2 --%>
                        <asp:TableRow>
                            <%-- Left Margin --%>
                            <asp:TableCell  Width="10%"></asp:TableCell>
                            <%-- Left Column --%>
                             <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="New Password:" ></dx:ASPxLabel></asp:TableCell>
                             <asp:TableCell><dx:ASPxTextBox ID="txtNewPassword" runat="server" AutoPostBack="true" OnTextChanged="txtNewPassword_TextChanged"  OnValidation="txtNewPassword_Validation" ></dx:ASPxTextBox> </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
                        <%-- Line 3 --%>
                        <asp:TableRow>
                            <%-- Left Margin --%>
                            <asp:TableCell  Width="10%"></asp:TableCell>
                            <%-- Left Column --%>
                             <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Confirm Password:" ></dx:ASPxLabel></asp:TableCell>
                            <asp:TableCell><dx:ASPxTextBox ID="txtConfirmPassword" runat="server" OnValidation="txtConfirmPassword_Validation" ></dx:ASPxTextBox></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
                        <%-- Line 4 --%>
                        <asp:TableRow>
                            <%-- Left Margin --%>
                            <asp:TableCell  Width="10%"></asp:TableCell>
                            <%-- Left Column --%>
                             <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Strength of Password:"  ></dx:ASPxLabel></asp:TableCell>
                            <asp:TableCell><dx:ASPxProgressBar ID="pbStrengthOfPassword" runat="server" DisplayMode="Position" Width="75%"><CaptionSettings HorizontalAlign="Center" Position="Bottom" ShowColon="False" VerticalAlign="Middle" /></dx:ASPxProgressBar></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
                    </asp:Table>
                </asp:TableCell>
                <%-- Tips --%>
                <asp:TableCell>
                    <%-- User details --%>
                    <asp:Table runat="server" id="Table3" >
                         <%-- Line 1 --%>
                        <asp:TableRow>
                            <%-- Left Margin --%>
                            <asp:TableCell  Width="10%"></asp:TableCell>
                            <%-- Left Column --%>
                             <asp:TableCell HorizontalAlign="Center"><dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Tips for Creating a new Password" Font-Bold="True"></dx:ASPxLabel></asp:TableCell>
                            <asp:TableCell></asp:TableCell>
                            <asp:TableCell Width="10%"></asp:TableCell>
                        </asp:TableRow>
                         <%-- Line 2 --%>
                        <asp:TableRow>
                            <%-- Left Margin --%>
                            <asp:TableCell  Width="10%"></asp:TableCell>
                            <%-- Left Column --%>
                             <asp:TableCell HorizontalAlign="Left"><dx:ASPxLabel ID="ASPxLabel7" runat="server" Text=" •     Password must be at least 6 characters in length. i.e. AlongPassword"></dx:ASPxLabel></asp:TableCell>
                            <asp:TableCell></asp:TableCell>
                            <asp:TableCell Width="10%"></asp:TableCell>
                        </asp:TableRow>
                         <%-- Line 3 --%>
                        <asp:TableRow>
                            <%-- Left Margin --%>
                            <asp:TableCell  Width="10%"></asp:TableCell>
                            <%-- Left Column --%>
                             <asp:TableCell HorizontalAlign="Left"><dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="     •     Contain a combination of letters, numbers and characters. i.e. @LongP@55w0rd!"></dx:ASPxLabel></asp:TableCell>
                            <asp:TableCell></asp:TableCell>
                            <asp:TableCell Width="10%"></asp:TableCell>
                        </asp:TableRow>
                         <%-- Line 4 --%>
                        <asp:TableRow>
                            <%-- Left Margin --%>
                            <asp:TableCell  Width="10%"></asp:TableCell>
                            <%-- Left Column --%>
                             <asp:TableCell HorizontalAlign="Left"><dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="     •    Do not include your first name, last name, screen name or other obvious words. i.e. Jen123"></dx:ASPxLabel></asp:TableCell>
                            <asp:TableCell></asp:TableCell>
                            <asp:TableCell Width="10%"></asp:TableCell>
                        </asp:TableRow>
                         <%-- Line 5 --%>
                        <asp:TableRow>
                            <%-- Left Margin --%>
                            <asp:TableCell  Width="10%"></asp:TableCell>
                            <%-- Left Column --%>
                             <asp:TableCell HorizontalAlign="Left"><dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="     •     Refrain from using words even if they inlude numbers. i.e. Pa55w0rd"> </dx:ASPxLabel></asp:TableCell>
                            <asp:TableCell></asp:TableCell>
                            <asp:TableCell Width="10%"></asp:TableCell>
                            </asp:TableRow>
                         <%-- Line 6 --%>
                        <asp:TableRow>
                            <%-- Left Margin --%>
                            <asp:TableCell  Width="10%"></asp:TableCell>
                            <%-- Left Column --%>
                             <asp:TableCell HorizontalAlign="Left"><dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="     •     Phases which don't make sense are good. i.e. Th3Purpl3D0g5pe@k55p@nish  (ThePurpleDogSpeaksSpanish)"> </dx:ASPxLabel></asp:TableCell>
                            <asp:TableCell></asp:TableCell>
                            <asp:TableCell Width="10%"></asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>


    

</asp:Content>
