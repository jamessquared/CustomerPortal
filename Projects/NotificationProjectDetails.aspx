<%@ Page Title="" Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeBehind="NotificationProjectDetails.aspx.cs" Inherits="CustomerPortal.Projects.NotificationProjectDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
     <br />
     <asp:Table  runat="server" ID="Table1"  HorizontalAlign="Center">
         <asp:TableRow>
             <asp:TableCell HorizontalAlign="Center"><dx:ASPxLabel ID="ASPxLabel3" runat="server" Font-Size="X-Large" Text="Project Notification"></dx:ASPxLabel></asp:TableCell>
         </asp:TableRow>
         <asp:TableRow>
             <asp:TableCell><dx:ASPxLabel ID="ASPxLabel20" runat="server" Text="Please review requests for correction to the project displayed below.  After you have reviewed each request, enter a response in the response box.  When you are finsihed, please press the submit button."> </dx:ASPxLabel></asp:TableCell>
         </asp:TableRow>
     </asp:Table>
    <br />
    <br />
    &nbsp;&nbsp;&nbsp;
    <dx:ASPxMemo ID="memNotifications" runat="server" Height="71px" Width="100%" Enabled="False" ReadOnly="True"></dx:ASPxMemo>
    <br />
    <br />
    <br />
    &nbsp;&nbsp;&nbsp;
    <dx:ASPxLabel ID="ASPxLabel23" runat="server" Font-Size="Large" Text="Enter Response">
    </dx:ASPxLabel>
    <br />
    &nbsp;&nbsp;&nbsp;
    <dx:ASPxMemo ID="memResponse" runat="server" Height="71px" Width="100%"></dx:ASPxMemo>
     <br />
    <br />
    
    <asp:Table runat="server" Width="100%" HorizontalAlign="Center">
       <asp:TableRow HorizontalAlign="Center" >
           <asp:TableCell></asp:TableCell>
           <asp:TableCell></asp:TableCell>
           <asp:TableCell><dx:ASPxButton ID="btnSubmit" runat="server" Text="Submit" HorizontalAlign="Center" OnClick="btnSubmit_Click"></dx:ASPxButton></dx:ASPxButton></asp:TableCell>
           <asp:TableCell></asp:TableCell>
            <asp:TableCell><dx:ASPxButton ID="btnCancel" runat="server" Text="Cancel" HorizontalAlign="Center" OnClick="btnCancel_Click"></dx:ASPxButton></dx:ASPxButton></asp:TableCell>
           <asp:TableCell></asp:TableCell>
           <asp:TableCell></asp:TableCell>
       </asp:TableRow>
    </asp:Table>  

    <br />
    <br />
    <dx:ASPxPanel ID="ASPxPanel1" runat="server" Width="100%" Height="4px"><PanelCollection><dx:PanelContent runat="server"></dx:PanelContent></PanelCollection><Border BorderStyle="Solid" BorderWidth="2px" /></dx:ASPxPanel>
    <dx:ASPxPanel ID="ASPxPanel2" runat="server" Width="100%" Height="4px"><PanelCollection><dx:PanelContent runat="server"></dx:PanelContent></PanelCollection><Border BorderStyle="Solid" BorderWidth="2px" /></dx:ASPxPanel>
    <br />
    <br />
    
    &nbsp;&nbsp;&nbsp;<dx:ASPxLabel ID="ASPxLabel22" runat="server" Font-Size="X-Large" Text="Project To Review">
    </dx:ASPxLabel>
    <br />
    <br />

      <asp:Table  runat="server" ClientIDMode="Static" ID="ProjectTable">
        <%--Project ID--%>
        <asp:TableRow> 
            <asp:TableCell></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Project ID:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Left"><dx:ASPxTextBox ID="txtbxProjectID" runat="server" Enabled="false" ></dx:ASPxTextBox></asp:TableCell>
        </asp:TableRow>
        <%--Project Name--%>
        <asp:TableRow> 
            <asp:TableCell></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Last Name:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Left"><dx:ASPxTextBox ID="txtbxLastName" runat="server"  Enabled="false"></dx:ASPxTextBox></asp:TableCell>
            <asp:TableCell> &nbsp;</asp:TableCell>
             <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="First:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Left"><dx:ASPxTextBox ID="txtbxFirstName" runat="server"  Enabled="false" ></dx:ASPxTextBox></asp:TableCell>
            <asp:TableCell> &nbsp;</asp:TableCell>
            <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="M.I.:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell HorizontalAlign="Left"><dx:ASPxTextBox ID="txtbxMI" runat="server"  Enabled="false" HorizontalAlign="Left"></dx:ASPxTextBox></asp:TableCell>
        </asp:TableRow>
          <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
        <%--Project Address--%>
       <asp:TableRow> 
           <asp:TableCell></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel6" runat="server"  Text="Street:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Left"><dx:ASPxTextBox ID="txtbxPrimaryAddressline" runat="server" Width="80%"  Enabled="false"></dx:ASPxTextBox></asp:TableCell>
        </asp:TableRow>
       <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
       <asp:TableRow> 
           <asp:TableCell></asp:TableCell>
           <asp:TableCell></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Left" Width="50%"><dx:ASPxTextBox ID="txtbxSecondaryAddressline" runat="server"  Width="100%" Enabled="false"></dx:ASPxTextBox></asp:TableCell>
        </asp:TableRow>
          <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
       <asp:TableRow> 
           <asp:TableCell></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="City:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Left"><dx:ASPxTextBox ID="txtbxCity" runat="server"  Enabled="false"></dx:ASPxTextBox></asp:TableCell>
           <asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell>
             <asp:TableCell  HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="State:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Left"><dx:ASPxTextBox ID="txtbxState" runat="server"  Enabled="false"></dx:ASPxTextBox></asp:TableCell>
           <asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell>
            <asp:TableCell><dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Postal Code:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxTextBox ID="txtbxPostalCode" runat="server"  Enabled="false"></dx:ASPxTextBox></asp:TableCell>
        </asp:TableRow>
          <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
        <%--DOB / SSN--%>
        <asp:TableRow>
            <asp:TableCell></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="DOB:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Left"><dx:ASPxTextBox ID="txtbxDOB" runat="server"  Enabled="false"></dx:ASPxTextBox></asp:TableCell>
            <asp:TableCell></asp:TableCell>
             <asp:TableCell  HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="SSN:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Left"><dx:ASPxTextBox ID="txtbxSSN" runat="server"  Enabled="false"></dx:ASPxTextBox></asp:TableCell>
        </asp:TableRow>
          <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
        <%--Phone--%>
        <asp:TableRow>
            <asp:TableCell></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel12" runat="server" Text="Phone:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Left"><dx:ASPxTextBox ID="txtbxPhone" runat="server"  Enabled="false"></dx:ASPxTextBox></asp:TableCell>
            <asp:TableCell></asp:TableCell>
             <asp:TableCell  HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel13" runat="server" Text="2nd Phone:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Left"><dx:ASPxTextBox ID="txtbxSecondPhone" runat="server"  Enabled="false"></dx:ASPxTextBox></asp:TableCell>
        </asp:TableRow>
          <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
        <%--email--%>
        <asp:TableRow>
            <asp:TableCell></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel14" runat="server" Text="Email:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Left"><dx:ASPxTextBox ID="txtbxEmail" runat="server"  Enabled="false"></dx:ASPxTextBox></asp:TableCell>
        </asp:TableRow>
          <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
        <%--Job--%>
        <asp:TableRow>
            <asp:TableCell></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel15" runat="server" Text="Job Title:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Left"><dx:ASPxTextBox ID="txtbxJobTitle" runat="server" Width="80%" Enabled="false"></dx:ASPxTextBox></asp:TableCell>
        </asp:TableRow>
          <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
        <%--Project Info--%>
        <asp:TableRow>
            <asp:TableCell></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel17" runat="server" Text="Request Type:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell HorizontalAlign="Left"><dx:ASPxTextBox ID="txtbxRequestType" runat="server"  Enabled="false"></dx:ASPxTextBox></asp:TableCell>
            <asp:TableCell></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel18" runat="server" Text="Schedule By:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Left"><dx:ASPxTextBox ID="txtbxScheduleBy" runat="server"  Enabled="false"></dx:ASPxTextBox></asp:TableCell>
            <asp:TableCell></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel19" runat="server" Text="Complete By:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Left"><dx:ASPxTextBox ID="txtbxCompleteBy" runat="server"  Enabled="false"></dx:ASPxTextBox></asp:TableCell>

        </asp:TableRow>
        <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
        <%--Special Instructions--%>
        <asp:TableRow>
            <asp:TableCell></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel16" runat="server" Text="Special Instructions:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Left"><dx:ASPxTextBox ID="txtbxSpecialInstructions" runat="server"  Enabled="false" Width="50%"></dx:ASPxTextBox></asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    
    <br />
    <dx:ASPxLabel ID="ASPxLabel24" runat="server" Font-Size="Large" Text="Protocols"> </dx:ASPxLabel>
    <br />
    &nbsp;&nbsp;&nbsp;
    <dx:ASPxGridView ID="gvProtocols" runat="server" AutoGenerateColumns="False" DataSourceID="dsProjectDetailsViewProtocolInfo" Width="100%">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="ProtocolID" VisibleIndex="1" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Protocol" VisibleIndex="2" Width="50%">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ServiceID" VisibleIndex="3"  Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Service" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="Date of Service" VisibleIndex="0" Width="10%" PropertiesDateEdit-DisplayFormatString="d">
            </dx:GridViewDataDateColumn>
        </Columns>
        <SettingsPager Visible="False">
        </SettingsPager>
        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
    </dx:ASPxGridView>
    <br />
    <br />
    <dx:ASPxLabel ID="ASPxLabel21" runat="server" Font-Size="Large" Text="Notes"> </dx:ASPxLabel>
    <br />
    &nbsp;&nbsp;&nbsp;
    <dx:ASPxGridView ID="gvNotes" runat="server" DataSourceID="dsProjectDetailsViewNotes" Width="100%" AutoGenerateColumns="False">
        <Columns>
            <dx:GridViewDataDateColumn Caption="Created" FieldName="EnteredOn" ReadOnly="True" VisibleIndex="0" Width="10%">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn Caption="Created By" FieldName="EnteredByName" ReadOnly="True" VisibleIndex="1" Width="20%">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Note" FieldName="Note" ReadOnly="True" VisibleIndex="2" Width="70%">
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsPager Visible="False">
        </SettingsPager>
        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
    </dx:ASPxGridView>
    <br />
 

    <%--Project Name--%>
   <asp:SqlDataSource ID="dsProjectDetails" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="OHSN_Web_ProjectDetailsPatientInfo" SelectCommandType="StoredProcedure">
       <SelectParameters>
           <asp:SessionParameter Name="ProjectID" SessionField="ProjectID" Type="Int64" />
       </SelectParameters>
   </asp:SqlDataSource>

    <asp:SqlDataSource ID="dsProjectDetailsViewProtocolInfo" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="OHSN_Web_ProjectViewDetailsProtocols" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="ProjectID" SessionField="ProjectID" Type="Int64" />
            <asp:SessionParameter DefaultValue="" Name="EmployerID" SessionField="WorkingEmployerID" Type="Int64" />
        </SelectParameters>
    </asp:SqlDataSource>
    
        <asp:SqlDataSource ID="dsProjectDetailsViewNotes" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="OHSN_Web_ProjectViewDetailsNotes" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="ProjectID" SessionField="ProjectID" Type="Int64" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dsNotification" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="OHSN_pm_GetUserNotifications_Select" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="ProjectID" SessionField="ProjectID" Type="Int64" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />

</asp:Content>
