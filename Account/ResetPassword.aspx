<%@ Page Title="" Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs"     Inherits                 ="CustomerPortal.Account.ResetPassword" %>

<asp:Content ID="Content" ContentPlaceHolderID="Content" runat="server">
        <%-- Main Menu --%>
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
                            <dx:RibbonButtonItem Name="btnBack" Size="Large" Text="Back" ToolTip="Return to the main customer portal page.">
                                <LargeImage Url="~/Images/Reports/Back.png">
                                </LargeImage>
                            </dx:RibbonButtonItem>
                        </Items>
                    </dx:RibbonGroup>
                    <dx:RibbonGroup Text="User" Name="grpUser">
                        <Items>
                            <dx:RibbonButtonItem Name="btnSend" Size="Large" Text="Send" ToolTip="email user information regarding User login & password.">
                                <LargeImage Url="~/Images/General/SendMail.png">
                                </LargeImage>
                            </dx:RibbonButtonItem>
                        </Items>
                    </dx:RibbonGroup>
                </Groups>
            </dx:RibbonTab>
        </Tabs>
    </dx:ASPxRibbon>

        <%-- Form Title --%>
     <asp:Table  runat="server" ID="Table4"  HorizontalAlign="Center" Width="100%">
         <asp:TableRow HorizontalAlign="Center"><asp:TableCell><dx:ASPxLabel ID="ASPxLabel1" runat="server" Font-Size="X-Large" Text="Lost Password"></dx:ASPxLabel></asp:TableCell></asp:TableRow>
     </asp:Table> 
    <br />
    <br />

     <asp:Table  runat="server" ID="Table2" Width="100%"  >
             <asp:TableRow>
                 <asp:TableCell><dx:ASPxLabel ID="lblNoAccountFound" runat="server" Font-Size="Medium" ForeColor="Red" Text="No accounts were found for the specified email address." Visible="false"></dx:ASPxLabel></asp:TableCell>
             </asp:TableRow>
             <asp:TableRow></asp:TableRow>
                 <asp:TableRow></asp:TableRow>
                 <asp:TableRow></asp:TableRow>
             <asp:TableRow>
                 <asp:TableCell><dx:ASPxTextBox ID="txtEmail" runat="server" Caption="Emal:" Width="300px" ></dx:ASPxTextBox></asp:TableCell>
             </asp:TableRow>
         </asp:Table>

    
      <asp:SqlDataSource ID="dsGetPassword" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="OHSN_Web_GetLostUserPassword" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtEmail" Name="emailAddress" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

</asp:Content>

