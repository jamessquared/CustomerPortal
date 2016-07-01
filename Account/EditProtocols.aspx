<%@ Page Title="" Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeBehind="EditProtocols.aspx.cs" Inherits="CustomerPortal.Account.EditProtocols" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <script type="text/javascript">

    </script>

    <%-- Protocol Name --%>
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

    <%-- Left Margin --%>
     <asp:Table  runat="server" ID="Table1"  HorizontalAlign="Center">
         <asp:TableRow><asp:TableCell><dx:ASPxLabel ID="ASPxLabel3" runat="server" Font-Size="X-Large" Text="Edit Protocol"></dx:ASPxLabel></asp:TableCell></asp:TableRow>
     </asp:Table> 
    <br />

    <div runat="server" style="overflow:auto; max-height:600px" >
            <%-- Left Column --%>
            <asp:Table runat="server" id="MainForm" Width="100%" >
                <%-- Protocol Name --%>
                <asp:TableRow>
                    <%-- Left Margin --%>
                    <asp:TableCell Width="10%"></asp:TableCell>
                    <%-- Left Column --%>
                    <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Name:"   ></dx:ASPxLabel></asp:TableCell>
                    <asp:TableCell Width="60%"><dx:ASPxTextBox ID="txtProtocolName" runat="server"  Width="30%" Enabled="false"> </dx:ASPxTextBox></asp:TableCell>
                     <%-- Center Margin --%>
                    <asp:TableCell Width="10%"></asp:TableCell>
                    <%-- Right Column --%>
                    <asp:TableCell Width="10%"></asp:TableCell>
                    <%-- Right Margin --%>
                    <asp:TableCell Width="10%"></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
                <%-- Active --%>
                <asp:TableRow>
                    <%-- Left Margin --%>
                    <asp:TableCell Width="10%"></asp:TableCell>
                    <%-- Left Column --%>
                    <asp:TableCell HorizontalAlign="Right"> <dx:ASPxCheckBox runat="server" ID="ckActive" CheckState="Unchecked" Text="Active"  TextAlign="Left"></dx:ASPxCheckBox></asp:TableCell>
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
       
            <%-- Center Margin --%>
            <asp:Table runat="server" id="Table3" Width="100%" >
                 <asp:TableRow ><asp:TableCell></asp:TableCell><asp:TableCell><dx:ASPxLabel ID="ASPxLabel24" runat="server" Font-Size="Large" Text="Services"> </dx:ASPxLabel></asp:TableCell></asp:TableRow>
                 <asp:TableRow><asp:TableCell></asp:TableCell></asp:TableRow>
                <%-- Services --%>
                <asp:TableRow >
                    <asp:TableCell  Width="10%"></asp:TableCell>
                    <asp:TableCell>
                            <dx:ASPxGridView ID="gvServices" runat="server" DataSourceID="dsServices" AutoGenerateColumns="False" KeyFieldName="ID" Width="50%"  ClientInstanceName="gvServices" ToolTip="Selected protocols are authorized for this user."  >
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

             <%-- Right Column --%>
             <asp:Table runat="server" id="Table2" Width="100%" >
             <asp:TableRow ><asp:TableCell></asp:TableCell><asp:TableCell><dx:ASPxLabel ID="ASPxLabel1" runat="server" Font-Size="Large" Text="Job Classification Restriction"> </dx:ASPxLabel></asp:TableCell></asp:TableRow>
              <asp:TableRow><asp:TableCell></asp:TableCell></asp:TableRow>
              <%-- Job Classification Restriction --%>
                <asp:TableRow >
                    <asp:TableCell  Width="10%"></asp:TableCell>
                    <asp:TableCell>
                            <dx:ASPxGridView ID="gvJobClassificationRestriction" runat="server" DataSourceID="dsJobTitleClassifications" AutoGenerateColumns="False" KeyFieldName="NAME" Width="50%" ToolTip="Selected Job Classifications to which this protocol is restricted." >
                                <Columns>
                                    <dx:GridViewCommandColumn Caption="Select" SelectAllCheckboxMode="AllPages" ShowSelectCheckbox="True" VisibleIndex="0" Width="50px" ShowClearFilterButton="True">
                                    </dx:GridViewCommandColumn>
                                    <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="1" Visible="False" Name="ID">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="NAME" VisibleIndex="2" Caption="Job Classification" ReadOnly="true" Name="Name">
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

            <%-- Right Margin --%>
            <asp:Table runat="server" id="Table5" Width="100%" >
                 <asp:TableRow ><asp:TableCell></asp:TableCell><asp:TableCell><dx:ASPxLabel ID="ASPxLabel4" runat="server" Font-Size="Large" Text="Authorized Users"> </dx:ASPxLabel></asp:TableCell></asp:TableRow>
                 <asp:TableRow><asp:TableCell></asp:TableCell></asp:TableRow>
                <%-- Authorized Users --%>
                <asp:TableRow >
                    <asp:TableCell  Width="10%"></asp:TableCell>
                    <asp:TableCell>
                            <dx:ASPxGridView ID="gvAuthorizedUsers" runat="server" DataSourceID="dsAuthorizedUsers" AutoGenerateColumns="False" KeyFieldName="ID" Width="48%" ClientInstanceName="gvAuthorizedProtocols" ToolTip="Selected protocols are authorized for this user." >
                                <Columns>
                                    <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0" Width="10%">
                                    </dx:GridViewCommandColumn>
                                    <dx:GridViewDataTextColumn FieldName="ContactID" Name="ContactID" ReadOnly="True" Visible="False" VisibleIndex="6">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Name" FieldName="ContactName" Name="txtName" ReadOnly="True" VisibleIndex="7" Width="70%">
                                        <EditFormSettings Caption="Name" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataComboBoxColumn Caption="Reporting Method" FieldName="ReportMethodTID" Name="cbxReportingMethod" VisibleIndex="8" Width="20%">
                                        <PropertiesComboBox DataSourceID="dsDeliveryMethod" TextField="DeliveryName" ValueField="DeliveryID">
                                        </PropertiesComboBox>
                                        <EditFormSettings Caption="Reporting Method" />
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataTextColumn FieldName="ProtocolID" Visible="False" VisibleIndex="5" ReadOnly="True">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
                        </dx:ASPxGridView>
                    </asp:TableCell>
                    <asp:TableCell  Width="10%"></asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <br /> 

    <%-- Active --%>

    <asp:SqlDataSource ID="dsServices" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="OHSN_Web_Account_GetServices" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

    <asp:SqlDataSource ID="dsJobTitleClassifications" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="OHSN_Web_GetJobTitleClassificationList" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

    <asp:SqlDataSource ID="dsAuthorizedUsers" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="OSHN_Web_GetProtocol_AuthorizedUsers" SelectCommandType="StoredProcedure" UpdateCommand="ohsn_web_UpsertEmployerProtocolsAuthorizedUsers" UpdateCommandType="StoredProcedure" >
        <SelectParameters>
            <asp:SessionParameter Name="EmployerID" SessionField="WorkingEmployerID" />
            <asp:SessionParameter Name="ProtocolID" SessionField="WorkingProtocolID" Type="Int64" />
        </SelectParameters>
        <UpdateParameters>
                <asp:Parameter Name="ProtocolID"   DbType="Int64" />
                <asp:Parameter Name="ContactID"   DbType="Int64" />
                <asp:Parameter Name="ReportMethodTID"  DbType="Int64" />
                <asp:Parameter Name="ID"  DbType="Int64" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dsDeliveryMethod" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="OHSN_Web_GetDeliveryMethodList" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

    </div>
</asp:Content>
