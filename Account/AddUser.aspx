<%@ Page Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="CustomerPortal.Account.AddUser" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">

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
                    <dx:RibbonGroup Text="User">
                        <Items>
                            <dx:RibbonButtonItem Name="btnNewUser" Size="Large" Text="Contact" ToolTip="Create a new contact.  A contact is required in order to have user.">
                                <LargeImage Url="~/Images/General/New Contact.png">
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
         <asp:TableRow><asp:TableCell><dx:ASPxLabel ID="ASPxLabel3" runat="server" Font-Size="X-Large" Text="Add user"></dx:ASPxLabel></asp:TableCell></asp:TableRow>
     </asp:Table> 

    <div runat="server" style="overflow:auto; max-height:600px" >
    
        <%-- User details --%>
        <asp:Table runat="server" id="MainForm" Width="100%" >
                <%-- Contact Name --%>
                <asp:TableRow Width="100%">
                    <%-- Left Margin --%>
                    <asp:TableCell  Width="10%"></asp:TableCell>
                    <%-- Left Column --%>
                     <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Select Contact:"></dx:ASPxLabel></asp:TableCell>
                    <asp:TableCell>
                            <dx:ASPxComboBox ID="cbxCompanyContacts" runat="server" Height="25px"  DataSourceID="dsCompanyContacts" TextField="LastName" ValueField="ID" ClientEnabled="true" AutoPostBack="true" OnSelectedIndexChanged="cbxCompanyContacts_SelectedIndexChanged" OnValidation="cbxCompanyContacts_Validation" ValueType="System.Int32" >
                                 <Columns>
                                     <dx:ListBoxColumn Caption="Last Name" FieldName="LastName" />
                                     <dx:ListBoxColumn Caption="First Name" FieldName="FirstName" />
                                 </Columns>
                            </dx:ASPxComboBox>                
                    </asp:TableCell>
                    <%-- Center Margin --%>
                    <asp:TableCell Width="10%"></asp:TableCell>
                    <%-- Right Column --%>
                    <asp:TableCell Width="10%"></asp:TableCell>
                    <%-- Right Margin --%>
                    <asp:TableCell Width="10%"></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
                <%-- Contact Name --%>
                <asp:TableRow>
                    <%-- Left Margin --%>
                    <asp:TableCell  Width="10%"></asp:TableCell>
                    <%-- Left Column --%>
                     <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel6" runat="server" Enabled="false" Text="First Name:"></dx:ASPxLabel></asp:TableCell>
                    <asp:TableCell><dx:ASPxTextBox ID="txtbxFirstName" runat="server"   AutoPostBack="true"  Enabled="false" ReadOnly="true"  ></dx:ASPxTextBox></asp:TableCell>
                    <%-- Center Margin --%>
                    <asp:TableCell Width="10%"></asp:TableCell>
                    <%-- Right Column --%>
                    <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel7" runat="server" Enabled="false" Text="Last Name:" ></dx:ASPxLabel></asp:TableCell>
                    <asp:TableCell><dx:ASPxTextBox ID="txtbxLastName" runat="server"  AutoPostBack="true" Enabled="false" ReadOnly="true" ></dx:ASPxTextBox></asp:TableCell>
                    <%-- Right Margin --%>
                    <asp:TableCell Width="10%"></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
                <%-- Work Phone --%>
                <asp:TableRow>
                    <%-- Left Margin --%>
                    <asp:TableCell></asp:TableCell>
                    <%-- Left Column --%>
                    <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel10" runat="server" Enabled="false" Text="Work Phone:"  ></dx:ASPxLabel></asp:TableCell>
                    <asp:TableCell><dx:ASPxTextBox ID="txtbxWorkPhone" runat="server" Enabled="false" ReadOnly="true" Width="170px"  ><MaskSettings Mask="(999) 000-0000" IncludeLiterals="None" /></dx:ASPxTextBox></asp:TableCell>
                    <%-- Center Margin --%>
                    <asp:TableCell></asp:TableCell>
                    <%-- Right Column --%>
                     <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel11" runat="server" Enabled="false" Text="Ext:"  ></dx:ASPxLabel></asp:TableCell>
                     <asp:TableCell><dx:ASPxTextBox ID="txtbxExt" runat="server" Enabled="false" ReadOnly="true" Width="170px"  ></dx:ASPxTextBox></asp:TableCell>
                    <%-- Right Margin --%>
                    <asp:TableCell></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
                <%-- Fax/Cell Phone --%>
                <asp:TableRow >
                    <%-- Left Margin --%>
                    <asp:TableCell></asp:TableCell>
                    <%-- Left Column --%>
                     <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel12" runat="server" Enabled="false" Text="Fax:" ></dx:ASPxLabel></asp:TableCell>
                     <asp:TableCell><dx:ASPxTextBox ID="txtbxFax" runat="server"  ReadOnly="true" Width="170px"  ><MaskSettings Mask="(999) 000-0000" IncludeLiterals="None" /></dx:ASPxTextBox></asp:TableCell>
                     <%-- Center Margin --%>
                    <asp:TableCell></asp:TableCell>
                     <%-- Right Column --%>
                       <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel13" runat="server" Enabled="false" Text="Cell:"  ></dx:ASPxLabel></asp:TableCell>
                        <asp:TableCell><dx:ASPxTextBox ID="txtbxCell" runat="server"  Enabled="false" ReadOnly="true" Width="170px" ><MaskSettings Mask="(999) 000-0000" IncludeLiterals="None" /></dx:ASPxTextBox></asp:TableCell>
                    <%-- Right Margin --%>                
                        <asp:TableCell></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
                <%-- Email --%>
                <asp:TableRow >
                    <%-- Left Margin --%>
                    <asp:TableCell></asp:TableCell>
                    <%-- Left Column --%>
                    <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel9" runat="server" Enabled="false" Text="Email:"></dx:ASPxLabel></asp:TableCell>
                    <asp:TableCell><dx:ASPxTextBox ID="txtbxEmail" runat="server" Enabled="false" ReadOnly="true" Width="170px" ></dx:ASPxTextBox></asp:TableCell>
                     <%-- Center Margin --%>
                    <asp:TableCell></asp:TableCell>
                     <%-- Right Column --%>
                     <asp:TableCell></asp:TableCell>
                     <asp:TableCell></asp:TableCell>
                     <%-- Right Margin --%>           
                     <asp:TableCell></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
                <%-- Job --%>
                <asp:TableRow >
                    <%-- Left Margin --%>
                    <asp:TableCell></asp:TableCell>
                    <%-- Left Column --%>
                    <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel16" runat="server" Enabled="false" Text="Job Category:"></dx:ASPxLabel></asp:TableCell>
                    <asp:TableCell><dx:ASPxComboBox ID="cbxJobCategory" runat="server" Enabled="false" ReadOnly="true" ValueType="System.String" DataSourceID="dsJobCategory" TextField="Name" ValueField="ID" ></dx:ASPxComboBox></asp:TableCell>
                     <%-- Center Margin --%>
                     <asp:TableCell></asp:TableCell>
                     <%-- Right Column --%>
                     <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel17" runat="server" Enabled="false"  Text="Job Title:"></dx:ASPxLabel></asp:TableCell>
                     <asp:TableCell><dx:ASPxTextBox ID="txtbxJobTitle" runat="server" Enabled="false" ReadOnly="true" Width="170px" ></dx:ASPxTextBox></asp:TableCell>
                    <%-- Right Margin --%>                
                    <asp:TableCell></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
                <%-- User Info --%>
                <asp:TableRow >
                    <%-- Left Margin --%>
                    <asp:TableCell></asp:TableCell>
                    <%-- Left Column --%>
                    <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="User Name:"></dx:ASPxLabel></asp:TableCell>
                    <asp:TableCell><dx:ASPxTextBox ID="txtBxUserName" runat="server" Width="170px" AutoPostBack="true" OnValidation="txtBxUserName_Validation" ></dx:ASPxTextBox></asp:TableCell>
                     <%-- Center Margin --%>
                     <asp:TableCell></asp:TableCell>
                     <%-- Right Column --%>
                       <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="User level:"></dx:ASPxLabel></asp:TableCell>
                        <asp:TableCell><dx:ASPxComboBox ID="cbxUserLevel" runat="server" DataSourceID="dsUserLevel"   TextField="Name" ValueField="ID"  ValueType="System.Int32" OnValidation="cbxUserLevel_Validation" ></dx:ASPxComboBox></asp:TableCell>
                    <%-- Right Margin --%>
                        <asp:TableCell></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
                <%-- Active --%>
                <asp:TableRow >
                    <%-- Left Margin --%>
                    <asp:TableCell></asp:TableCell>
                    <%-- Left Column --%>
                    <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel14" runat="server" Text="Temporary User Password:"></dx:ASPxLabel></asp:TableCell>
                    <asp:TableCell><dx:ASPxTextBox ID="txtBxUserPassword" runat="server" Width="170px" AutoPostBack="true" OnValidation="txtBxUserPassword_Validation" ></dx:ASPxTextBox></asp:TableCell>
                     <%-- Center Margin --%>
                     <asp:TableCell></asp:TableCell>
                     <%-- Right Column --%>
                    <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="User Active:"></dx:ASPxLabel></asp:TableCell>
                    <asp:TableCell><dx:ASPxCheckBox ID="chkActive" runat="server" Checked="True" CheckState="Checked" ValueChecked="True" ValueUnchecked="False"></dx:ASPxCheckBox></asp:TableCell>            
                    <%-- Right Margin --%>
                        <asp:TableCell></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
            </asp:Table>
        <br />

        <%-- Authorized Protocols --%>
        <asp:Table runat="server" id="Table3" Width="100%" >
                 <asp:TableRow ><asp:TableCell></asp:TableCell><asp:TableCell><dx:ASPxLabel ID="ASPxLabel24" runat="server" Font-Size="Large" Text="Authorized Protocols"> </dx:ASPxLabel></asp:TableCell></asp:TableRow>
                 <asp:TableRow><asp:TableCell></asp:TableCell></asp:TableRow>
                <%-- Authorized Protocols --%>
                <asp:TableRow >
                    <asp:TableCell  Width="10%"></asp:TableCell>
                    <asp:TableCell>
                                <dx:ASPxGridView ID="gvAuthorizedProtocols" runat="server" DataSourceID="dsProtocols" AutoGenerateColumns="False" KeyFieldName="ID" Width="50%" ClientInstanceName="gvAuthorizedProtocols" ToolTip="Selected protocols are authorized for this user." >
                                <Columns>
                                    <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0">
                                    </dx:GridViewCommandColumn>
                                    <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="1" Visible="False">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="2" Width="60%" Caption="Protocol" ToolTip="Select Protocols are authorized for this user." ReadOnly="True">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="ContactID" VisibleIndex="3" ReadOnly="true" Visible="False">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataComboBoxColumn FieldName="ReportMethodTID" Caption="Reporting Method" VisibleIndex="4">
                                        <PropertiesComboBox DataSourceID="dsDeliveryMethod" TextField="DeliveryName" ValueField="DeliveryID" ValueType="System.Int32">
                                        </PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                </Columns>
                                <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
                            </dx:ASPxGridView> 
                    </asp:TableCell>
                    <asp:TableCell  Width="10%"></asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        <br />
        
    </div>

    <%-- DataSource --%>
    <asp:SqlDataSource ID="dsCompanyContacts" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="OHSN_Web_AddUser_GetCompanyContactsList" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="EmployerID" SessionField="WorkingEmployerID" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dsContactInfo" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="OHSN_Web_AddUser_GetCompanyContactInfo" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="ContactID" SessionField="WorkingContactID" Type="Int64" />
        </SelectParameters>
    </asp:SqlDataSource>

     <asp:SqlDataSource ID="dsProtocols" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="OHSN_Web_AddUser_GetEmployerProtocolsForaContactWithReportMethod" UpdateCommand="ohsn_Web_EmployerProtocolsReporting_Upsert" SelectCommandType="StoredProcedure" UpdateCommandType="StoredProcedure" OnUpdating="dsProtocols_Updating">
            <SelectParameters>
                <asp:SessionParameter Name="EmployerID" SessionField="WorkingEmployerID" DbType="Int64" />
                <asp:SessionParameter Name="ContactID" SessionField="WorkingContactID" DbType="Int64" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="ID"   DbType="Int64" />
                <asp:Parameter Name="ContactID" DbType="Int64" />
                <asp:Parameter Name="ReportMethodTID"  DbType="Int64" />
            </UpdateParameters>
        </asp:SqlDataSource>

     <asp:SqlDataSource ID="dsJobCategory" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="ohsn_Web_GetJobCategorList"></asp:SqlDataSource>

    <asp:SqlDataSource ID="dsUserLevel" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="OHSN_Web_GetUserLevelList"></asp:SqlDataSource>

    <asp:SqlDataSource ID="dsDeliveryMethod" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="OHSN_Web_GetDeliveryMethodList" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

</asp:Content>
