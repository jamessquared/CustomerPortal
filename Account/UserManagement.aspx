<%@ Page Title="" Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeBehind="UserManagement.aspx.cs" Inherits="CustomerPortal.Account.UserManagement" %>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <script type="text/javascript">

    </script>

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
                    <dx:RibbonGroup Text="User" Name="grpUser" Visible="False">
                        <Items>
                            <dx:RibbonButtonItem Name="btnAdd" Size="Large" Text="Add" ToolTip="Create new users.">
                                <LargeImage Url="~/Images/General/Add.png">
                                </LargeImage>
                            </dx:RibbonButtonItem>
                            <dx:RibbonButtonItem Name="btnEdit" Size="Large" Text="Edit"  ToolTip="Change an existing users information or privileges.">
                                <LargeImage Url="~/Images/General/Edit.png">
                                </LargeImage>
                            </dx:RibbonButtonItem>
                            <dx:RibbonButtonItem Name="btnDelete" Size="Large" Text="Delete"  ToolTip="Remove an existing user.">
                                <LargeImage Url="~/Images/General/Delete.png">
                                </LargeImage>
                            </dx:RibbonButtonItem>
                        </Items>
                    </dx:RibbonGroup>
                    <dx:RibbonGroup Name="grpManage" Text="Edit User" Visible="False">
                        <Items>
                            <dx:RibbonButtonItem Name="btnResetPassword" Size="Large" Text="Reset" ToolTip="Sets the user password to a temporary specifedpassword and forces the user to create a new password upon their next log in.  ">
                                <LargeImage Url="~/Images/General/Reset User.png">
                                </LargeImage>
                                <ItemStyle Wrap="True" Font-Bold="False" />
                            </dx:RibbonButtonItem>
                            <dx:RibbonButtonItem Name="btnDeactivate" Size="Large" Text="Deactivate"  ToolTip="Disables a user's account">
                                <LargeImage Url="~/Images/General/Deactivate User.png">
                                </LargeImage>
                            </dx:RibbonButtonItem>
                        </Items>
                    </dx:RibbonGroup>
                </Groups>
            </dx:RibbonTab>
        </Tabs>
    </dx:ASPxRibbon>

        <%-- Form Title --%>
     <asp:Table  runat="server" ID="Table1"  HorizontalAlign="Center" Width="100%">
         <asp:TableRow HorizontalAlign="Center"><asp:TableCell><dx:ASPxLabel ID="ASPxLabel3" runat="server" Font-Size="X-Large" Text="Account Management"></dx:ASPxLabel></asp:TableCell></asp:TableRow>
     </asp:Table> 
    <br />
    <br />
     <asp:Table  runat="server" ID="tblUsers"  Width="100%"  HorizontalAlign="Center">
         <asp:TableRow ><asp:TableCell><dx:ASPxLabel ID="ASPxLabel1" runat="server" Font-Size="Large" Text="Users"></dx:ASPxLabel></asp:TableCell></asp:TableRow>
         <asp:TableRow><asp:TableCell></asp:TableCell></asp:TableRow>
        <%--User Grid--%>
             <asp:TableRow HorizontalAlign="Center" Width="100%">
                    <asp:TableCell>
                            <dx:ASPxGridView ID="gvAccountManagementUsers" runat="server" AutoGenerateColumns="False" DataSourceID="dsUserManagementUsers" KeyFieldName="ContactID"  Width="100%" EnableCallBacks="False" OnSelectionChanged="gvAccountManagementUsers_SelectionChanged" ClientInstanceName="gvAccountManagementUsers">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="ContactID" ReadOnly="True" VisibleIndex="7" Visible="False">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="EmployerID" VisibleIndex="8" Visible="False">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="LastName" ReadOnly="True" VisibleIndex="0" Width="20%">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="FirstName" ReadOnly="True" VisibleIndex="1" Width="20%">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Email Type" VisibleIndex="9" Visible="False">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Email" ReadOnly="True" VisibleIndex="2" Width="20%">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="UserName" ReadOnly="True" VisibleIndex="3" Width="20%">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="UserLevel" VisibleIndex="4" Width="10%">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataDateColumn FieldName="LastLoginDate" VisibleIndex="5" Width="5%">
                                    </dx:GridViewDataDateColumn>
                                    <dx:GridViewDataCheckColumn FieldName="Active" VisibleIndex="6" Width="5%">
                                    </dx:GridViewDataCheckColumn>
                                </Columns>
                                    <SettingsBehavior AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" ProcessFocusedRowChangedOnServer="True" ProcessSelectionChangedOnServer="True" SelectionStoringMode="PerformanceOptimized" />
                                    <SettingsPager Visible="False">
                                    </SettingsPager>
                                    <Settings ShowFilterRow="True" />
                                    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                            </dx:ASPxGridView>
                    </asp:TableCell>
         </asp:TableRow>
         <asp:TableRow><asp:TableCell></asp:TableCell></asp:TableRow>
     </asp:Table>  
    <br />

                                


    <br />
     <asp:Table  runat="server" ID="tblPrivileges"  Width="100%" HorizontalAlign="Center" >       
        <asp:TableRow><asp:TableCell><dx:ASPxLabel ID="ASPxLabel2" runat="server" Font-Size="Large" Text="Privileges"></dx:ASPxLabel></asp:TableCell></asp:TableRow>
         <asp:TableRow><asp:TableCell></asp:TableCell></asp:TableRow>
         <%--Privileges Grid--%>
         <asp:TableRow>
             <asp:TableCell>
                    <dx:ASPxGridView ID="gvUserPrivileges" runat="server" Width="75%" AutoGenerateColumns="False" DataSourceID="dsAccountManagementUserPrivileges" ClientInstanceName="Privileges" EnableCallBacks="False">
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="Page" VisibleIndex="0" Width="70%"  Caption="Page">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataCheckColumn FieldName="View" VisibleIndex="1" Width="10%"  Caption="Access">
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn FieldName="ManageData" VisibleIndex="2" Width="10%"  Caption="Add/Edit/Delete">
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn FieldName="Print" VisibleIndex="3" Width="10%"  Caption="Print">
                            </dx:GridViewDataCheckColumn>
                        </Columns>
                     <SettingsBehavior AllowDragDrop="False" AllowGroup="False" AllowSelectByRowClick="True" ProcessSelectionChangedOnServer="True" />
                </dx:ASPxGridView>
             </asp:TableCell>
         </asp:TableRow>
     </asp:Table>     
   <br />
    <br />



    <%--Data Source--%>
    <asp:SqlDataSource ID="dsUserManagementUsers" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="ohsn_Web_GetUserManagementUsers_Select" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="" Name="EmployerID" SessionField="WorkingEmployerID" Type="Int64" />
        </SelectParameters>
    </asp:SqlDataSource>
 
    <asp:SqlDataSource ID="dsAccountManagementUserPrivileges" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="ohsn_Web_GetUserManagementUserPermissions_Select" SelectCommandType="StoredProcedure" >
        <SelectParameters>
            <asp:SessionParameter Name="ContactID" SessionField="WorkingContactID" Type="Int64" />
        </SelectParameters>
    </asp:SqlDataSource>

    <%--Pop-ups--%>
            <div>
           <%--Delete User--%>
           <dx:ASPxPopupControl ID="pupctlDeleteUser" runat="server" Modal="True" ShowCloseButton="false" ShowHeader="false"  PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ClientInstanceName="pupctrlUserLogin"  PopupAnimationType="None" EnableViewState="False" Width="300px" CloseAction="None" FooterText="" HeaderText="" PopupElementID="pupctlDeleteUser">
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server">
                        <asp:Table runat="server" Width="100%">
                            <asp:TableRow>
                                <asp:TableCell>
                                    <dx:ASPxImage ID="ASPxImage2" runat="server" ImageUrl="~/Images/Popups/Delete.png"></dx:ASPxImage>
                                </asp:TableCell>
                                <asp:TableCell></asp:TableCell>
                                <asp:TableCell>
                                    <asp:Table runat="server">
                                        <asp:TableRow HorizontalAlign="Center">
                                            <asp:TableCell><dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Delete User?" Font-Size="X-Large"></dx:ASPxLabel></asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell><br /></asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow HorizontalAlign="Justify">
                                            <asp:TableCell><dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Do you wish to delete the selected user?"></dx:ASPxLabel></asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell><br /></asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </asp:TableCell>
                            </asp:TableRow>
                            </asp:Table>
                        <asp:Table runat="server" Width="100%" HorizontalAlign="Center">
                                <asp:TableRow HorizontalAlign="Center" >
                                    <asp:TableCell><dx:ASPxButton ID="btnDeleteUserYes" runat="server" OnClick="btnDeleteUserYes_Click" Text="Yes" HorizontalAlign="Center">  </dx:ASPxButton></asp:TableCell>
                                    <asp:TableCell></asp:TableCell>
                                    <asp:TableCell><dx:ASPxButton ID="btnDeleteUserNo" runat="server" OnClick="btnDeleteUserNo_Click" Text="No" HorizontalAlign="Center">  </dx:ASPxButton></asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>                        
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>
           
           <%--Reset User Password--%>
           <dx:ASPxPopupControl ID="pupctrlResetPassword" runat="server" Modal="True" ShowCloseButton="false" ShowHeader="false"  PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ClientInstanceName="pupctrlUserLogin"  PopupAnimationType="None" EnableViewState="False" Width="300px" CloseAction="None" FooterText="" HeaderText="" PopupElementID="pupctrlResetPassword">
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server">
                        <asp:Table runat="server" Width="100%">
                            <asp:TableRow>
                                <asp:TableCell>
                                    <dx:ASPxImage ID="ASPxImage1" runat="server" ImageUrl="~/Images/Popups/Flag Red.png"></dx:ASPxImage>
                                </asp:TableCell>
                                <asp:TableCell></asp:TableCell>
                                <asp:TableCell>
                                    <asp:Table runat="server">
                                        <asp:TableRow HorizontalAlign="Center">
                                            <asp:TableCell><dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Reset User password" Font-Size="Large"></dx:ASPxLabel></asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell><br /></asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow HorizontalAlign="Justify">
                                            <asp:TableCell><dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Enter new password?"></dx:ASPxLabel></asp:TableCell>
                                            <asp:TableCell>
                                                <dx:ASPxTextBox ID="txtbxResetUserPassword" runat="server" Width="170px" ></dx:ASPxTextBox>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell><br /></asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </asp:TableCell>
                            </asp:TableRow>
                            </asp:Table>
                        <asp:Table runat="server" Width="100%" HorizontalAlign="Center">
                                <asp:TableRow HorizontalAlign="Center" >
                                    <asp:TableCell></asp:TableCell>
                                    <asp:TableCell><dx:ASPxButton ID="btnResetPasswordOk" runat="server" OnClick="btnResetPasswordOk_Click" Text="Yes" HorizontalAlign="Center">  </dx:ASPxButton></asp:TableCell>
                                    <asp:TableCell></asp:TableCell>
                                    <asp:TableCell><dx:ASPxButton ID="btnRestPasswordCancel" runat="server" OnClick="btnResetPasswordCancel_Click" Text="No" HorizontalAlign="Center">  </dx:ASPxButton></asp:TableCell>
                                    <asp:TableCell></asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>                        
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>
           
           <%--Deactivate User--%>
           <dx:ASPxPopupControl ID="pupctrlDeactivateUser" runat="server" Modal="True" ShowCloseButton="false" ShowHeader="false"  PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ClientInstanceName="pupctrlUserLogin"  PopupAnimationType="None" EnableViewState="False" Width="300px" CloseAction="None" FooterText="" HeaderText="" PopupElementID="pupctrlDeactivateUser">
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server">
                        <asp:Table runat="server" Width="100%">
                            <asp:TableRow>
                                <asp:TableCell>
                                    <dx:ASPxImage ID="ASPxImage3" runat="server" ImageUrl="~/Images/Popups/Flag Red.png"></dx:ASPxImage>
                                </asp:TableCell>
                                <asp:TableCell></asp:TableCell>
                                <asp:TableCell>
                                    <asp:Table runat="server">
                                        <asp:TableRow HorizontalAlign="Center">
                                            <asp:TableCell><dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Deactivate User?" Font-Size="X-Large"></dx:ASPxLabel></asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell><br /></asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow HorizontalAlign="Justify">
                                            <asp:TableCell><dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Do you wish to deactivate the selected user?"></dx:ASPxLabel></asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell><br /></asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </asp:TableCell>
                            </asp:TableRow>
                            </asp:Table>
                        <asp:Table runat="server" Width="100%" HorizontalAlign="Center">
                                <asp:TableRow HorizontalAlign="Center" >
                                    <asp:TableCell><dx:ASPxButton ID="btnDeactivateUserYes" runat="server" OnClick="btnDeactivateUserYes_Click" Text="Yes" HorizontalAlign="Center">  </dx:ASPxButton></asp:TableCell>
                                    <asp:TableCell></asp:TableCell>
                                    <asp:TableCell><dx:ASPxButton ID="btnDeactivateUserNo" runat="server" OnClick="btnDeactivateUserNo_Click" Text="No" HorizontalAlign="Center">  </dx:ASPxButton></asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>                        
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>

        </div>
</asp:Content>
