<%@ Page Title="" Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeBehind="ProjectDOT.aspx.cs" Inherits="CustomerPortal.Projects.ProjectDOT" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">

    <script runat="server" >
    

  </script>

            <%-- Left Margin --%>
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
                </Groups>
            </dx:RibbonTab>
        </Tabs>
    </dx:ASPxRibbon>

        <%-- Left Column --%>
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

     <%-- DOT --%>
     <asp:Table runat="server" Width="100%">
         <asp:TableRow><asp:TableCell></asp:TableCell><asp:TableCell><dx:ASPxLabel ID="ASPxLabel21" runat="server" Font-Size="Large" Text="DOT Results"> </dx:ASPxLabel></asp:TableCell></asp:TableRow>
         <asp:TableRow><asp:TableCell></asp:TableCell></asp:TableRow>
                  <asp:TableRow>
                <asp:TableCell  Width="10%"></asp:TableCell>
                <asp:TableCell>
                    <dx:ASPxLabel runat="server" Text="Drug Test Results"></dx:ASPxLabel>
                </asp:TableCell>
            <asp:TableCell>
                   <dx:ASPxLabel runat="server" Text="Druig Refusal Result"></dx:ASPxLabel>
            </asp:TableCell>
            <asp:TableCell>
                   <dx:ASPxLabel runat="server" Text="Drug Confirmation Result"></dx:ASPxLabel>
            </asp:TableCell>
             <asp:TableCell  Width="10%"></asp:TableCell>
        </asp:TableRow>
          <asp:TableRow>
                <asp:TableCell  Width="10%"></asp:TableCell>
                <asp:TableCell>
                        <dx:ASPxRadioButtonList ID="rblDrugTestResults" runat="server" ClientInstanceName="rblDrugTestResults"  ValueType="System.Int32" AutoPostBack="true" OnSelectedIndexChanged="rblDrugTestResults_SelectedIndexChanged">
                             <Items>
                                 <dx:ListEditItem Text="Test Result was Negative" Value="0" />
                                 <dx:ListEditItem Text="Test was Cancelled" Value="1" />
                                 <dx:ListEditItem Text="Test Result was Refused" Value="2" />
                                 <dx:ListEditItem Text="Test Result was Positive" Value="3" />
                             </Items>
                         </dx:ASPxRadioButtonList>  
                         <dx:ASPxCheckBox ID="ckBlindSpecimensSubmitted" runat="server" CheckState="Unchecked" Text="Blind Specimen collected" Font-Size="Small"></dx:ASPxCheckBox>
                          <dx:ASPxCheckBox ID="ckSecondCollectionPerformed" runat="server" CheckState="Unchecked" Text="2nd Collection was performed" Font-Size="Small"></dx:ASPxCheckBox>                                                               
                </asp:TableCell>
                <asp:TableCell>
                         <dx:ASPxRadioButtonList ID="rblDrugTestRefused" runat="server" SelectedIndex="-1" ValueType="System.Int32" Visible="false">
                             <Items>
                                 <dx:ListEditItem Text="Adulterated Specimen" Value="0" />
                                 <dx:ListEditItem Text="Substituted Specimen" Value="1"  />
                                 <dx:ListEditItem Text="'Shy' Bladder"  Value="2" />
                                 <dx:ListEditItem Text="Other Refusal"  Value="3" />
                             </Items>
                         </dx:ASPxRadioButtonList>                                    
            </asp:TableCell>
                <asp:TableCell>
                    <asp:CheckBoxList ID="clbDrugTestPositiveResults" runat="server" Visible="false">
                                 <asp:ListItem>Positive for Marijuana</asp:ListItem>
                                 <asp:ListItem>Positive for Cocaine</asp:ListItem>
                                 <asp:ListItem>Positive for PCP</asp:ListItem>
                                 <asp:ListItem>Positive for Opiates</asp:ListItem>
                                 <asp:ListItem>Positive for Amphetamines</asp:ListItem>
                     </asp:CheckBoxList>                
            </asp:TableCell>
             <asp:TableCell  Width="10%"></asp:TableCell>
        </asp:TableRow>
         <asp:TableRow><asp:TableCell><br /></asp:TableCell></asp:TableRow>
         <asp:TableRow>
                <asp:TableCell  Width="10%"></asp:TableCell>
                <asp:TableCell>
                    <dx:ASPxLabel runat="server" Text="Alcohol Test Result"></dx:ASPxLabel>
                </asp:TableCell>
            <asp:TableCell>
                   <dx:ASPxLabel runat="server" Text="Alcohol Refusal Result"></dx:ASPxLabel>
            </asp:TableCell>
            <asp:TableCell>
                   <dx:ASPxLabel runat="server" Text="Alcohol Confirmation Result"></dx:ASPxLabel>
            </asp:TableCell>
             <asp:TableCell  Width="10%"></asp:TableCell>
        </asp:TableRow>
         <asp:TableRow>
                <asp:TableCell  Width="10%"></asp:TableCell>
                <asp:TableCell>
                        <dx:ASPxRadioButtonList ID="rblAlcoholTestResults" runat="server"  ValueType="System.Int32" AutoPostBack="true" OnSelectedIndexChanged="rblAlcoholTestResults_SelectedIndexChanged" >
                             <Items>
                                 <dx:ListEditItem Text="Test Result was less 0.02" Value="0" />
                                 <dx:ListEditItem Text="Test was Cancelled" Value="1" />
                                 <dx:ListEditItem Text="Test Result was Refused" Value="2" />
                                 <dx:ListEditItem Text="Test Result was ≥ 0.02" Value="3" />
                             </Items>
                         </dx:ASPxRadioButtonList>                                                             
                </asp:TableCell>
            <asp:TableCell>
                 <dx:ASPxRadioButtonList ID="rblAlcoholTestRefused" runat="server" SelectedIndex="-1" ValueType="System.Int32" Visible="false">
                             <Items>
                                 <dx:ListEditItem Text="'Shy' lung"  Value="2" />
                                 <dx:ListEditItem Text="Other Refusal"  Value="3" />
                             </Items>
                         </dx:ASPxRadioButtonList>                                    
            </asp:TableCell>
            <asp:TableCell>
                 <dx:ASPxRadioButtonList ID="rblAlcoholTestPositiveResults" runat="server" SelectedIndex="-1" ValueType="System.Int32" Visible="false">
                             <Items>
                                 <dx:ListEditItem Text="Confirm Result was 0.02 - 0.039" Value="0" />
                                 <dx:ListEditItem Text="Confirm Result was ≥ 0.04" Value="1" />
                                 <dx:ListEditItem Text="No Confirmation Result recorded" Value="2" />
                             </Items>
                         </dx:ASPxRadioButtonList>                                                 
            </asp:TableCell>
             <asp:TableCell  Width="10%"></asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <br />
    <br />    
     </div>

    <%-- Data Sources --%>
   <asp:SqlDataSource ID="dsProjectDetails" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="OHSN_Web_ProjectDOTDetails_Select" SelectCommandType="StoredProcedure">
       <SelectParameters>
           <asp:SessionParameter Name="ProjectID" SessionField="ProjectID" Type="Int64" />
       </SelectParameters>
   </asp:SqlDataSource>

    <asp:SqlDataSource ID="dsFiles" runat="server" ></asp:SqlDataSource>

    <asp:SqlDataSource ID="dsJobCategory" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="ohsn_Web_GetJobCategorList"></asp:SqlDataSource>
    <br />

</asp:Content>
