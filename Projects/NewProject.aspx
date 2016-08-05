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

    <div runat="server" style="overflow:auto; max-height:650px" >

      <asp:Table  runat="server" ID="ProjectTable"  Width="100%">
        <%-- Project Name --%>
        <asp:TableRow>
            <%-- Left Margin --%>
            <asp:TableCell  Width="10%"></asp:TableCell>
            <%-- Left Column --%>
             <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel16" runat="server" Text="Last Name:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxTextBox ID="txtbxLastName" runat="server" ></dx:ASPxTextBox></asp:TableCell>
            <%-- Center Margin --%>
            <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel23" runat="server" Text="First:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxTextBox ID="txtbxFirstName" runat="server"  ></dx:ASPxTextBox></asp:TableCell>
            <%-- Right Column --%>
            <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel24" runat="server" Text="M.I.:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxTextBox ID="txtbxMI" runat="server"  HorizontalAlign="Left"></dx:ASPxTextBox></asp:TableCell>
            <%-- Right Margin --%>
            <asp:TableCell Width="10%"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
        <%-- Project Address --%>
        <asp:TableRow>
            <%-- Left Margin --%>
            <asp:TableCell  Width="10%"></asp:TableCell>
            <%-- Left Column --%>
             <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel1" runat="server"  Text="Street:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxTextBox ID="txtbxPrimaryAddressline" runat="server" Width="100%" ></dx:ASPxTextBox></asp:TableCell>
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
            <asp:TableCell><dx:ASPxTextBox ID="txtbxSecondaryAddressline" runat="server"  Width="100%"></dx:ASPxTextBox></asp:TableCell>
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
             <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="City:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxTextBox ID="txtbxCity" runat="server"  ></dx:ASPxTextBox></asp:TableCell>
            <%-- Center Margin --%>
            <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="State:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell>
                    <dx:ASPxComboBox ID="cbxState" runat="server" DropDownStyle="DropDownList" DataSourceID="dsStates" ValueField="Name"  ValueType="System.String" EnableCallbackMode="true">
                        <Columns>
                            <dx:ListBoxColumn FieldName="Name" Width="30%" />
                            <dx:ListBoxColumn FieldName="Description"  Width="70%"/>
                        </Columns>
                    </dx:ASPxComboBox>
            </asp:TableCell>
            <%-- Right Column --%>
            <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Postal Code:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxTextBox ID="txtbxPostalCode" runat="server" ><MaskSettings Mask="00000-9999"  IncludeLiterals="None" /></dx:ASPxTextBox></asp:TableCell>
            <%-- Right Margin --%>
            <asp:TableCell Width="10%"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
        <%--DOB / SSN--%>
        <asp:TableRow>
            <%-- Left Margin --%>
            <asp:TableCell  Width="10%"></asp:TableCell>
            <%-- Left Column --%>
             <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="DOB:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxDateEdit ID="deDOB" runat="server" DisplayFormatString="d" MinDate="1900-01-01"></dx:ASPxDateEdit></asp:TableCell>
            <%-- Center Margin --%>
            <asp:TableCell ></asp:TableCell>
            <asp:TableCell ></asp:TableCell>
            <%-- Right Column --%>
            <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="SSN:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxTextBox ID="txtbxSSN" runat="server" ><MaskSettings Mask="000-00-0000"  IncludeLiterals="None"/></dx:ASPxTextBox></asp:TableCell>
            <%-- Right Margin --%>
            <asp:TableCell Width="10%"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
        <%--Phone--%>
        <asp:TableRow>
            <%-- Left Margin --%>
            <asp:TableCell  Width="10%"></asp:TableCell>
            <%-- Left Column --%>
             <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Phone:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxTextBox ID="txtbxMainPhone" runat="server"  ><MaskSettings Mask="(999) 000-0000" IncludeLiterals="None"/></dx:ASPxTextBox></asp:TableCell>
            <%-- Center Margin --%>
            <asp:TableCell ></asp:TableCell>
            <asp:TableCell ></asp:TableCell>
            <%-- Right Column --%>
            <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="2nd Phone:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxTextBox ID="txtbxAltPhone" runat="server"  ><MaskSettings Mask="(999) 000-0000" IncludeLiterals="None"/></dx:ASPxTextBox></asp:TableCell>
            <%-- Right Margin --%>
            <asp:TableCell Width="10%"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
        <%-- Email --%>
        <asp:TableRow>
            <%-- Left Margin --%>
            <asp:TableCell  Width="10%"></asp:TableCell>
            <%-- Left Column --%>
             <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="Email:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxTextBox ID="txtbxEmail" runat="server"  ></dx:ASPxTextBox></asp:TableCell>
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
            <asp:TableCell><dx:ASPxComboBox ID="cbxJobCategory" runat="server" DataSourceID="dsJobCategory" TextField="Name" ValueField="ID" AutoPostBack="True" OnTextChanged="cbxJobCategory_TextChanged" ></dx:ASPxComboBox></asp:TableCell>
            <%-- Center Margin --%>
            <asp:TableCell ></asp:TableCell>
            <asp:TableCell ></asp:TableCell>
            <%-- Right Column --%>
            <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel12" runat="server" Text="Job Title:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxTextBox ID="txtbxJobTitle" runat="server" ></dx:ASPxTextBox></asp:TableCell>
            <%-- Right Margin --%>
            <asp:TableCell Width="10%"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
        <%-- Request Type / Schedule By --%>
        <asp:TableRow>
            <%-- Left Margin --%>
            <asp:TableCell  Width="10%"></asp:TableCell>
            <%-- Left Column --%>
             <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Request Type:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxComboBox ID="cbxRequestType" runat="server" ValueType="System.String" DataSourceID="dsRequestType" TextField="Name" ValueField="ID" ImageUrlField="image" ></dx:ASPxComboBox></asp:TableCell>
            <%-- Center Margin --%>
            <asp:TableCell ></asp:TableCell>
            <asp:TableCell ></asp:TableCell>
            <%-- Right Column --%>
            <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel13" runat="server" Text="Schedule By:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxDateEdit ID="deScheduleBy" runat="server" DisplayFormatString="d"   MinDate="1900-01-01"></dx:ASPxDateEdit></asp:TableCell>
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
            <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel14" runat="server" Text="Complete By:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxDateEdit ID="deCompleteBy" runat="server" DisplayFormatString="d"  MinDate="1900-01-01"></dx:ASPxDateEdit></asp:TableCell>
            <%-- Right Margin --%>
            <asp:TableCell Width="10%"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
        <%-- Protocol --%>
        <asp:TableRow>
            <%-- Left Margin --%>
            <asp:TableCell  Width="10%"></asp:TableCell>
            <%-- Left Column --%>
             <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel20" runat="server" Text="Protocol:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell>
                    <dx:ASPxComboBox ID="cbxProtocol" runat="server" DataSourceID="dsProtocols"  ValueField="ID" AutoCallback="true" OnValueChanged="cbxProtocol_ValueChanged" AutoPostBack="True" ClientInstanceName="cbxProtocol" EnableCallbackMode="True"  TextField="Name">
                        <Columns>
                            <dx:ListBoxColumn FieldName="Name" Name="Name" Width="200px" />
                            <dx:ListBoxColumn FieldName="ReportToMIS" Name="ReportToMIS" Visible="False" />
                        </Columns>
                    </dx:ASPxComboBox>
            </asp:TableCell>
            <%-- Center Margin --%>
            <asp:TableCell HorizontalAlign="Right" ><dx:ASPxLabel ID="lblDOTAgency" runat="server" Text="D.O.T. Agency:"  Visible="false"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell >
                <dx:ASPxComboBox ID="cbxDOTAgency" runat="server" DataSourceID="dsDOTAgency" TextField="Name" ValueField="ID" Width="236px" AutoPostBack="true" ClientInstanceName="cbxDOTAgency" Visible="false" OnSelectedIndexChanged="cbxDOTAgency_SelectedIndexChanged"  ValueType="System.Int32" >
                        <Columns>
                            <dx:ListBoxColumn Caption="Abreviation" FieldName="NAME" Width="35px" />
                            <dx:ListBoxColumn Caption="Name" FieldName="Description" Width="275px" />
                        </Columns>
                    </dx:ASPxComboBox>
            </asp:TableCell>
            <%-- Right Column --%>
            <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="lblDOTServiceAgency" runat="server" Text="D.O.T. Service Category:"  Visible="false"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxComboBox ID="cbxDOTServiceCategory" runat="server"  ValueType="System.String" DataSourceID="dsDOTServiceCategory" TextField="Name" ValueField="ID"  Visible="false"></dx:ASPxComboBox></asp:TableCell>
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
            <asp:TableCell  HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel15" runat="server" Text="Special Instructions:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxMemo ID="memSpecialInstructions" runat="server" Height="75px" Width="750px" ></dx:ASPxMemo></asp:TableCell>
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


    </div>

        <asp:SqlDataSource ID="dsStates" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="OHSN_Web_GetStatesList" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        <asp:SqlDataSource ID="dsJobCategory" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="OHSN_Web_GetJobCategorList" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        <asp:SqlDataSource ID="dsProtocols" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="OHSN_Web_Project_GetUserProtocols" SelectCommandType="StoredProcedure" CancelSelectOnNullParameter="False">
            <SelectParameters>
                <asp:SessionParameter Name="ContactID" SessionField="ContactID" />
                <asp:ControlParameter ControlID="cbxJobCategory" DefaultValue="" Name="JobTitleClassification" PropertyName="Text" DbType="AnsiString"  />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsRequestType" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="OHSN_Web_GetProjectRequestTypeList" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        <asp:SqlDataSource ID="dsDOTAgency" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="OHSN_Web_GetDOTAgencyList" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        <asp:SqlDataSource ID="dsDOTServiceCategory" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="OHSN_Web_GetDOTServiceCategoryList" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="cbxDOTAgency" DefaultValue="" Name="DOTAgencyTID" PropertyName="Value" DbType="Int32"  />
            </SelectParameters>
        </asp:SqlDataSource>

</asp:Content>
