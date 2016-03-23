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
    <%-- Form Title --%>
     <asp:Table  runat="server" ID="Table1"  HorizontalAlign="Center">
         <asp:TableRow><asp:TableCell><dx:ASPxLabel ID="ASPxLabel3" runat="server" Font-Size="X-Large" Text="Add user"></dx:ASPxLabel></asp:TableCell></asp:TableRow>
     </asp:Table> 

    <%-- Select Contact --%>
    <asp:Table runat="server" id="MainForm" Width="100%" >

        <%-- Select --%>
        <asp:TableRow>
            <%-- Left Margin --%>
            <asp:TableCell  Width="10%"></asp:TableCell>
            <%-- Left Column --%>
             <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Select:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell>
                <dx:ASPxComboBox ID="cbxCompanyContacts" runat="server" Height="25px" Width="75%" DataSourceID="dsCompanyContacts" TextField="Name" ValueField="ID" ClientEnabled="true" AutoPostBack="true" OnSelectedIndexChanged="cbxCompanyContacts_SelectedIndexChanged" OnButtonClick="cbxCompanyContacts_ButtonClick" >
                       <Buttons>
                            <dx:EditButton>
                                 <Image Url="~/Images/General/New User.png">
                                 </Image>
                            </dx:EditButton>
                       </Buttons>
                  </dx:ASPxComboBox>
            </asp:TableCell>
            <%-- Center Margin --%>
            <asp:TableCell Width="10%"></asp:TableCell>
            <%-- Right Column --%>
            <asp:TableCell HorizontalAlign="Right"></asp:TableCell>
            <asp:TableCell></asp:TableCell>
            <%-- Right Margin --%>
            <asp:TableCell Width="10%"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
        <%-- Contact Name --%>
        <asp:TableRow>
            <%-- Left Margin --%>
            <asp:TableCell  Width="10%"></asp:TableCell>
            <%-- Left Column --%>
             <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="First Name:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxTextBox ID="txtbxFirstName" runat="server"   AutoPostBack="true"   ></dx:ASPxTextBox></asp:TableCell>
            <%-- Center Margin --%>
            <asp:TableCell Width="10%"></asp:TableCell>
            <%-- Right Column --%>
            <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Last Name:" ></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxTextBox ID="txtbxLastName" runat="server"  AutoPostBack="true" ></dx:ASPxTextBox></asp:TableCell>
            <%-- Right Margin --%>
            <asp:TableCell Width="10%"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
        <%-- Work Phone --%>
        <asp:TableRow>
            <%-- Left Margin --%>
            <asp:TableCell></asp:TableCell>
            <%-- Left Column --%>
            <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Work Phone:"  ></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxTextBox ID="txtbxWorkPhone" runat="server" Width="170px"  ><MaskSettings Mask="(999) 000-0000" IncludeLiterals="None" /></dx:ASPxTextBox></asp:TableCell>
            <%-- Center Margin --%>
            <asp:TableCell></asp:TableCell>
            <%-- Right Column --%>
             <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="Ext:"  ></dx:ASPxLabel></asp:TableCell>
             <asp:TableCell><dx:ASPxTextBox ID="txtbxExt" runat="server" Width="170px"  ></dx:ASPxTextBox></asp:TableCell>
            <%-- Right Margin --%>
            <asp:TableCell></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
        <%-- Fax/Cell Phone --%>
        <asp:TableRow >
            <%-- Left Margin --%>
            <asp:TableCell></asp:TableCell>
            <%-- Left Column --%>
             <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel12" runat="server" Text="Fax:" ></dx:ASPxLabel></asp:TableCell>
             <asp:TableCell><dx:ASPxTextBox ID="txtbxFax" runat="server" Width="170px"  ><MaskSettings Mask="(999) 000-0000" IncludeLiterals="None" /></dx:ASPxTextBox></asp:TableCell>
             <%-- Center Margin --%>
            <asp:TableCell></asp:TableCell>
             <%-- Right Column --%>
               <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel13" runat="server" Text="Cell:"  ></dx:ASPxLabel></asp:TableCell>
                <asp:TableCell><dx:ASPxTextBox ID="txtbxCell" runat="server" Width="170px" ><MaskSettings Mask="(999) 000-0000" IncludeLiterals="None" /></dx:ASPxTextBox></asp:TableCell>
            <%-- Right Margin --%>                
                <asp:TableCell></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
        <%-- Email --%>
        <asp:TableRow >
            <%-- Left Margin --%>
            <asp:TableCell></asp:TableCell>
            <%-- Left Column --%>
            <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Email:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxTextBox ID="txtbxEmail" runat="server" Width="170px" ></dx:ASPxTextBox></asp:TableCell>
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
            <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel16" runat="server" Text="Job Category:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxComboBox ID="cbxJobCategory" runat="server" ValueType="System.String" DataSourceID="dsJobCategory" TextField="Name" ValueField="ID" ></dx:ASPxComboBox></asp:TableCell>
             <%-- Center Margin --%>
             <asp:TableCell></asp:TableCell>
             <%-- Right Column --%>
             <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel17" runat="server" Text="Job Title:"></dx:ASPxLabel></asp:TableCell>
             <asp:TableCell><dx:ASPxTextBox ID="txtbxJobTitle" runat="server" Width="170px" ></dx:ASPxTextBox></asp:TableCell>
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
            <asp:TableCell><dx:ASPxTextBox ID="txtBxUserName" runat="server" Width="170px"></dx:ASPxTextBox></asp:TableCell>
             <%-- Center Margin --%>
             <asp:TableCell></asp:TableCell>
             <%-- Right Column --%>
               <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="User level:"></dx:ASPxLabel></asp:TableCell>
                <asp:TableCell><dx:ASPxComboBox ID="cbxUserLevel" runat="server" DataSourceID="dsUserLevel"   TextField="Name" ValueField="ID"></dx:ASPxComboBox></asp:TableCell>
            <%-- Right Margin --%>
                <asp:TableCell></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
        <%-- Active --%>
        <asp:TableRow >
            <%-- Left Margin --%>
            <asp:TableCell></asp:TableCell>
            <%-- Left Column --%>
            <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Active:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxCheckBox ID="chkActive" runat="server"></dx:ASPxCheckBox></asp:TableCell>
             <%-- Center Margin --%>
             <asp:TableCell></asp:TableCell>
             <%-- Right Column --%>
               <asp:TableCell></asp:TableCell>
                <asp:TableCell></asp:TableCell>
            <%-- Right Margin --%>
                <asp:TableCell></asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <br />
    <br />


    <asp:Table runat="server" id="Table3" Width="100%"  >
         <asp:TableRow ><asp:TableCell><dx:ASPxLabel ID="ASPxLabel18" runat="server" Font-Size="Large" Text="Authorized Protocols"></dx:ASPxLabel></asp:TableCell></asp:TableRow>
         <asp:TableRow><asp:TableCell></asp:TableCell></asp:TableRow>
        <%--User Grid--%>
        <asp:TableRow >
            <asp:TableCell>
                        <dx:ASPxGridView ID="gvContactProtocols" runat="server" DataSourceID="dsProtocols" AutoGenerateColumns="False" KeyFieldName="ID" Width="50%" >
                        <Columns>
                            <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowEditButton="True" ShowSelectCheckbox="True" VisibleIndex="0">
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="1" Visible="False">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="3" Width="50%">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="ContactID" VisibleIndex="2" Visible="False">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataComboBoxColumn FieldName="ReportMethodTID" Name="cbxReportMethodTID" VisibleIndex="4" Width="30%">
                                <PropertiesComboBox DataSourceID="dsDeliveryMethod" TextField="Name" ValueField="ID">
                                    <Columns>
                                        <dx:ListBoxColumn Caption="Name" FieldName="Name" />
                                    </Columns>
                                </PropertiesComboBox>
                            </dx:GridViewDataComboBoxColumn>
                        </Columns>
                        <SettingsDataSecurity AllowDelete="False" />
                    </dx:ASPxGridView>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <br />

    <asp:Table runat="server" id="Table2" Width="100%" >
         <asp:TableRow ><asp:TableCell><dx:ASPxLabel ID="ASPxLabel19" runat="server" Font-Size="Large" Text="Privileges"></dx:ASPxLabel></asp:TableCell></asp:TableRow>
         <asp:TableRow><asp:TableCell></asp:TableCell></asp:TableRow>
        <%--User Grid--%>
        <asp:TableRow >
            <asp:TableCell>
                    <dx:ASPxGridView ID="gvPrivileges" runat="server" AutoGenerateColumns="False" DataSourceID="dsPrivileges" KeyFieldName="Page" Width="80%" >
                            <Columns>
                                <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0">
                                </dx:GridViewCommandColumn>
                                <dx:GridViewDataTextColumn FieldName="ParentID" Visible="False" VisibleIndex="1" Width="10%">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Page" VisibleIndex="2" Width="60%">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataCheckColumn FieldName="View" VisibleIndex="3" Width="10%">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </dx:GridViewDataCheckColumn>
                                <dx:GridViewDataCheckColumn FieldName="ManageData" VisibleIndex="4" Width="10%">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </dx:GridViewDataCheckColumn>
                                <dx:GridViewDataCheckColumn FieldName="Print" VisibleIndex="5" Width="10%">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </dx:GridViewDataCheckColumn>
                            </Columns>
                            <SettingsEditing Mode="PopupEditForm">
                            </SettingsEditing>
                        </dx:ASPxGridView>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

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
    
    <asp:SqlDataSource ID="dsPrivileges" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="ohsn_Web_GetUserManagementUserPermissions_Select" SelectCommandType="StoredProcedure" UpdateCommand="OHSN_Web_UserPrivileges_Update" UpdateCommandType="StoredProcedure">
         <SelectParameters>
             <asp:SessionParameter Name="ContactID" SessionField="WorkingContactID" Type="Int64" />
         </SelectParameters>
         <UpdateParameters>
             <asp:Parameter Name="ParentID" Type="Int64" />
             <asp:Parameter Name="Page" Type="Int64" />
             <asp:Parameter Name="Print" Type="Boolean" />
             <asp:Parameter Name="ManageData" Type="Boolean" />
             <asp:Parameter Name="View" Type="Boolean" />
         </UpdateParameters>
     </asp:SqlDataSource>

     <asp:SqlDataSource ID="dsProtocols" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="SELECT ID, Name FROM EmployerProtocols WHERE (ParentID = @WorkingEmployerID) AND (AvailableToWebsite = 1) AND (Active = 1)">
            <SelectParameters>
                <asp:SessionParameter Name="WorkingEmployerID" SessionField="WorkingEmployerID" />
            </SelectParameters>
        </asp:SqlDataSource>

     <asp:SqlDataSource ID="dsJobCategory" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="SELECT ID, NAME FROM TypeItem WHERE GroupName LIKE 'Job Title Classification' AND WebVisible = 1 AND Active = 1"></asp:SqlDataSource>

    <asp:SqlDataSource ID="dsUserLevel" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="SELECT ID, NAME FROM TypeItem WHERE GroupName LIKE 'Web User Security' AND WebVisible = 1 AND Active = 1"></asp:SqlDataSource>

    <asp:SqlDataSource ID="dsDeliveryMethod" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="SELECT ID, NAME FROM TypeItem WHERE GroupName LIKE 'Delivery Method' AND WebVisible = 1 AND Active = 1"></asp:SqlDataSource>

</asp:Content>
