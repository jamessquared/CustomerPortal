<%@ Page Title="" Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeBehind="NewProject.aspx.cs" Inherits="CustomerPortal.Projects.NewProject" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <p>
     <br />
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
         <asp:TableRow><asp:TableCell><dx:ASPxLabel ID="ASPxLabel3" runat="server" Font-Size="X-Large" Text="New Project"></dx:ASPxLabel></asp:TableCell></asp:TableRow>
     </asp:Table> 
    <br />

      <asp:Table  runat="server" ClientIDMode="Static" ID="ProjectTable"  Width="100%" Height="100%">
        <%--Project Name--%>
        <asp:TableRow> 
            <asp:TableCell></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Last Name:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Left"><dx:ASPxTextBox ID="txtbxLastName" runat="server" Width="75%" ></dx:ASPxTextBox></asp:TableCell>
            <asp:TableCell> &nbsp;</asp:TableCell>
             <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="First:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Left"><dx:ASPxTextBox ID="txtbxFirstName" runat="server" Width="75%"></dx:ASPxTextBox></asp:TableCell>
            <asp:TableCell> &nbsp;</asp:TableCell>
            <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="M.I.:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell HorizontalAlign="Left"><dx:ASPxTextBox ID="txtbxMI" runat="server"   HorizontalAlign="Left"></dx:ASPxTextBox></asp:TableCell>
        </asp:TableRow>
          <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
        <%--Project Address--%>
       <asp:TableRow> 
           <asp:TableCell></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel6" runat="server"  Text="Street:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Left"><dx:ASPxTextBox ID="txtbxPrimaryAddressline" runat="server"  Width="75%" ></dx:ASPxTextBox></asp:TableCell>
        </asp:TableRow>
       <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
       <asp:TableRow> 
           <asp:TableCell></asp:TableCell>
           <asp:TableCell></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Left" Width="50%"><dx:ASPxTextBox ID="txtbxSecondaryAddressline" runat="server"   Width="75%"></dx:ASPxTextBox></asp:TableCell>
        </asp:TableRow>
          <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
       <asp:TableRow> 
           <asp:TableCell></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="City:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Left"><dx:ASPxTextBox ID="txtbxCity" runat="server"   Width="75%"></dx:ASPxTextBox></asp:TableCell>
           <asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell>
             <asp:TableCell  HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="State:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Left"><dx:ASPxComboBox ID="cmbxStates" runat="server" ValueType="System.String" DataSourceID="dsStates" TextField="Name" ValueField="Name"  Width="25%"></dx:ASPxComboBox></asp:TableCell>
           <asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell>
            <asp:TableCell><dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Postal Code:" Width="100%"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxTextBox ID="txtbxPostalCode" runat="server" >
                                             <MaskSettings Mask="00000" />
                                             <ValidationSettings CausesValidation="True" ErrorText="Enter a valid zip code!" SetFocusOnError="True">
                                                    <RegularExpression ValidationExpression="\d{5}(-\d{4})?" />
                                             </ValidationSettings>
                                    </dx:ASPxTextBox>
            </asp:TableCell>
        </asp:TableRow>
          <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
        <%--DOB / SSN--%>
        <asp:TableRow>
            <asp:TableCell></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="DOB:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Left"><dx:ASPxDateEdit ID="deDOB" runat="server" DisplayFormatString="d"></dx:ASPxDateEdit> </asp:TableCell>

            <asp:TableCell></asp:TableCell>
             <asp:TableCell  HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="SSN:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Left"><dx:ASPxTextBox ID="txtbxSSN" runat="server"  IncludeLiterals="None"  >
                                                                            <MaskSettings Mask="000-00-0000" />
                                                                            <ValidationSettings CausesValidation="True" ErrorText="Enter a valid social security number" SetFocusOnError="True">
                                                                                <RegularExpression ValidationExpression="\d{3}-\d{2}-\d{4}" />
                                                                            </ValidationSettings>
                                                                    </dx:ASPxTextBox>
              </asp:TableCell>
        </asp:TableRow>
          <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
        <%--Phone--%>
        <asp:TableRow>
            <asp:TableCell></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel12" runat="server" Text="Phone:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Left"><dx:ASPxTextBox ID="txtbxMainPhone" runat="server"  IncludeLiterals="None"  >
                                                                            <MaskSettings Mask="(999) 000-0000" />
                                                                            <ValidationSettings CausesValidation="True" ErrorText="Enter a valid phone number!" SetFocusOnError="True">
                                                                                <RegularExpression ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" />
                                                                            </ValidationSettings>
                                                                      </dx:ASPxTextBox>
            </asp:TableCell>
            <asp:TableCell></asp:TableCell>
             <asp:TableCell  HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel13" runat="server" Text="2nd Phone:"  Width="100%"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Left"><dx:ASPxTextBox ID="txtbxAltPhone" runat="server"  IncludeLiterals="None" >
                                                                            <MaskSettings Mask="(999) 000-0000" />
                                                                            <ValidationSettings CausesValidation="True" ErrorText="Enter a valid phone number!" SetFocusOnError="True">
                                                                                <RegularExpression ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" />
                                                                            </ValidationSettings>
                                                                      </dx:ASPxTextBox>
            </asp:TableCell>
        </asp:TableRow>
          <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
        <%--email--%>
        <asp:TableRow>
            <asp:TableCell></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel14" runat="server" Text="Email:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Left"><dx:ASPxTextBox ID="txtbxEmail" runat="server"   Width="75%"  IncludeLiterals="None" >
                                                                        <ValidationSettings CausesValidation="True" ErrorText="Enter a valid email address" SetFocusOnError="True">
                                                                                <RegularExpression ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                                                        </ValidationSettings>
                                                                    </dx:ASPxTextBox>
            </asp:TableCell>
        </asp:TableRow>
          <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
        <%--Job--%>
        <asp:TableRow>
            <asp:TableCell></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel15" runat="server" Text="Job Category:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Left"><dx:ASPxComboBox ID="cbxJobCategory" runat="server" ValueType="System.String" DataSourceID="dsJobCategory" TextField="Name" ValueField="ID" Width="75%"></dx:ASPxComboBox></asp:TableCell>
            <asp:TableCell></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Job Title:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Left"><dx:ASPxTextBox ID="txtbxJobTitle" runat="server"  Width="75%"></dx:ASPxTextBox></asp:TableCell>
        </asp:TableRow>
          <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
        <%--Project Info--%>
        <asp:TableRow DisplayFormatString="d" Font-Italic="True">
            <asp:TableCell></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel17" runat="server" Text="Request Type:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell HorizontalAlign="Left"><dx:ASPxComboBox ID="cbxRequestType" runat="server" ValueType="System.String" DataSourceID="dsRequestType" TextField="Name" ValueField="ID"  Width="50%" ></dx:ASPxComboBox></asp:TableCell>
            <asp:TableCell></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel18" runat="server" Text="Schedule By:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Left"><dx:ASPxDateEdit ID="dedScheduleBy" runat="server" DisplayFormatString="d"  Width="50%" MinDate="1900-01-01"></dx:ASPxDateEdit></asp:TableCell>
            <asp:TableCell></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel19" runat="server" Text="Complete By:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Left"><dx:ASPxDateEdit ID="dedCompleteBy" runat="server" DisplayFormatString="d"  Width="50%"  MinDate="1900-01-01"></dx:ASPxDateEdit></asp:TableCell>

        </asp:TableRow>
        <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
        <%--Protocol--%>
        <asp:TableRow>
            <asp:TableCell></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel20" runat="server" Text="Protocol:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell HorizontalAlign="Left"><dx:ASPxComboBox ID="cbxProtocol" runat="server" ValueType="System.String" DataSourceID="dsProtocols" TextField="Name" ValueField="ID"  Width="75%"></dx:ASPxComboBox></asp:TableCell>
            <asp:TableCell></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel21" runat="server" Text="D.O.T.:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Left"><dx:ASPxComboBox ID="cbxDOT" runat="server"  ValueType="System.String" DataSourceID="dsDOT" TextField="Name" ValueField="ID"  Width="75%"></dx:ASPxComboBox></asp:TableCell>
            <asp:TableCell></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
        <%--Special Instructions--%>
        <asp:TableRow>
            <asp:TableCell></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel22" runat="server" Text="Special Instructions:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell HorizontalAlign="Left"><dx:ASPxMemo ID="memSpecialInstructions" runat="server" Height="100%" Width="75%"></dx:ASPxMemo></asp:TableCell>
            <asp:TableCell></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Right"></asp:TableCell>
            <asp:TableCell  HorizontalAlign="Left"></asp:TableCell>
            <asp:TableCell></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
    </asp:Table>   
     <br />
   
    <br />
    <br />
    <br />
        <asp:SqlDataSource ID="dsStates" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="SELECT Name, Description, ID FROM TypeItem WHERE GROUPName = 'States' AND Active = 1 ORDER BY ListOrder ASC, Name ASC"></asp:SqlDataSource>
        <asp:SqlDataSource ID="dsJobCategory" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="SELECT JobTitleClassification, ID FROM EmployerProtocolJobTitles ORDER BY JobTitleClassification ASC"></asp:SqlDataSource>
        <asp:SqlDataSource ID="dsProtocols" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="SELECT ID, Name FROM EmployerProtocols WHERE (ParentID = @WorkingEmployerID) AND (AvailableToWebsite = 1) AND (Active = 1)">
            <SelectParameters>
                <asp:SessionParameter Name="WorkingEmployerID" SessionField="WorkingEmployerID" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsRequestType" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="SELECT Name, Description, ID FROM TypeItem WHERE GROUPName = 'Project Request Type' AND Active = 1 ORDER BY ID"></asp:SqlDataSource>
        <asp:SqlDataSource ID="dsDOT" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="SELECT Name, ID FROM TypeITem WHERE GroupName = 'D.O.T. Agency' AND WebVisible = 1 AND Active = 1 ORDER BY ListOrder ASC, Name ASC"></asp:SqlDataSource>

</asp:Content>
