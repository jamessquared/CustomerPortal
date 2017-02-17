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
    
     <div runat="server" style="overflow:auto; max-height:600px" >

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
            <asp:TableCell><dx:ASPxComboBox ID="cbxJobCategory" runat="server"  Enabled="false" DataSourceID="dsJobCategory" TextField="Name" ValueField="ID" ></dx:ASPxComboBox></asp:TableCell>
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

        <%-- D.O.T. --%>
        <asp:TableRow>
            <%-- Left Margin --%>
            <asp:TableCell  Width="10%"></asp:TableCell>
            <%-- Left Column --%>
             <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel20" runat="server" Text="D.O.T. Agency:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxTextBox ID="txtbxDOTAgency" runat="server" Enabled="false"></dx:ASPxTextBox></asp:TableCell>
            <%-- Center Margin --%>
            <asp:TableCell ></asp:TableCell>
            <asp:TableCell ></asp:TableCell>
            <%-- Right Column --%>
            <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel23" runat="server" Text="D.O.T. Service Category:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxTextBox ID="txtbxDOTServiceCategory" runat="server" Enabled="false"></dx:ASPxTextBox></asp:TableCell>
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
            <asp:TableCell  HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Special Instructions:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxMemo ID="memSpecialInstructions" runat="server" Height="75px" Width="750px" ReadOnly="true" ></dx:ASPxMemo></asp:TableCell>
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
                        <dx:GridViewDataDateColumn FieldName="Date of Service" VisibleIndex="0"  Width="10%" PropertiesDateEdit-DisplayFormatString="d" Caption="Date of Service" >
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
         <asp:TableRow ><asp:TableCell></asp:TableCell><asp:TableCell><dx:ASPxLabel ID="ASPxLabel16" runat="server" Font-Size="Large" Text="Notes"> </dx:ASPxLabel></asp:TableCell></asp:TableRow>
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


        <%-- Results --%>
        <asp:Table runat="server" id="Table4" Width="100%" >
         <asp:TableRow ><asp:TableCell></asp:TableCell><asp:TableCell><dx:ASPxLabel ID="lblResults" runat="server" Font-Size="Large" Text="Results"> </dx:ASPxLabel></asp:TableCell></asp:TableRow>
         <asp:TableRow><asp:TableCell></asp:TableCell></asp:TableRow>
        <%-- Results --%>
        <asp:TableRow >
            <asp:TableCell  Width="10%"></asp:TableCell>
            <asp:TableCell>
                <dx:ASPxGridView ID="gvFiles" runat="server" AutoGenerateColumns="False">
                    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                </dx:ASPxGridView>
            </asp:TableCell>
            <asp:TableCell  Width="10%"></asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <br />
    <br />

     <%-- DOT Drug Results --%>
    <asp:Table runat="server" Width="100%">
         <asp:TableRow><asp:TableCell></asp:TableCell><asp:TableCell><dx:ASPxLabel ID="lblDOTDrugResults" runat="server" Font-Size="Large" Text="DOT Drug Results"> </dx:ASPxLabel></asp:TableCell></asp:TableRow>
         <asp:TableRow><asp:TableCell></asp:TableCell></asp:TableRow>
        <asp:TableRow>
                <asp:TableCell  Width="10%"></asp:TableCell>
                <asp:TableCell>
                    <dx:ASPxCheckBox ID="ckResultNegative" runat="server" CheckState="Unchecked" Text="Result tested Negative" Font-Size="Small" Enabled="false"></dx:ASPxCheckBox>
                </asp:TableCell>
            <asp:TableCell>
                <dx:ASPxCheckBox ID="ckPositiveForMarijuana" runat="server" CheckState="Unchecked" Text="Positive for Marijuana" Font-Size="Small" Enabled="false"></dx:ASPxCheckBox>
            </asp:TableCell>
            <asp:TableCell>
                 <dx:ASPxCheckBox ID="ckPositiveForCocaine" runat="server" CheckState="Checked" Text="Positive for Cocaine" Font-Size="Small" Enabled="false"></dx:ASPxCheckBox>
            </asp:TableCell>
             <asp:TableCell  Width="10%"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
                 <asp:TableCell  Width="10%"></asp:TableCell>
                <asp:TableCell>
                    <dx:ASPxCheckBox ID="ckPositiveForPCP" runat="server" CheckState="Unchecked" Text="Positive for PCP" Font-Size="Small" Enabled="false"></dx:ASPxCheckBox>
                </asp:TableCell>
            <asp:TableCell>
                <dx:ASPxCheckBox ID="ckPositiveForOpiates" runat="server" CheckState="Unchecked" Text="Positive for Opiates" Font-Size="Small" Enabled="false"></dx:ASPxCheckBox>
            </asp:TableCell>
            <asp:TableCell>
                 <dx:ASPxCheckBox ID="ckPositiveForAmphetamines" runat="server" CheckState="Checked" Text="Positive for Amphetamines" Font-Size="Small" Enabled="false"></dx:ASPxCheckBox>
            </asp:TableCell>
             <asp:TableCell  Width="10%"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell  Width="10%"></asp:TableCell>
            <asp:TableCell></asp:TableCell>
            <asp:TableCell></asp:TableCell>
            <asp:TableCell></asp:TableCell>
            <asp:TableCell  Width="10%"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell  Width="10%"></asp:TableCell>
            <asp:TableCell>
                    <dx:ASPxCheckBox ID="ckBlindSpecimensSubmitted" runat="server" CheckState="Unchecked" Text="Blind Specimen collection?" Font-Size="Small" Enabled="false"></dx:ASPxCheckBox>
            </asp:TableCell>
            <asp:TableCell>
                <dx:ASPxCheckBox ID="ckSecondCollectionPerformed" runat="server" CheckState="Unchecked" Text="2nd Collection was performed?" Font-Size="Small" Enabled="false"></dx:ASPxCheckBox>
            </asp:TableCell>
            <asp:TableCell>
            </asp:TableCell>
            <asp:TableCell  Width="10%"></asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <br />
    <br />
    <%-- DOT Drug Results  Refused --%>
    <asp:Table runat="server" Width="100%">
         <asp:TableRow><asp:TableCell></asp:TableCell><asp:TableCell><dx:ASPxLabel ID="lblDrugResultsRefused" runat="server" Font-Size="Large" Text="DOT Drug Results Refusal"> </dx:ASPxLabel></asp:TableCell></asp:TableRow>
         <asp:TableRow><asp:TableCell></asp:TableCell></asp:TableRow>
        <asp:TableRow>
                 <asp:TableCell  Width="10%"></asp:TableCell>
                <asp:TableCell>
                    <dx:ASPxCheckBox ID="ckRefusedDueToAdulterated" runat="server" CheckState="Unchecked" Text="Refused due to Adultated" Font-Size="Small" Enabled="false"></dx:ASPxCheckBox>
                </asp:TableCell>
            <asp:TableCell>
                <dx:ASPxCheckBox ID="ckRefusedDueToSubstition" runat="server" CheckState="Unchecked" Text="Refused due to Substitution" Font-Size="Small" Enabled="false"></dx:ASPxCheckBox>
            </asp:TableCell>
            <asp:TableCell>
                 <dx:ASPxCheckBox ID="ckRefusedDueToShyBladder" runat="server" CheckState="Checked" Text="Refused due to 'Shy' Bladder" Font-Size="Small" Enabled="false"></dx:ASPxCheckBox>
            </asp:TableCell>
             <asp:TableCell  Width="10%"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
                 <asp:TableCell  Width="10%"></asp:TableCell>
                <asp:TableCell>
                    <dx:ASPxCheckBox ID="ckDrugTestRefusedDueToOtherReason" runat="server" CheckState="Unchecked" Text="Refused due to Other Reason" Font-Size="Small" Enabled="false"></dx:ASPxCheckBox>
                </asp:TableCell>
            <asp:TableCell>
                <dx:ASPxCheckBox ID="ckDrugTestCancelled" runat="server" CheckState="Unchecked" Text="Test Cancelled" Font-Size="Small" Enabled="false"></dx:ASPxCheckBox>
            </asp:TableCell>
            <asp:TableCell>
            </asp:TableCell>
             <asp:TableCell  Width="10%"></asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <br />
    <br />
    <%-- DOT Alcohol Results --%>
    <asp:Table runat="server"  Width="100%">
         <asp:TableRow><asp:TableCell></asp:TableCell><asp:TableCell><dx:ASPxLabel ID="lblAlcoholResults" runat="server" Font-Size="Large" Text="DOT Alcohol Results"> </dx:ASPxLabel></asp:TableCell></asp:TableRow>
         <asp:TableRow><asp:TableCell></asp:TableCell></asp:TableRow>
        <asp:TableRow>
                 <asp:TableCell  Width="10%"></asp:TableCell>
                <asp:TableCell>
                    <dx:ASPxCheckBox ID="ckResultLessthan02" runat="server" CheckState="Unchecked" Text="Result < 0.02" Font-Size="Small" Enabled="false"></dx:ASPxCheckBox>
                </asp:TableCell>
            <asp:TableCell>
                <dx:ASPxCheckBox ID="ckResult02orGreater" runat="server" CheckState="Unchecked" Text="Result < 0.02" Font-Size="Small" Enabled="false"></dx:ASPxCheckBox>
            </asp:TableCell>
            <asp:TableCell>
            </asp:TableCell>
             <asp:TableCell  Width="10%"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
                 <asp:TableCell  Width="10%"></asp:TableCell>
                <asp:TableCell>
                    <dx:ASPxCheckBox ID="ckConfirmationResultBetween02and039" runat="server" CheckState="Unchecked" Text="Confirmation result 0.02 to 0.039" Font-Size="Small" Enabled="false"></dx:ASPxCheckBox>
                </asp:TableCell>
            <asp:TableCell>
                <dx:ASPxCheckBox ID="ckConfirmationResultGreaterorequalto04" runat="server" CheckState="Unchecked" Text="Confirmation result > 0.039" Font-Size="Small" Enabled="false"></dx:ASPxCheckBox>
            </asp:TableCell>
            <asp:TableCell>
            </asp:TableCell>
             <asp:TableCell  Width="10%"></asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <br />
    <br />
    <%-- DOT Alcohol Results  Refused --%>
    <asp:Table runat="server" Width="100%">
         <asp:TableRow><asp:TableCell></asp:TableCell><asp:TableCell><dx:ASPxLabel ID="lblAlcoholResultsRefusal" runat="server" Font-Size="Large" Text="DOT Alcohol Results Refusal"> </dx:ASPxLabel></asp:TableCell></asp:TableRow>
         <asp:TableRow><asp:TableCell></asp:TableCell></asp:TableRow>
        <asp:TableRow>
                 <asp:TableCell  Width="10%"></asp:TableCell>
                <asp:TableCell>
                    <dx:ASPxCheckBox ID="ckRefusedDueToShyLung" runat="server" CheckState="Unchecked" Text="Refused due to 'Shy' Lung" Font-Size="Small" Enabled="false"></dx:ASPxCheckBox>
                </asp:TableCell>
                <asp:TableCell>
                    <dx:ASPxCheckBox ID="ckAlcoholTestRefusedDueToOtherReason" runat="server" CheckState="Unchecked" Text="Refused due to Other Reason" Font-Size="Small" Enabled="false"></dx:ASPxCheckBox>
                </asp:TableCell>
            <asp:TableCell>
                <dx:ASPxCheckBox ID="ckAlcoholTestCancelled" runat="server" CheckState="Unchecked" Text="Test Cancelled" Font-Size="Small" Enabled="false"></dx:ASPxCheckBox>
            </asp:TableCell>
             <asp:TableCell  Width="10%"></asp:TableCell>
        </asp:TableRow>
    </asp:Table>
     
     </div>

    <%--Data Source--%>
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

    <asp:SqlDataSource ID="dsFiles" runat="server" ></asp:SqlDataSource>

    <asp:SqlDataSource ID="dsJobCategory" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="ohsn_Web_GetJobCategorList"></asp:SqlDataSource>

    <br />

</asp:Content>
