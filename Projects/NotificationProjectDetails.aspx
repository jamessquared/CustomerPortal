<%@ Page Title="" Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeBehind="NotificationProjectDetails.aspx.cs" Inherits="CustomerPortal.Projects.NotificationProjectDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
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
                        </Items>
                    </dx:RibbonGroup>
                </Groups>
            </dx:RibbonTab>
        </Tabs>
    </dx:ASPxRibbon>

        <%-- Form Title --%>
     <asp:Table  runat="server" ID="Table4"  HorizontalAlign="Center">
         <asp:TableRow><asp:TableCell><dx:ASPxLabel ID="ASPxLabel25" runat="server" Font-Size="X-Large" Text="Project Notification"></dx:ASPxLabel></asp:TableCell></asp:TableRow>
         <asp:TableRow><asp:TableCell>&nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
         <asp:TableRow>
             <asp:TableCell><dx:ASPxLabel ID="ASPxLabel26" runat="server" Text="Please review requests for correction to the project displayed below.  After you have reviewed each request, enter a response in the response box.  When you are finsihed, please press the submit button."> </dx:ASPxLabel></asp:TableCell>
         </asp:TableRow>
     </asp:Table> 
    <br />
    <br />

   <div runat="server" style="overflow:auto; max-height:600px" >

    <asp:table runat="server" Width="100%">
        <asp:TableRow>
            <asp:TableCell Width="45%">
                <dx:ASPxLabel ID="ASPxLabel20" runat="server" Font-Size="Large" Text="Coordinator Notes"></dx:ASPxLabel>
            </asp:TableCell>
            <asp:TableCell Width="10%"></asp:TableCell>
            <asp:TableCell Width="45%">
                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Font-Size="Large" Text="Enter Response"></dx:ASPxLabel>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell Width="45%">
                <dx:ASPxMemo ID="memNotifications" runat="server" Height="71px" Width="100%" Enabled="False" ReadOnly="True"></dx:ASPxMemo>
            </asp:TableCell>
            <asp:TableCell Width="10%"></asp:TableCell>
            <asp:TableCell Width="45%">
                <dx:ASPxMemo ID="memResponse" runat="server" Height="71px" Width="100%"></dx:ASPxMemo>
            </asp:TableCell>
        </asp:TableRow>
    </asp:table>

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

      <asp:Table  runat="server" ID="ProjectTable" Width="100%">
        <%-- Project ID --%>
        <asp:TableRow Width="100%">
            <%-- Left Margin --%>
            <asp:TableCell  Width="10%"></asp:TableCell>
            <%-- Left Column --%>
             <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Project ID:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxTextBox ID="txtbxProjectID" runat="server" Enabled="false" ></dx:ASPxTextBox></asp:TableCell>
            <%-- Center Margin --%>
            <asp:TableCell ></asp:TableCell>
            <asp:TableCell ></asp:TableCell>
            <%-- Right Column --%>
            <asp:TableCell Width="10%"></asp:TableCell>
            <%-- Right Margin --%>
            <asp:TableCell Width="10%"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
        <%-- Project Name --%>
        <asp:TableRow>
            <%-- Left Margin --%>
            <asp:TableCell  Width="10%"></asp:TableCell>
            <%-- Left Column --%>
             <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Last Name:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxTextBox ID="txtbxLastName" runat="server"  Enabled="false"></dx:ASPxTextBox></asp:TableCell>
            <%-- Center Margin --%>
            <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="First:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxTextBox ID="txtbxFirstName" runat="server"  Enabled="false" ></dx:ASPxTextBox></asp:TableCell>
            <%-- Right Column --%>
            <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="M.I.:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxTextBox ID="txtbxMI" runat="server"  Enabled="false" HorizontalAlign="Left"></dx:ASPxTextBox></asp:TableCell>
            <%-- Right Margin --%>
            <asp:TableCell Width="10%"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
        <%-- Project Address --%>
        <asp:TableRow>
            <%-- Left Margin --%>
            <asp:TableCell  Width="10%"></asp:TableCell>
            <%-- Left Column --%>
             <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel6" runat="server"  Text="Street:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxTextBox ID="txtbxPrimaryAddressline" runat="server" Width="100%" Enabled="false"></dx:ASPxTextBox></asp:TableCell>
            <%-- Center Margin --%>
            <asp:TableCell ></asp:TableCell>
            <asp:TableCell ></asp:TableCell>
            <%-- Right Column --%>
            <asp:TableCell HorizontalAlign="Right">   </asp:TableCell>
            <asp:TableCell>        </asp:TableCell>
            <%-- Right Margin --%>
            <asp:TableCell Width="10%"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
        <%-- Project Address 2 --%>
        <asp:TableRow>
            <%-- Left Margin --%>
            <asp:TableCell  Width="10%"></asp:TableCell>
            <%-- Left Column --%>
             <asp:TableCell HorizontalAlign="Right"></asp:TableCell>
            <asp:TableCell><dx:ASPxTextBox ID="txtbxSecondaryAddressline" runat="server"  Width="100%" Enabled="false"></dx:ASPxTextBox></asp:TableCell>
            <%-- Center Margin --%>
            <asp:TableCell ></asp:TableCell>
            <asp:TableCell ></asp:TableCell>          
            <%-- Right Column --%>
            <asp:TableCell HorizontalAlign="Right">   </asp:TableCell>
            <asp:TableCell>        </asp:TableCell>
            <%-- Right Margin --%>
            <asp:TableCell Width="10%"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
        <%-- Project City --%>
        <asp:TableRow>
            <%-- Left Margin --%>
            <asp:TableCell  Width="10%"></asp:TableCell>
            <%-- Left Column --%>
             <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="City:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxTextBox ID="txtbxCity" runat="server"  Enabled="false"></dx:ASPxTextBox></asp:TableCell>
            <%-- Center Margin --%>
            <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="State:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxTextBox ID="txtbxState" runat="server"  Enabled="false"></dx:ASPxTextBox></asp:TableCell>
            <%-- Right Column --%>
            <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Postal Code:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxTextBox ID="txtbxPostalCode" runat="server"  Enabled="false"></dx:ASPxTextBox></asp:TableCell>
            <%-- Right Margin --%>
            <asp:TableCell Width="10%"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
        <%-- DOB / SSN --%>
        <asp:TableRow>
            <%-- Left Margin --%>
            <asp:TableCell  Width="10%"></asp:TableCell>
            <%-- Left Column --%>
             <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="DOB:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxTextBox ID="txtbxDOB" runat="server"  Enabled="false" ><MaskSettings Mask="MM/dd/yyyy"  IncludeLiterals="None"/></dx:ASPxTextBox></asp:TableCell>
            <%-- Center Margin --%>
            <asp:TableCell ></asp:TableCell>
            <asp:TableCell ></asp:TableCell>
            <%-- Right Column --%>
            <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="SSN:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxTextBox ID="txtbxSSN" runat="server"  Enabled="false"><MaskSettings Mask="000-00-0000"  IncludeLiterals="None"/></dx:ASPxTextBox></asp:TableCell>
            <%-- Right Margin --%>
            <asp:TableCell Width="10%"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
        <%-- Phone --%>
        <asp:TableRow>
            <%-- Left Margin --%>
            <asp:TableCell  Width="10%"></asp:TableCell>
            <%-- Left Column --%>
             <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel12" runat="server" Text="Phone:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxTextBox ID="txtbxPhone" runat="server"  Enabled="false"><MaskSettings Mask="(999) 000-0000" IncludeLiterals="None"/></dx:ASPxTextBox></asp:TableCell>
            <%-- Center Margin --%>
            <asp:TableCell ></asp:TableCell>
            <asp:TableCell ></asp:TableCell>
            <%-- Right Column --%>
            <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel13" runat="server" Text="2nd Phone:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxTextBox ID="txtbxSecondPhone" runat="server"  Enabled="false"><MaskSettings Mask="(999) 000-0000" IncludeLiterals="None"/></dx:ASPxTextBox></asp:TableCell>
            <%-- Right Margin --%>
            <asp:TableCell Width="10%"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
        <%-- Email --%>
        <asp:TableRow>
            <%-- Left Margin --%>
            <asp:TableCell  Width="10%"></asp:TableCell>
            <%-- Left Column --%>
             <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel14" runat="server" Text="Email:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxTextBox ID="txtbxEmail" runat="server"  Enabled="false"></dx:ASPxTextBox></asp:TableCell>
            <%-- Center Margin --%>
            <asp:TableCell ></asp:TableCell>
            <asp:TableCell ></asp:TableCell>
            <%-- Right Column --%>
            <asp:TableCell HorizontalAlign="Right"></asp:TableCell>
            <asp:TableCell></asp:TableCell>
            <%-- Right Margin --%>
            <asp:TableCell Width="10%"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
        <%-- Job --%>
        <asp:TableRow>
            <%-- Left Margin --%>
            <asp:TableCell  Width="10%"></asp:TableCell>
            <%-- Left Column --%>
             <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="lblJobCategory" runat="server" Text="Job Category:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxComboBox ID="cbxJobCategory" runat="server" DataSourceID="dsJobCategory" TextField="Name" ValueField="ID" ></dx:ASPxComboBox></asp:TableCell>
            <%-- Center Margin --%>
            <asp:TableCell ></asp:TableCell>
            <asp:TableCell ></asp:TableCell>
            <%-- Right Column --%>
            <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel15" runat="server" Text="Job Title:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxTextBox ID="txtbxJobTitle" runat="server" Enabled="false"></dx:ASPxTextBox></asp:TableCell>
            <%-- Right Margin --%>
            <asp:TableCell Width="10%"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
        <%-- Request Type / Schedule By --%>
        <asp:TableRow>
            <%-- Left Margin --%>
            <asp:TableCell  Width="10%"></asp:TableCell>
            <%-- Left Column --%>
             <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel17" runat="server" Text="Request Type:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxTextBox ID="txtbxRequestType" runat="server"  Enabled="false"></dx:ASPxTextBox></asp:TableCell>
            <%-- Center Margin --%>
            <asp:TableCell ></asp:TableCell>
            <asp:TableCell ></asp:TableCell>
            <%-- Right Column --%>
            <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel18" runat="server" Text="Schedule By:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxTextBox ID="txtbxScheduleBy" runat="server"  Enabled="false" ><MaskSettings Mask="MM/dd/yyyy"  IncludeLiterals="None"/></dx:ASPxTextBox></asp:TableCell>
            <%-- Right Margin --%>
            <asp:TableCell Width="10%"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
        <%-- Complete By --%>
        <asp:TableRow>
            <%-- Left Margin --%>
            <asp:TableCell  Width="10%"></asp:TableCell>
            <%-- Left Column --%>
             <asp:TableCell HorizontalAlign="Right"> </asp:TableCell>
            <asp:TableCell>   </asp:TableCell>
            <%-- Center Margin --%>
            <asp:TableCell ></asp:TableCell>
            <asp:TableCell ></asp:TableCell>
            <%-- Right Column --%>
            <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel19" runat="server" Text="Complete By:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxTextBox ID="txtbxCompleteBy" runat="server" Width="100%"  Enabled="false"><MaskSettings Mask="MM/dd/yyyy"  IncludeLiterals="None"/></dx:ASPxTextBox></asp:TableCell>
            <%-- Right Margin --%>
            <asp:TableCell Width="10%"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
    </asp:Table>  


    <asp:Table runat="server" ID="SpecialInstructionsTable"  Width="100%">
        <asp:TableRow>
            <%-- Left Margin --%>
            <asp:TableCell  Width="10%"></asp:TableCell>
            <%-- Left Column --%>
            <asp:TableCell  HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel16" runat="server" Text="Special Instructions:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxMemo ID="memSpecialInstructions" runat="server" Height="75px" Width="750px"  ></dx:ASPxMemo></asp:TableCell>
            <%-- Center Margin --%>
            <asp:TableCell ></asp:TableCell>
            <asp:TableCell ></asp:TableCell>
            <%-- Right Column --%>
            <asp:TableCell HorizontalAlign="Right"></asp:TableCell>
            <asp:TableCell></asp:TableCell>
            <%-- Right Margin --%>
            <asp:TableCell Width="10%"></asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <br />


        <%-- Protocols --%>
        <asp:Table runat="server" id="Table2" Width="100%" >
         <asp:TableRow ><asp:TableCell></asp:TableCell><asp:TableCell><dx:ASPxLabel ID="ASPxLabel24" runat="server" Font-Size="Large" Text="Protocols"> </dx:ASPxLabel></asp:TableCell></asp:TableRow>
         <asp:TableRow><asp:TableCell></asp:TableCell></asp:TableRow>
        <%-- Protocols --%>
        <asp:TableRow >
            <asp:TableCell  Width="10%"></asp:TableCell>
            <asp:TableCell>
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
            </asp:TableCell>
            <asp:TableCell  Width="10%"></asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <br />
    <br />
        
        <%-- Notes --%>
        <asp:Table runat="server" id="Table3" Width="100%" >
         <asp:TableRow ><asp:TableCell></asp:TableCell><asp:TableCell><dx:ASPxLabel ID="ASPxLabel21" runat="server" Font-Size="Large" Text="Notes"> </dx:ASPxLabel></asp:TableCell></asp:TableRow>
         <asp:TableRow><asp:TableCell></asp:TableCell></asp:TableRow>
        <%-- Notes --%>
        <asp:TableRow >
            <asp:TableCell  Width="10%"></asp:TableCell>
            <asp:TableCell>
                <dx:ASPxGridView ID="gvNotes" runat="server" DataSourceID="dsProjectDetailsViewNotes" AutoGenerateColumns="False" Width="100%">
                    <Columns>
                        <dx:GridViewDataDateColumn FieldName="EnteredOn" VisibleIndex="0"  PropertiesDateEdit-DisplayFormatString="d" Width="10%" Caption="Created">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn FieldName="EnteredByName" ReadOnly="True" VisibleIndex="1" Width="10%" Caption="Created By">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Note" ReadOnly="True" VisibleIndex="2" Width="70%">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <SettingsPager Visible="False">
                    </SettingsPager>
                    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                </dx:ASPxGridView>
            </asp:TableCell>
            <asp:TableCell  Width="10%"></asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <br />
    <br />  

   </div>

    <%-- Data Source --%>
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

     <asp:SqlDataSource ID="dsJobCategory" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="ohsn_Web_GetJobCategorList"></asp:SqlDataSource>
    <br />

</asp:Content>
