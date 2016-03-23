<%@ Page Title="" Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeBehind="ProjectDetails.aspx.cs" Inherits="CustomerPortal.Projects.ProjectDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">

    <script runat="server" >
    

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
                </Groups>
            </dx:RibbonTab>
        </Tabs>
    </dx:ASPxRibbon>

        <%-- Form Title --%>
     <asp:Table  runat="server" ID="Table1"  HorizontalAlign="Center">
         <asp:TableRow><asp:TableCell><dx:ASPxLabel ID="ASPxLabel22" runat="server" Font-Size="X-Large" Text="Project Details"></dx:ASPxLabel></asp:TableCell></asp:TableRow>
     </asp:Table> 
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
            <dx:GridViewDataTextColumn FieldName="ProtocolID" VisibleIndex="1" Visible="false">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Protocol" VisibleIndex="2" Width="50%">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ServiceID" VisibleIndex="4" Visible="false">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="Date of Service" VisibleIndex="0"  Width="10%" PropertiesDateEdit-DisplayFormatString="d" Caption="Date of Service" Name="10%">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="Service" VisibleIndex="3" Width="40%">
            </dx:GridViewDataTextColumn>
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
    <dx:ASPxGridView ID="gvNotes" runat="server" DataSourceID="dsProjectDetailsViewNotes" AutoGenerateColumns="False" Width="100%">
        <Columns>
            <dx:GridViewDataDateColumn FieldName="EnteredOn" VisibleIndex="0"  PropertiesDateEdit-DisplayFormatString="d" Width="10%" Caption="Created">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="EnteredByName" ReadOnly="True" VisibleIndex="1" Width="20%" Caption="Created By">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Note" ReadOnly="True" VisibleIndex="2" Width="70%">
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsPager Visible="False">
        </SettingsPager>
        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
    </dx:ASPxGridView>
    <br />
    <br />
    <dx:ASPxLabel ID="ASPxLabel20" runat="server" Font-Size="Large" Text="Results"> </dx:ASPxLabel>
    <br />
    <dx:ASPxGridView ID="gvFiles" runat="server"></dx:ASPxGridView>
    <br />
   
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

    <asp:SqlDataSource ID="dsFiles" runat="server" >
    </asp:SqlDataSource>
    <br />

</asp:Content>
