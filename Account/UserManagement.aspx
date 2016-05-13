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
                    <dx:RibbonGroup Text="User" Name="grpUser">
                        <Items>
                            <dx:RibbonButtonItem Name="btnAdd" Size="Large" Text="Add" ToolTip="Create new users.">
                                <LargeImage Url="~/Images/General/Add.png">
                                </LargeImage>
                            </dx:RibbonButtonItem>
                            <dx:RibbonButtonItem Name="btnEdit" Size="Large" Text="Edit"  ToolTip="Change an existing users information or privileges." Visible="False">
                                <LargeImage Url="~/Images/General/Edit.png">
                                </LargeImage>
                            </dx:RibbonButtonItem>
                            <dx:RibbonButtonItem Name="btnDelete" Size="Large" Text="Delete"  ToolTip="Remove an existing user." Visible="False">
                                <LargeImage Url="~/Images/General/Delete.png">
                                </LargeImage>
                            </dx:RibbonButtonItem>
                        </Items>
                    </dx:RibbonGroup>
                    <dx:RibbonGroup Name="grpManage" Text="Edit User" Visible="False">
                        <Items>
                            <dx:RibbonButtonItem Name="btnResetPassword" Size="Large" Text="Reset" ToolTip="Sets the user password to a temporary specifed password and forces the user to create a new password upon their next log in.  ">
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
         <asp:TableRow HorizontalAlign="Center"><asp:TableCell><dx:ASPxLabel ID="ASPxLabel3" runat="server" Font-Size="X-Large" Text="User Management"></dx:ASPxLabel></asp:TableCell></asp:TableRow>
     </asp:Table> 
    <br />
    <br />
     <asp:Table  runat="server" ID="tblUsers"  Width="100%"  HorizontalAlign="Center">
         <asp:TableRow ><asp:TableCell><dx:ASPxLabel ID="ASPxLabel1" runat="server" Font-Size="Large" Text="Users"></dx:ASPxLabel></asp:TableCell></asp:TableRow>
         <asp:TableRow><asp:TableCell></asp:TableCell></asp:TableRow>
        <%--User Grid--%>
             <asp:TableRow HorizontalAlign="Center" Width="100%">
                    <asp:TableCell>
                        <dx:ASPxGridView ID="gvAccountManagementUsers" runat="server" AutoGenerateColumns="False" DataSourceID="dsUserManagementUsers" KeyFieldName="ContactID"  Width="95%" EnableCallBacks="False" OnSelectionChanged="gvAccountManagementUsers_SelectionChanged" ClientInstanceName="gvAccountManagementUsers">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="ContactID" ReadOnly="True" VisibleIndex="7" Visible="False">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="EmployerID" VisibleIndex="8" Visible="False">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="LastName" ReadOnly="True" VisibleIndex="0" Width="20%"  HeaderStyle-HorizontalAlign="Center">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="FirstName" ReadOnly="True" VisibleIndex="1" Width="20%"  HeaderStyle-HorizontalAlign="Center">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Email Type" VisibleIndex="9" Visible="False">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Email" ReadOnly="True" VisibleIndex="2" Width="20%"  HeaderStyle-HorizontalAlign="Center">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="UserName" ReadOnly="True" VisibleIndex="3" Width="20%"  HeaderStyle-HorizontalAlign="Center" Caption="User">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="UserLevel" VisibleIndex="4" Width="10%"  HeaderStyle-HorizontalAlign="Center" Caption="Type">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataDateColumn FieldName="LastLoginDate" VisibleIndex="5" Width="5%"  HeaderStyle-HorizontalAlign="Center" Caption="Last Login">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    </dx:GridViewDataDateColumn>
                                    <dx:GridViewDataCheckColumn FieldName="Active" VisibleIndex="6" Width="5%"  HeaderStyle-HorizontalAlign="Center" Caption="Active">
                                        <PropertiesCheckEdit ValueChecked="True" ValueUnchecked="False">
                                        </PropertiesCheckEdit>
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    </dx:GridViewDataCheckColumn>
                                </Columns>
                                    <SettingsBehavior AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" ProcessFocusedRowChangedOnServer="True" ProcessSelectionChangedOnServer="True" SelectionStoringMode="PerformanceOptimized" />
                                    <Settings ShowFilterRow="True" />
                                    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                            </dx:ASPxGridView>
                    </asp:TableCell>
         </asp:TableRow>
         <asp:TableRow><asp:TableCell></asp:TableCell></asp:TableRow>
     </asp:Table>  
    <br />
                            
    <br />
        <%-- Privileges --%>
        <asp:Table runat="server" id="Table2" Width="100%" >
         <asp:TableRow ><asp:TableCell></asp:TableCell><asp:TableCell><dx:ASPxLabel ID="ASPxLabel24" runat="server" Font-Size="Large" Text="Privileges"> </dx:ASPxLabel></asp:TableCell></asp:TableRow>
         <asp:TableRow><asp:TableCell></asp:TableCell></asp:TableRow>
        <%-- Privileges --%>
        <asp:TableRow >
            <asp:TableCell  Width="10%"></asp:TableCell>
            <asp:TableCell>
                            <dx:ASPxGridView ID="gvPrivileges" runat="server" AutoGenerateColumns="False" DataSourceID="dsPrivileges" Width="80%" >
                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="ParentID" Visible="False" VisibleIndex="1">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="PageID" Visible="False" VisibleIndex="2">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Page" ReadOnly="True" VisibleIndex="3" Width="50%" HeaderStyle-HorizontalAlign="Center">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataCheckColumn Caption="All Access" FieldName="AllowAccess" ToolTip="Users with this privilege can open this page." VisibleIndex="4" Width="10%" ReadOnly="True"  HeaderStyle-HorizontalAlign="Center">
                                    <PropertiesCheckEdit DisplayTextGrayed="N/A" DisplayTextUndefined="N/A" NullDisplayText="N/A">
                                    </PropertiesCheckEdit>
                                </dx:GridViewDataCheckColumn>
                                <dx:GridViewDataCheckColumn Caption="Allow Add/Edit" FieldName="AllowAddorEdit" ToolTip="Users with this privilege can create or modify records displayed on this page." VisibleIndex="5" Width="10%" ReadOnly="True" HeaderStyle-HorizontalAlign="Center">
                                    <PropertiesCheckEdit AllowGrayed="True" NullDisplayText="N/A" ValueChecked="1" ValueType="System.Int32" ValueUnchecked="0">
                                    </PropertiesCheckEdit>
                                </dx:GridViewDataCheckColumn>
                                <dx:GridViewDataCheckColumn Caption="Allow Delete" FieldName="AllowDelete" ToolTip="Users with this privilege can delete the record displayed on this page." VisibleIndex="6" Width="10%" ReadOnly="True" HeaderStyle-HorizontalAlign="Center">
                                    <PropertiesCheckEdit NullDisplayText="N/A" ValueChecked="1" ValueType="System.Int32" ValueUnchecked="0">
                                    </PropertiesCheckEdit>
                                </dx:GridViewDataCheckColumn>
                            </Columns>
                            <SettingsEditing Mode="PopupEditForm">
                            </SettingsEditing>
                                <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                        </dx:ASPxGridView> 
            </asp:TableCell>
            <asp:TableCell  Width="10%"></asp:TableCell>
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
 
    <asp:SqlDataSource ID="dsPrivileges" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="ohsn_Web_GetUserManagementUserPermissions_Select" SelectCommandType="StoredProcedure" >
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
                                    <asp:TableCell></asp:TableCell>
                                    <asp:TableCell></asp:TableCell>
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
                                            <asp:TableCell><dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Reset User password?" Font-Size="X-Large"></dx:ASPxLabel></asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell><br /></asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow HorizontalAlign="Justify">
                                            <asp:TableCell><dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Enter new password"></dx:ASPxLabel></asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow HorizontalAlign="Justify">
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
                                    <asp:TableCell></asp:TableCell>
                                    <asp:TableCell></asp:TableCell>
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
