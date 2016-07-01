<%@ Page Title="" Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeBehind="ProtocolManagement.aspx.cs" Inherits="CustomerPortal.Account.ProtocolManagement" %>
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
                    <dx:RibbonGroup Text="User" Name="grpProtocol">
                        <Items>
                            <dx:RibbonButtonItem Name="btnAdd" Size="Large" Text="Add" ToolTip="Create new users.">
                                <LargeImage Url="~/Images/General/Add.png">
                                </LargeImage>
                            </dx:RibbonButtonItem>
                            <dx:RibbonButtonItem Name="btnEdit" Size="Large" Text="Edit"  ToolTip="Change an existing protocols information or privileges." Visible="False">
                                <LargeImage Url="~/Images/General/Edit.png">
                                </LargeImage>
                             </dx:RibbonButtonItem>
                            <dx:RibbonButtonItem Name="btnDeactivate" Size="Large" Text="Deactivate"  ToolTip="Change an existing protocol to inactive." Visible="False">
                                <LargeImage Url="~/Images/General/Deactivate Protocol.png">
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
         <asp:TableRow HorizontalAlign="Center"><asp:TableCell><dx:ASPxLabel ID="ASPxLabel3" runat="server" Font-Size="X-Large" Text="Protocol Management"></dx:ASPxLabel></asp:TableCell></asp:TableRow>
     </asp:Table> 
    <br />
    <br />
     <asp:Table  runat="server" ID="tblProtocols"  Width="100%"  HorizontalAlign="Center">
         <asp:TableRow ><asp:TableCell><dx:ASPxLabel ID="ASPxLabel1" runat="server" Font-Size="Large" Text="Protocols"></dx:ASPxLabel></asp:TableCell></asp:TableRow>
         <asp:TableRow><asp:TableCell></asp:TableCell></asp:TableRow>
        <%--User Grid--%>
             <asp:TableRow HorizontalAlign="Center" Width="100%">
                    <asp:TableCell>
                           <dx:ASPxGridView ID="gvAccountManagementProtocols" runat="server" AutoGenerateColumns="False" DataSourceID="dsProtocolManagement" KeyFieldName="ID"  Width="95%" EnableCallBacks="False" ClientInstanceName="gvAccountManagementProtocols"  OnSelectionChanged="gvProtocolsManagement_SelectionChanged" >
                                <Columns>

                                    <dx:GridViewCommandColumn Caption="Select" SelectAllCheckboxMode="Page" ShowSelectCheckbox="False" VisibleIndex="0" Visible="false" Width="50px">
                                    </dx:GridViewCommandColumn>
                                    <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" Visible="False" VisibleIndex="1">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="ProtocolName" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataCheckColumn FieldName="Active" VisibleIndex="3" Width="5%"  HeaderStyle-HorizontalAlign="Center" Caption="Active">
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

    <%--Data Source--%>
    <asp:SqlDataSource ID="dsProtocolManagement" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="OHSN_Web_EmployerProtocolInfoList" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="" Name="EmployerID" SessionField="WorkingEmployerID" Type="Int64" />
        </SelectParameters>
    </asp:SqlDataSource>
  </div>
</asp:Content>
