<%@ Page Title="" Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeBehind="AddProtocols.aspx.cs" Inherits="CustomerPortal.Account.AddProtocols" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server" >
    
        <script type="text/javascript">
        function SelectedIndexChanged(s, e) {
            gvServices.PerformCallback(s.GetValue());
        }
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
                    <dx:RibbonGroup Text="Back">
                        <Items>
                            <dx:RibbonButtonItem Name="btnBack" Size="Large" Text="Back" ToolTip="Return to the previous page with saving any changes.">
                                <LargeImage Url="~/Images/Reports/Back.png">
                                </LargeImage>
                            </dx:RibbonButtonItem>
                        </Items>
                    </dx:RibbonGroup>
                    <dx:RibbonGroup Text="Save">
                        <Items>
                            <dx:RibbonButtonItem Name="btnSubmit" Size="Large" Text="Submit" ToolTip="Save any changes and return to the previous page.">
                                <LargeImage Url="~/Images/General/Submit.png">
                                </LargeImage>
                            </dx:RibbonButtonItem>
                            <dx:RibbonButtonItem Name="btnCancel" Size="Large" Text="Cancel" ToolTip="Return to the previous page without saving any changes.">
                                <LargeImage Url="~/Images/General/Cancel.png">
                                </LargeImage>
                            </dx:RibbonButtonItem>
                        </Items>
                    </dx:RibbonGroup>
                    <dx:RibbonGroup Text="Services">
                        <Items>
                            <dx:RibbonButtonItem Name="btnShowSelected" Size="Large" Text="Show Selected" ToolTip="Filters the services grid to only show the selected services.">
                                <LargeImage Url="~/Images/General/ShowChecked.png">
                                </LargeImage>
                            </dx:RibbonButtonItem>
                        </Items>
                    </dx:RibbonGroup>
                </Groups>
            </dx:RibbonTab>
        </Tabs>
    </dx:ASPxRibbon>

    <%-- Form Title --%>
     <asp:Table  runat="server" ID="Table1"  HorizontalAlign="Center">
         <asp:TableRow><asp:TableCell><dx:ASPxLabel ID="ASPxLabel3" runat="server" Font-Size="X-Large" Text="Add Protocol"></dx:ASPxLabel></asp:TableCell></asp:TableRow>
     </asp:Table> 
    <br />
    
    <div runat="server" style="overflow:auto; max-height:600px" >

            <%-- Protocol --%>
            <asp:Table runat="server" id="MainForm" Width="100%" >
                <%-- Protocol Name --%>
                <asp:TableRow>
                    <%-- Left Margin --%>
                    <asp:TableCell Width="10%"></asp:TableCell>
                    <%-- Left Column --%>
                    <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Name:"  ></dx:ASPxLabel></asp:TableCell>
                    <asp:TableCell Width="50%"><dx:ASPxComboBox ID="cbxProtocolName" runat="server" ValueType="System.Int32" DataSourceID="dsProtocols" TextField="ProtocolName" ValueField="ID" Width="70%" OnValidation="cbxProtocolName_Validation"><ClientSideEvents SelectedIndexChanged="SelectedIndexChanged"  /></dx:ASPxComboBox></asp:TableCell>
                     <%-- Center Margin --%>
                    <asp:TableCell Width="10%"></asp:TableCell>
                    <%-- Right Column --%>
                    <asp:TableCell Width="10%"></asp:TableCell>
                    <%-- Right Margin --%>
                    <asp:TableCell Width="10%"></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
                <%-- Protocol Name --%>
                <asp:TableRow>
                    <%-- Left Margin --%>
                    <asp:TableCell Width="10%"></asp:TableCell>
                    <%-- Left Column --%>
                    <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel2" runat="server" Text=""  ></dx:ASPxLabel></asp:TableCell>
                    <asp:TableCell><dx:ASPxCheckBox ID="ckReportToMIS" runat="server" Text="Report to M.I.S."></dx:ASPxCheckBox></asp:TableCell>
                     <%-- Center Margin --%>
                    <asp:TableCell Width="10%"></asp:TableCell>
                    <%-- Right Column --%>
                    <asp:TableCell Width="10%"></asp:TableCell>
                    <%-- Right Margin --%>
                    <asp:TableCell Width="10%"></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
            </asp:Table>
            <br />

            <%-- Services --%>
            <asp:Table runat="server" id="Table3" Width="100%" >
                 <asp:TableRow ><asp:TableCell></asp:TableCell><asp:TableCell><dx:ASPxLabel ID="ASPxLabel24" runat="server" Font-Size="Large" Text="Services"> </dx:ASPxLabel></asp:TableCell></asp:TableRow>
                 <asp:TableRow><asp:TableCell></asp:TableCell></asp:TableRow>
                <%-- Services --%>
                <asp:TableRow >
                    <asp:TableCell  Width="10%"></asp:TableCell>
                    <asp:TableCell>
                            <dx:ASPxGridView ID="gvServices" runat="server" DataSourceID="dsServices" AutoGenerateColumns="False" KeyFieldName="ID" Width="50%"  ClientInstanceName="gvServices" ToolTip="Selected protocols are authorized for this user." OnCustomCallback="gvServices_CustomCallback" >
                                <Columns>
                                    <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowSelectCheckbox="True" VisibleIndex="0" Width="50px" ShowClearFilterButton="True" ShowApplyFilterButton="True">
                                    </dx:GridViewCommandColumn>
                                    <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" Visible="False" VisibleIndex="1" Width="50px">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Name" Caption="Service" VisibleIndex="2" Width="500px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataCheckColumn FieldName="DoesNotNeedProcessing" Visible="False" VisibleIndex="3">
                                    </dx:GridViewDataCheckColumn>
                                    <dx:GridViewDataCheckColumn FieldName="Active" Visible="False" VisibleIndex="4">
                                    </dx:GridViewDataCheckColumn>
                                </Columns>
                                <Settings ShowFilterRow="True" />
                                <SettingsDataSecurity AllowDelete="False" AllowInsert="False" AllowEdit="False" />
                            </dx:ASPxGridView>                 
                    </asp:TableCell>
                    <asp:TableCell  Width="10%"></asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <br />

             <%-- Job Classification Restriction --%>
             <asp:Table runat="server" id="Table2" Width="100%" >
             <asp:TableRow ><asp:TableCell></asp:TableCell><asp:TableCell><dx:ASPxLabel ID="ASPxLabel1" runat="server" Font-Size="Large" Text="Job Classification Restriction"> </dx:ASPxLabel></asp:TableCell></asp:TableRow>
              <asp:TableRow><asp:TableCell></asp:TableCell></asp:TableRow>
              <%-- Job Classification Restriction --%>
                <asp:TableRow >
                    <asp:TableCell  Width="10%"></asp:TableCell>
                    <asp:TableCell>
                            <dx:ASPxGridView ID="gvJobClassificationRestriction" runat="server" DataSourceID="dsJobTitleClassifications" AutoGenerateColumns="False" KeyFieldName="ID" Width="50%" ClientInstanceName="gvJobClassificationRestriction" ToolTip="Selected Job Classifications to which this protocol is restricted." >
                                <Columns>
                                    <dx:GridViewCommandColumn Caption="Select" SelectAllCheckboxMode="Page" ShowSelectCheckbox="True" VisibleIndex="0" Width="50px" ShowClearFilterButton="True">
                                    </dx:GridViewCommandColumn>
                                    <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="1" Visible="False">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="NAME" VisibleIndex="2" Caption="Job Classification">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <Settings ShowFilterRow="True" />
                                <SettingsDataSecurity AllowDelete="False" AllowInsert="False" AllowEdit="False" />
                            </dx:ASPxGridView>                 
                    </asp:TableCell>
                    <asp:TableCell  Width="10%"></asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <br />


    <%-- DataSource --%>

    <asp:SqlDataSource ID="dsProtocols" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="OHSN_Web_ProtocolInfoList"></asp:SqlDataSource>

    <asp:SqlDataSource ID="dsServices" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="OHSN_Web_Account_GetServices" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

    <asp:SqlDataSource ID="dsJobTitleClassifications" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="OHSN_Web_GetJobTitleClassificationList" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

    </div>
</asp:Content>
