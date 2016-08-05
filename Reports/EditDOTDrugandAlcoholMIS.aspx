﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeBehind="EditDOTDrugandAlcoholMIS.aspx.cs" Inherits="CustomerPortal.Reports.EditDOTDrugandAlcoholMIS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
   <%--Ribbon--%>
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
                            <dx:RibbonButtonItem Name="btnPrint" Size="Large" Text="Print">
                                <LargeImage Url="~/Images/Reports/Print.png">
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

  <%--Title--%>
    <asp:Table runat="server" Width="100%" HorizontalAlign="Center">
        <asp:TableRow runat="server" Width="100%" HorizontalAlign="Center">
            <asp:TableCell><dx:ASPxLabel ID="lblFormTitle" runat="server" Width="100%" Text="U.S. DEPARTMENT OF TRANSPORTATION DRUG AND ALCOHOL TESTING MIS DATA COLLECTION FORM" Font-Bold="true"></dx:ASPxLabel></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow><asp:TableCell>&nbsp;</asp:TableCell></asp:TableRow>
        <asp:TableRow runat="server" Width="100%" HorizontalAlign="Center">
            <asp:TableCell>
                    <dx:ASPxComboBox ID="cbxCalendarYear" runat="server" Caption="Calendar Year Covered by this Report:"  DataSourceID="dsReportYears"  TextField="ReportYear" ValueField="ReportYear" ValueType="System.Int32"  ></dx:ASPxComboBox>               
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow Height="50%"><asp:TableCell>&nbsp;</asp:TableCell></asp:TableRow>
        <asp:TableRow runat="server" Width="100%" HorizontalAlign="Center">
            <asp:TableCell>
                    <dx:ASPxComboBox ID="cbxReportFor" runat="server" Caption="Report For:" DataSourceID="dsDOTAgencyList" TextField="ReportFor" ValueField="ReportForTID" ValueType="System.Int32"  ></dx:ASPxComboBox>                
             </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow><asp:TableCell>&nbsp;</asp:TableCell></asp:TableRow>
    </asp:Table>
    <br />

    <div runat="server" style="overflow-x:auto; overflow-y:auto; max-height:550px;">

     <%--I.  Employer--%>
    <asp:Table runat="server" Width="100%">
        <asp:TableRow>
            <asp:TableCell><dx:ASPxLabel ID="ASPxLabel2" runat="server" Width="100%" Text="I. Employer" Font-Bold="true"></dx:ASPxLabel></asp:TableCell>
        </asp:TableRow>
         <%--Company Name--%>
        <asp:TableRow Width="100%">
            <asp:TableCell Width="100%"><dx:ASPxTextBox ID="txtbxCompanyName" runat="server" Caption="   Company Name:" Enabled="false" Width="100%" ToolTip="The official name of the company for which this report is being created."></dx:ASPxTextBox></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow><asp:TableCell>&nbsp;</asp:TableCell></asp:TableRow>
         <%--DBA Name--%>
        <asp:TableRow Width="100%">
            <asp:TableCell><dx:ASPxTextBox ID="txtbxDBAName" runat="server" Caption="   Doing Business As (DBA) Name (if applicable):" Width="100%" ToolTip="The commonly used name of the company for which this report is being created."></dx:ASPxTextBox></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow><asp:TableCell>&nbsp;</asp:TableCell></asp:TableRow>
   </asp:Table>

    <asp:Table runat="server" Width="100%">
         <%--Address--%>
        <asp:TableRow Width="100%">
            <asp:TableCell Width="70%" HorizontalAlign="Left"><dx:ASPxTextBox ID="txtbxAddress" runat="server" Caption="   Address:" Enabled="false" Width="98%" ToolTip="The physical address of company for which this report is being created." ></dx:ASPxTextBox></asp:TableCell>
            <asp:TableCell Width="30%" HorizontalAlign="Left"><dx:ASPxTextBox ID="txtbxEmail" runat="server" Caption="      E-mail:"  Width="100%" ToolTip="The corporate email address of company for which this report is being created, if available."></dx:ASPxTextBox></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow><asp:TableCell>&nbsp;</asp:TableCell></asp:TableRow>
         <%--Name of Certifying Official--%>
        <asp:TableRow>
            <asp:TableCell Width="40%"><dx:ASPxTextBox ID="txtbxNameOfCertifyingOfficial" runat="server" Caption="   Name of Certifying Official:" Width="98%" ToolTip="The name of the person who is responsible for the accuracy of this report."></dx:ASPxTextBox></asp:TableCell>
            <asp:TableCell Width="60%" HorizontalAlign="Left"><dx:ASPxTextBox ID="ASPxTextBox4" runat="server" Caption="   Signature:" Enabled="false" Width="100%" ></dx:ASPxTextBox></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow><asp:TableCell>&nbsp;</asp:TableCell></asp:TableRow>
         <%--Telephone--%>
        <asp:TableRow>
            <asp:TableCell Width="55%" HorizontalAlign="Left"><dx:ASPxTextBox ID="txtbxTelephone" runat="server" Caption="   Telephone:" MaskSettings-Mask="(999) 999-9999" Width="95%"   ToolTip="The telephone number of the person who is responsible for the accuracy of this report."></dx:ASPxTextBox></asp:TableCell>
            <asp:TableCell Width="45%" HorizontalAlign="Left"><dx:ASPxDateEdit ID="dedDateCertified" runat="server" Caption="Date Certified:"  Width="100%" ToolTip="Enter the date that the certifying official certified the report as complete."></dx:ASPxDateEdit></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow><asp:TableCell>&nbsp;</asp:TableCell></asp:TableRow>
        <%--Prepared By--%>
        <asp:TableRow>
            <asp:TableCell Width="75%" HorizontalAlign="Left"><dx:ASPxTextBox ID="txtbxPreparedBy" runat="server" Caption="   Prepared by (if different):" Width="100%"  ToolTip="If someone other than the certifying official completed the report, enter that persons name."></dx:ASPxTextBox></asp:TableCell>
            <asp:TableCell Width="25%" HorizontalAlign="Left"><dx:ASPxTextBox ID="txtbxPreparedByTelephone" runat="server" Caption="   Telephone:" MaskSettings-Mask="(999) 999-9999" Width="100%"  ToolTip="If someone other than the certifying official completed the report, enter that persons telephone number."></dx:ASPxTextBox></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow><asp:TableCell>&nbsp;</asp:TableCell></asp:TableRow>
        <%--TPA--%>
        <asp:TableRow>
            <asp:TableCell Width="75%" HorizontalAlign="Left"><dx:ASPxTextBox ID="txtbxTPAName" runat="server" Caption="   C/TPA Name and Telephone (if applicable):" Enabled="false" Width="98%"  ToolTip="If a Consortium/Third Party Administrator (C/TPA) performs administrative services for your drug and alcohol program operation, enter its name."></dx:ASPxTextBox></asp:TableCell>
            <asp:TableCell Width="25%" HorizontalAlign="Left"><dx:ASPxTextBox ID="txtbxTPATelephoneNumber" runat="server" Caption="  " MaskSettings-Mask="(999) 999-9999" Enabled="false" Width="100%"  ToolTip="If a Consortium/Third Party Administrator (C/TPA) performs administrative services for your drug and alcohol program operation, enter its telephone number."></dx:ASPxTextBox></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow><asp:TableCell>&nbsp;</asp:TableCell></asp:TableRow>
       <asp:TableRow>
           <asp:TableCell>
               <dx:ASPxLabel ID="ASPxLabel3" runat="server" Width="100%" Text="Check the DOT agency for which you are reporting MIS data; and complete on that same line as appropriate:" Font-Bold="true"></dx:ASPxLabel>
           </asp:TableCell>
       </asp:TableRow>
    </asp:Table>

   <asp:Table runat="server" Width="100%">
        <%--FMCSA--%>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Left" Width="5%"><dx:ASPxCheckbox ID="ckFMCSA" runat="server" Text="FMCSA - " TextAlign="Right" ToolTip="if you are submitting to multiple DOT agencies, you must use separate forms for each DOT agency."></dx:ASPxCheckbox></asp:TableCell>
            <asp:TableCell HorizontalAlign="Left" Width="5%"><dx:ASPxTextBox ID="txtbxFMCSADOTNo" runat="server" Caption="Motor Carrier: DOT #:"></dx:ASPxTextBox></asp:TableCell>
            <asp:TableCell HorizontalAlign="Left" Width="10%"><dx:ASPxCheckbox ID="ckFMCSAOwnerOperator" runat="server" Text="Owner-Operator:"></dx:ASPxCheckbox></asp:TableCell>
            <asp:TableCell HorizontalAlign="Left" Width="5%"><dx:ASPxCheckbox ID="ckFMCSAExempt" runat="server" Text="Exempt"></dx:ASPxCheckbox></asp:TableCell>
            <asp:TableCell>&nbsp;</asp:TableCell>
            <asp:TableCell>&nbsp;</asp:TableCell>
        </asp:TableRow>
        <%--FAA--%>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Left" Width="5%"><dx:ASPxCheckbox ID="ckFAA" runat="server" Text="FAA - " TextAlign="Right" ToolTip="if you are submitting to multiple DOT agencies, you must use separate forms for each DOT agency."></dx:ASPxCheckbox></asp:TableCell>
            <asp:TableCell HorizontalAlign="Left" Width="10%"><dx:ASPxTextBox ID="txtbxFAACertificateNo" runat="server" Caption="Aviation: Certificate #:" ></dx:ASPxTextBox></asp:TableCell>
            <asp:TableCell HorizontalAlign="Left" Width="10%"><dx:ASPxTextBox ID="txtbxFAAPlanRegistration" runat="server" Caption="Plan / Registration # (if applicable):" ></dx:ASPxTextBox></asp:TableCell>
            <asp:TableCell>&nbsp;</asp:TableCell>
            <asp:TableCell>&nbsp;</asp:TableCell>
            <asp:TableCell>&nbsp;</asp:TableCell>
        </asp:TableRow>
        <%--PHMSA--%>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Left" Width="10%"><dx:ASPxCheckbox ID="ckPHMSA" runat="server" Text="PHMSA - Pipeline:" TextAlign="Right" ToolTip="if you are submitting to multiple DOT agencies, you must use separate forms for each DOT agency."></dx:ASPxCheckbox></asp:TableCell>
            <asp:TableCell HorizontalAlign="Left" Width="10%"><dx:ASPxCheckbox ID="ckPHMSAGasGathering" runat="server" Text="(Check) Gas Gathering:"></dx:ASPxCheckbox></asp:TableCell>
            <asp:TableCell HorizontalAlign="Left" Width="10%"><dx:ASPxCheckbox ID="ckPHMSAGasTransmission" runat="server" Text=" Gas Transmission:"></dx:ASPxCheckbox></asp:TableCell>
            <asp:TableCell HorizontalAlign="Left" Width="10%"><dx:ASPxCheckbox ID="ckPHMSAGasDistribution" runat="server" Text=" Gas Distribution:"></dx:ASPxCheckbox></asp:TableCell>
            <asp:TableCell HorizontalAlign="Left" Width="10%"><dx:ASPxCheckbox ID="ckPHMSATransportHazardousLiquids" runat="server" Text=" Transport Hazardous Liquids:"></dx:ASPxCheckbox></asp:TableCell>
            <asp:TableCell HorizontalAlign="Left" Width="10%"><dx:ASPxCheckbox ID="ckPHMSATransportCarbonDioxide" runat="server" Text=" Transport Carbon Dioxide:"></dx:ASPxCheckbox></asp:TableCell>
        </asp:TableRow>
        <%--FRA--%>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Left" Width="5%"><dx:ASPxCheckbox ID="ckFRA" runat="server" Text="FRA - Railroad:" TextAlign="Right" ToolTip="if you are submitting to multiple DOT agencies, you must use separate forms for each DOT agency."></dx:ASPxCheckbox></asp:TableCell>
            <asp:TableCell HorizontalAlign="Left" Width="30%"><dx:ASPxTextBox ID="txtbxFRACoveredEmployees" runat="server" Caption="  Total Number of observed/documented Part 219 'Rule G' Observations ForeColor covered employees:" ></dx:ASPxTextBox></asp:TableCell>
            <asp:TableCell>&nbsp;</asp:TableCell>
            <asp:TableCell>&nbsp;</asp:TableCell>
            <asp:TableCell>&nbsp;</asp:TableCell>
            <asp:TableCell>&nbsp;</asp:TableCell>
        </asp:TableRow>
        <%--USCG--%>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Left" Width="5%"><dx:ASPxCheckbox ID="ckUSCG" runat="server" Text="USCG - Maritime:" TextAlign="Right" ToolTip="if you are submitting to multiple DOT agencies, you must use separate forms for each DOT agency."></dx:ASPxCheckbox></asp:TableCell>
            <asp:TableCell HorizontalAlign="Left" Width="7%"><dx:ASPxTextBox ID="txtbxUSCGVesselID" runat="server" Caption="  Vessel ID#(USCG-orState-Issued):"></dx:ASPxTextBox></asp:TableCell>
            <asp:TableCell HorizontalAlign="Left" Width="10%"><dx:ASPxLabel ID="ASPxTextBox1" runat="server" Text="  (If more than one vessel, list separately.)"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell>&nbsp;</asp:TableCell>
            <asp:TableCell>&nbsp;</asp:TableCell>
            <asp:TableCell>&nbsp;</asp:TableCell>
        </asp:TableRow>
        <%--FTA--%>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Left" Width="5%"><dx:ASPxCheckbox ID="ckFTA" runat="server" Text="FTA - Transit" TextAlign="Right" ToolTip="if you are submitting to multiple DOT agencies, you must use separate forms for each DOT agency."></dx:ASPxCheckbox></asp:TableCell>
            <asp:TableCell>&nbsp;</asp:TableCell>
            <asp:TableCell>&nbsp;</asp:TableCell>
            <asp:TableCell>&nbsp;</asp:TableCell>
            <asp:TableCell>&nbsp;</asp:TableCell>
            <asp:TableCell>&nbsp;</asp:TableCell>
        </asp:TableRow>

    <%--Section II--%>
        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Left" Width="15%"><dx:ASPxLabel ID="ASPxLabel1" runat="server" Width="100%" Text="II. Covered Employees:  " Font-Bold="true"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell HorizontalAlign="Left" Width="85%"><dx:ASPxTextBox ID="txtbxTotalNoOfSafetySensitveEmployees" runat="server" Caption=" (A) Enter Total Number Safety-Sensitive employees In All Employee Categores:" Font-Bold="true"></dx:ASPxTextBox></asp:TableCell>
        </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Left" Width="30%"><dx:ASPxTextBox ID="txtbxTotalNoOfEmployeeCategories" runat="server" Caption=" (B) Enter Total Number of Employee Categores:" Font-Bold="true"></dx:ASPxTextBox></asp:TableCell>
            <asp:TableCell></asp:TableCell>
        </asp:TableRow>
      
        <asp:TableRow>
            <asp:TableCell  HorizontalAlign="Left" Width="50%">
                <dx:ASPxLabel runat="server" Text="(C)  " Font-Bold="true"></dx:ASPxLabel>
                 <asp:Table runat="server">
                     <asp:TableRow>
                           <asp:TableHeaderCell><dx:ASPxLabel runat="server" Text="Employee Category"></dx:ASPxLabel></asp:TableHeaderCell>
                           <asp:TableHeaderCell><dx:ASPxLabel runat="server" Text="Total Number of Employees in this Category"></dx:ASPxLabel></asp:TableHeaderCell>
                     </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell><dx:ASPxTextBox runat="server" ID="txtbxEmployeeCategory"></dx:ASPxTextBox></asp:TableCell>
                        <asp:TableCell><dx:ASPxTextBox runat="server" ID="txtbxTotalNoOfEmployeesInThisCategory"></dx:ASPxTextBox></asp:TableCell>
                     </asp:TableRow>
                </asp:Table>
            </asp:TableCell>
            <asp:TableCell  HorizontalAlign="Left" Width="25%">
                <dx:ASPxLabel runat="server" Text="If you have multiple employee categories, complete Setions I and II (A) & (B).  Take that filled-in form and make one copy for each employee category and complete Sections II(C), III, and IV for each seperate employee category." Wrap="True" ViewStateMode="Enabled" Width="300px"><BorderTop BorderColor="Black" BorderWidth="2px" />
                </dx:ASPxLabel>                
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

   <%--III. Drug Testing Data --%>
   <asp:Table runat="server" Width="100%">          
              <asp:TableRow>
           <asp:TableCell>
                <dx:ASPxLabel ID="ASPxLabel6" runat="server" Width="100%" Text="III. Drug Testing Data:  " Font-Bold="true"></dx:ASPxLabel>
           </asp:TableCell>
       </asp:TableRow>
       <asp:TableRow>
            <asp:TableCell>
                  <dx:ASPxGridView ID="gvDrugTestingData" runat="server" DataSourceID="dsDOTDrugandAlcoholMISDrugTestData" AutoGenerateColumns="False" KeyFieldName="TypeOfTest">
                      <TotalSummary>
                          <dx:ASPxSummaryItem DisplayFormat="Total" FieldName="TypeOfTest" ShowInColumn="Type of Test" SummaryType="Sum" />
                          <dx:ASPxSummaryItem DisplayFormat="N0" FieldName="TotalNoOfTestResults" ShowInColumn="Total Number of Test Results [Should equal the sum of Columns 2, 3, 9, 10, 11, and 12]" SummaryType="Sum" ValueDisplayFormat="N" />
                          <dx:ASPxSummaryItem DisplayFormat="N0" FieldName="VerifiedNegativeResults" ShowInColumn="Verified Negative results" SummaryType="Sum" ValueDisplayFormat="N" />
                          <dx:ASPxSummaryItem DisplayFormat="N0" FieldName="VerifiedPostiveMoreThanOneDrug" ShowInColumn="Verified Positivie Results ~ For One or More Drugs" SummaryType="Sum" ValueDisplayFormat="N" />
                          <dx:ASPxSummaryItem DisplayFormat="N0" FieldName="PositiveForMarijuana" ShowInColumn="Positive For Marijuana" SummaryType="Sum" ValueDisplayFormat="N" />
                          <dx:ASPxSummaryItem DisplayFormat="N0" FieldName="PositiveForCocaine" ShowInColumn="Positive for Cocaine" SummaryType="Sum" ValueDisplayFormat="N" />
                          <dx:ASPxSummaryItem DisplayFormat="N0" FieldName="PositiveForPCP" ShowInColumn="Positivie for PCP" SummaryType="Sum" ValueDisplayFormat="N" />
                          <dx:ASPxSummaryItem DisplayFormat="N0" FieldName="PositiveForOpiates" ShowInColumn="Positive for Opiates" SummaryType="Sum" ValueDisplayFormat="N" />
                          <dx:ASPxSummaryItem DisplayFormat="N0" FieldName="PositiveForAmphetamines" ShowInColumn="Positive for Amphetamines" SummaryType="Sum" ValueDisplayFormat="N" />
                          <dx:ASPxSummaryItem DisplayFormat="N0" FieldName="RefusalResultsAdulterated" ShowInColumn="Adulterated" SummaryType="Sum" ValueDisplayFormat="N" />
                          <dx:ASPxSummaryItem DisplayFormat="N0" FieldName="RefusalResultsSustituted" ShowInColumn="Substituted" SummaryType="Sum" ValueDisplayFormat="N" />
                          <dx:ASPxSummaryItem DisplayFormat="N0" FieldName="RefusalResultsShyBladderNoMedExplaination" ShowInColumn="Shy Bladder with No Medical Explanation" SummaryType="Sum" ValueDisplayFormat="N" />
                          <dx:ASPxSummaryItem DisplayFormat="N0" FieldName="RefusalResultsOther" ShowInColumn="Other Refusals to Submit to Testing" SummaryType="Sum" ValueDisplayFormat="N" />
                          <dx:ASPxSummaryItem DisplayFormat="N0" FieldName="CancelledResults" ShowInColumn="Cancelled Results" SummaryType="Sum" ValueDisplayFormat="N" />
                      </TotalSummary>
                      <Columns>
                          <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0">
                          </dx:GridViewCommandColumn>
                          <dx:GridViewDataTextColumn FieldName="TotalNoOfTestResults" Width="7.5%" Caption="Total Number of Test Results [Should equal the sum of Columns 2, 3, 9, 10, 11, and 12]" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Wrap="True"  VisibleIndex="2" ToolTip="This column requires a count of the total number of test results in each testing category during the entire reporting year. Count the number of test results as the number of testing events resulting in negative, positive, and refusal results. Do not count cancelled tests and blind specimens in this total.  [Example: A company that conducted fifty pre-employment tests would enter “50” on the PreEmployment row. If it conducted one hundred random tests, “100’ would be entered on the Random row. If that company did no post-accident, reasonable suspicion, reasonable cause, return-to-duty, or follow-up tests, those categories will be left blank or zeros entered.]">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True"></HeaderStyle>
                                <CellStyle HorizontalAlign="Right" VerticalAlign="Middle">
                                </CellStyle>
                                <FooterCellStyle HorizontalAlign="Right" VerticalAlign="Middle">
                                </FooterCellStyle>
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="VerifiedNegativeResults" Width="7.5%" Caption="Verified Negative results" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Wrap="True" VisibleIndex="3" ToolTip="This column requires a count of the number of tests in each testing category that the Medical Review Officer (MRO) reported as negative. Do not count a negative-dilute result if, subsequently, the employee underwent a second collection; the second test is the test of record.  [Example: If forty-seven of the company’s fifty pre-employment tests were reported negative, “47” would be entered in Column 2 on the Pre-Employment row. If ninety of the company’s one hundred random test results were reported negative, “90” would be entered in Column 2 on the Random row. Because the company did no other testing, those other categories would be left blank or zeros entered.]">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True"></HeaderStyle>
                                <CellStyle HorizontalAlign="Right" VerticalAlign="Middle">
                                </CellStyle>
                                <FooterCellStyle HorizontalAlign="Right" VerticalAlign="Middle">
                                </FooterCellStyle>
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="VerifiedPostiveMoreThanOneDrug" Width="7.5%" Caption="Verified Positivie Results ~ For One or More Drugs" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Wrap="True"  VisibleIndex="4" ToolTip="This column requires a count of the number of tests in each testing category that the MRO reported as positive for one or more drugs. When the MRO reports a test positive for two drugs, it would count as one positive test.  [Example: If one of the fifty pre-employment tests was positive for two drugs, “1” would be entered in Column 3 on the Pre-Employment row. If four of the company’s one hundred random test results were reported positive (three for one drug and one for two drugs), “4” would be entered in Column 3 on the Random row.]">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True"></HeaderStyle>
                                <CellStyle HorizontalAlign="Right" VerticalAlign="Middle">
                                </CellStyle>
                                <FooterCellStyle HorizontalAlign="Right" VerticalAlign="Middle">
                                </FooterCellStyle>
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="PositiveForMarijuana" Width="7.5%" Caption="Positive For Marijuana" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Wrap="True"  VisibleIndex="5" ToolTip="Columns 4 - 8 require entry of the by-drug data for which specimens were reported positive by the MRO.  An MRO may report that a specimen is positive for more than one drug. When that happens, to use the company example above (i.e., one random test was positive for both PCP and opiates), the positive results should be recorded in the appropriate columns – PCP and opiates in this case. There is no expectation for Columns 4 through 8 numbers to add up to the numbers in Column 3 when you report multiple positives  [Example: The pre-employment positive test reported by the MRO was positive for marijuana, “1” would be entered in Column 4 on the Pre-Employment row. If three of the four positive results for random testing were reported by the MRO to be positive for marijuana, “3” would be entered in Column 4 on the Random row. If one of the four positive results for random testing was reported positive for both PCP and opiates, “1” would be entered in Column 6 on the Random row and “1” would be entered in Column 7 of the Random row.]">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True"></HeaderStyle>
                                <CellStyle HorizontalAlign="Right" VerticalAlign="Middle">
                                </CellStyle>
                                <FooterCellStyle HorizontalAlign="Right" VerticalAlign="Middle">
                                </FooterCellStyle>
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="PositiveForCocaine" Width="7.5%" Caption="Positive for Cocaine" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Wrap="True"  VisibleIndex="6" ToolTip="Columns 4 - 8 require entry of the by-drug data for which specimens were reported positive by the MRO.  An MRO may report that a specimen is positive for more than one drug. When that happens, to use the company example above (i.e., one random test was positive for both PCP and opiates), the positive results should be recorded in the appropriate columns – PCP and opiates in this case. There is no expectation for Columns 4 through 8 numbers to add up to the numbers in Column 3 when you report multiple positives  [Example: The pre-employment positive test reported by the MRO was positive for marijuana, “1” would be entered in Column 4 on the Pre-Employment row. If three of the four positive results for random testing were reported by the MRO to be positive for marijuana, “3” would be entered in Column 4 on the Random row. If one of the four positive results for random testing was reported positive for both PCP and opiates, “1” would be entered in Column 6 on the Random row and “1” would be entered in Column 7 of the Random row.]">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True"></HeaderStyle>
                                <CellStyle HorizontalAlign="Right" VerticalAlign="Middle">
                                </CellStyle>
                                <FooterCellStyle HorizontalAlign="Right" VerticalAlign="Middle">
                                </FooterCellStyle>
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="PositiveForPCP" Width="7.5%" Caption="Positivie for PCP" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Wrap="True"  VisibleIndex="7" ToolTip="Columns 4 - 8 require entry of the by-drug data for which specimens were reported positive by the MRO.  An MRO may report that a specimen is positive for more than one drug. When that happens, to use the company example above (i.e., one random test was positive for both PCP and opiates), the positive results should be recorded in the appropriate columns – PCP and opiates in this case. There is no expectation for Columns 4 through 8 numbers to add up to the numbers in Column 3 when you report multiple positives  [Example: The pre-employment positive test reported by the MRO was positive for marijuana, “1” would be entered in Column 4 on the Pre-Employment row. If three of the four positive results for random testing were reported by the MRO to be positive for marijuana, “3” would be entered in Column 4 on the Random row. If one of the four positive results for random testing was reported positive for both PCP and opiates, “1” would be entered in Column 6 on the Random row and “1” would be entered in Column 7 of the Random row.]">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True"></HeaderStyle>
                                <CellStyle HorizontalAlign="Right" VerticalAlign="Middle">
                                </CellStyle>
                                <FooterCellStyle HorizontalAlign="Right" VerticalAlign="Middle">
                                </FooterCellStyle>
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="PositiveForOpiates" Width="7.5%" Caption="Positive for Opiates" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Wrap="True"  VisibleIndex="8" ToolTip="Columns 4 - 8 require entry of the by-drug data for which specimens were reported positive by the MRO.  An MRO may report that a specimen is positive for more than one drug. When that happens, to use the company example above (i.e., one random test was positive for both PCP and opiates), the positive results should be recorded in the appropriate columns – PCP and opiates in this case. There is no expectation for Columns 4 through 8 numbers to add up to the numbers in Column 3 when you report multiple positives  [Example: The pre-employment positive test reported by the MRO was positive for marijuana, “1” would be entered in Column 4 on the Pre-Employment row. If three of the four positive results for random testing were reported by the MRO to be positive for marijuana, “3” would be entered in Column 4 on the Random row. If one of the four positive results for random testing was reported positive for both PCP and opiates, “1” would be entered in Column 6 on the Random row and “1” would be entered in Column 7 of the Random row.]">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True"></HeaderStyle>
                                <CellStyle HorizontalAlign="Right" VerticalAlign="Middle">
                                </CellStyle>
                                <FooterCellStyle HorizontalAlign="Right" VerticalAlign="Middle">
                                </FooterCellStyle>
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="PositiveForAmphetamines" Width="7.5%" Caption="Positive for Amphetamines" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Wrap="True"  VisibleIndex="9" ToolTip="Columns 4 - 8 require entry of the by-drug data for which specimens were reported positive by the MRO.  An MRO may report that a specimen is positive for more than one drug. When that happens, to use the company example above (i.e., one random test was positive for both PCP and opiates), the positive results should be recorded in the appropriate columns – PCP and opiates in this case. There is no expectation for Columns 4 through 8 numbers to add up to the numbers in Column 3 when you report multiple positives  [Example: The pre-employment positive test reported by the MRO was positive for marijuana, “1” would be entered in Column 4 on the Pre-Employment row. If three of the four positive results for random testing were reported by the MRO to be positive for marijuana, “3” would be entered in Column 4 on the Random row. If one of the four positive results for random testing was reported positive for both PCP and opiates, “1” would be entered in Column 6 on the Random row and “1” would be entered in Column 7 of the Random row.]">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True"></HeaderStyle>
                                <CellStyle HorizontalAlign="Right" VerticalAlign="Middle">
                                </CellStyle>
                                <FooterCellStyle HorizontalAlign="Right" VerticalAlign="Middle">
                                </FooterCellStyle>
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="RefusalResultsAdulterated" Width="7.5%" Caption="Adulterated" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Wrap="True"  VisibleIndex="10" ToolTip="This column requires the count of the number of tests reported by the MRO as refusals because the specimens were adulterated. [Example: If one of the fifty pre-employment tests was adulterated, “1” would be entered in Column 9 of the Pre-Employment row.]">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True"></HeaderStyle>
                                <CellStyle HorizontalAlign="Right" VerticalAlign="Middle">
                                </CellStyle>
                                <FooterCellStyle HorizontalAlign="Right" VerticalAlign="Middle">
                                </FooterCellStyle>
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="RefusalResultsSustituted" Width="7.5%" Caption="Substituted" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Wrap="True"  VisibleIndex="11" ToolTip="This column requires the count of the number of tests reported by the MRO as refusals because the specimens were substituted.  6  [Example: If one of the 100 random tests was substituted, “1” would be entered in Column 10 of the Random row.]">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True"></HeaderStyle>
                                <CellStyle HorizontalAlign="Right" VerticalAlign="Middle">
                                </CellStyle>
                                <FooterCellStyle HorizontalAlign="Right" VerticalAlign="Middle">
                                </FooterCellStyle>
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="RefusalResultsShyBladderNoMedExplaination" Width="7.5%" Caption="Shy Bladder with No Medical Explanation" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Wrap="True"  VisibleIndex="12" ToolTip="This column requires the count of the number of tests reported by the MRO as being a refusal because there was no legitimate medical reason for an insufficient amount of urine.  [Example: If one of the 100 random tests was a refusal because of shy bladder, “1” would be entered in Column 11 of the Random row.]">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True"></HeaderStyle>
                                <CellStyle HorizontalAlign="Right" VerticalAlign="Middle">
                                </CellStyle>
                                <FooterCellStyle HorizontalAlign="Right" VerticalAlign="Middle">
                                </FooterCellStyle>
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="RefusalResultsOther" Width="7.5%" Caption="Other Refusals to Submit to Testing" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Wrap="True"  VisibleIndex="13" ToolTip="This column requires the count of refusals other than those already entered in Columns 9 through 11.  [Example: If the company entered “100” as the number of random specimens collected, however it had five employees who refused to be tested without submitting specimens: two did not show up at the collection site as directed; one refused to empty his pockets at the collection site; and two left the collection site rather than submit to a required directly observed collection. Because of these five refusal events, “5” would be entered in Column 11 of the Random row.]">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True"></HeaderStyle>
                                <CellStyle HorizontalAlign="Right" VerticalAlign="Middle">
                                </CellStyle>
                                <FooterCellStyle HorizontalAlign="Right" VerticalAlign="Middle">
                                </FooterCellStyle>
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="CancelledResults" Width="25px" Caption="Cancelled Results" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Wrap="True"  VisibleIndex="14" ToolTip="This column requires a count of the number of tests in each testing category that the MRO reported as cancelled. You must not count any cancelled tests in Column 1 or in any other column. For instance, you must not count a positive result (in Column 3) if it had ultimately been cancelled for any reason (e.g., specimen was initially reported positive, but the split failed to reconfirm).    [Example: If a pre-employment test was reported cancelled, “1” would be entered in Column 13 on the Pre-Employment row. If three of the company’s random test results were reported cancelled, “3” would be entered in Column 13 on the Random row.]">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True"></HeaderStyle>
                                <CellStyle HorizontalAlign="Right" VerticalAlign="Middle">
                                </CellStyle>
                                <FooterCellStyle HorizontalAlign="Right" VerticalAlign="Middle">
                                </FooterCellStyle>
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataComboBoxColumn Caption="Type of Test" FieldName="TypeOfTest" VisibleIndex="1" Width="10%" ReadOnly="True">
                              <PropertiesComboBox DataSourceID="dsProjectRequestTypeList" TextField="Name" ValueField="ID">
                                  <DropDownButton Visible="False">
                                  </DropDownButton>
                              </PropertiesComboBox>
                          </dx:GridViewDataComboBoxColumn>
                      </Columns>
                      <SettingsPager Visible="False">
                      </SettingsPager>
                      <Settings ShowFooter="True" />
                      <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
                    </dx:ASPxGridView>     
            </asp:TableCell>
       </asp:TableRow>
  </asp:Table>

   <%--IV. Drug Testing Data --%>
   <asp:Table runat="server" Width="100%">
       <asp:TableRow>
           <asp:TableCell>
                   <dx:ASPxLabel ID="ASPxLabel4" runat="server" Width="100%" Text="IV. Alcohol Testing Data:  " Font-Bold="true"></dx:ASPxLabel>
           </asp:TableCell>
       </asp:TableRow>

       <asp:TableRow>
           <asp:TableCell>
                   <dx:ASPxGridView ID="gvAlcoholTestingData" runat="server" DataSourceID="dsDOTDrugandAlcoholMISAlcoholTestData" AutoGenerateColumns="False" Width="90%" KeyFieldName="TypeOfTest">
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="Total" FieldName="TypeOfTest" ShowInColumn="Type of Test" SummaryType="Sum" />
                            <dx:ASPxSummaryItem FieldName="TotalNoOfTestResults" ShowInColumn="Total Number of Screening Test Results" SummaryType="Sum" DisplayFormat="N0" ValueDisplayFormat="N" />
                            <dx:ASPxSummaryItem FieldName="ResultsBelow02" ShowInColumn="Results Below02" SummaryType="Sum" DisplayFormat="N0" ValueDisplayFormat="N" />
                            <dx:ASPxSummaryItem FieldName="Results02orGreater" ShowInColumn="Results02or Greater" SummaryType="Sum" DisplayFormat="N0" ValueDisplayFormat="N" />
                            <dx:ASPxSummaryItem FieldName="NoOfConfirmationTests" ShowInColumn="No Of Confirmation Tests" SummaryType="Sum" DisplayFormat="N0" ValueDisplayFormat="N" />
                            <dx:ASPxSummaryItem FieldName="ConfirmationTests02thru039" ShowInColumn="Confirmation Tests02thru039" SummaryType="Sum" DisplayFormat="N0" ValueDisplayFormat="N" />
                            <dx:ASPxSummaryItem FieldName="ConfirmationTests04orGreater" ShowInColumn="Confirmation Tests04or Greater" SummaryType="Sum" DisplayFormat="N0" ValueDisplayFormat="N" />
                            <dx:ASPxSummaryItem FieldName="RefusalResultsShyLungNoMedExplaination" ShowInColumn="Refusal Results Shy Lung No Med Explaination" SummaryType="Sum" DisplayFormat="N0" ValueDisplayFormat="N" />
                            <dx:ASPxSummaryItem FieldName="RefusalResultsOther" ShowInColumn="Refusal Results Other" SummaryType="Sum" DisplayFormat="N0" ValueDisplayFormat="N" />
                            <dx:ASPxSummaryItem FieldName="CancelledResults" ShowInColumn="Cancelled Results" SummaryType="Sum" DisplayFormat="N0" ValueDisplayFormat="N" />
                        </TotalSummary>
                      <Columns>
                          <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0">
                          </dx:GridViewCommandColumn>
                          <dx:GridViewDataTextColumn FieldName="TotalNoOfTestResults" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Wrap="True"  VisibleIndex="2" Caption="Total Number of Screening Test Results">
<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True"></HeaderStyle>
                              <CellStyle HorizontalAlign="Right" VerticalAlign="Middle">
                              </CellStyle>
                              <FooterCellStyle HorizontalAlign="Right" VerticalAlign="Middle">
                              </FooterCellStyle>
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="ResultsBelow02" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Wrap="True" VisibleIndex="3">
                              <PropertiesTextEdit DisplayFormatString="N">
                              </PropertiesTextEdit>
<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True"></HeaderStyle>
                              <CellStyle HorizontalAlign="Right" VerticalAlign="Middle">
                              </CellStyle>
                              <FooterCellStyle HorizontalAlign="Right" VerticalAlign="Middle">
                              </FooterCellStyle>
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="Results02orGreater" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Wrap="True"  VisibleIndex="4">
                              <PropertiesTextEdit DisplayFormatString="N">
                              </PropertiesTextEdit>
<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True"></HeaderStyle>
                              <CellStyle HorizontalAlign="Right" VerticalAlign="Middle">
                              </CellStyle>
                              <FooterCellStyle HorizontalAlign="Right" VerticalAlign="Middle">
                              </FooterCellStyle>
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="NoOfConfirmationTests" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Wrap="True"  VisibleIndex="5">
                              <PropertiesTextEdit DisplayFormatString="N">
                              </PropertiesTextEdit>
<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True"></HeaderStyle>
                              <CellStyle HorizontalAlign="Right" VerticalAlign="Middle">
                              </CellStyle>
                              <FooterCellStyle HorizontalAlign="Right" VerticalAlign="Middle">
                              </FooterCellStyle>
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="ConfirmationTests02thru039" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Wrap="True"  VisibleIndex="6">
<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True"></HeaderStyle>
                              <CellStyle HorizontalAlign="Right" VerticalAlign="Middle">
                              </CellStyle>
                              <FooterCellStyle HorizontalAlign="Right" VerticalAlign="Middle">
                              </FooterCellStyle>
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="ConfirmationTests04orGreater" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Wrap="True"  VisibleIndex="7">
<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True"></HeaderStyle>
                              <CellStyle HorizontalAlign="Right" VerticalAlign="Middle">
                              </CellStyle>
                              <FooterCellStyle HorizontalAlign="Right" VerticalAlign="Middle">
                              </FooterCellStyle>
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="RefusalResultsShyLungNoMedExplaination" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Wrap="True"  VisibleIndex="8">
<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True"></HeaderStyle>
                              <CellStyle HorizontalAlign="Right" VerticalAlign="Middle">
                              </CellStyle>
                              <FooterCellStyle HorizontalAlign="Right" VerticalAlign="Middle">
                              </FooterCellStyle>
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="RefusalResultsOther" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Wrap="True"  VisibleIndex="9">
<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True"></HeaderStyle>
                              <CellStyle HorizontalAlign="Right" VerticalAlign="Middle">
                              </CellStyle>
                              <FooterCellStyle HorizontalAlign="Right" VerticalAlign="Middle">
                              </FooterCellStyle>
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="CancelledResults" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Wrap="True"  VisibleIndex="10">
<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True"></HeaderStyle>
                              <CellStyle HorizontalAlign="Right" VerticalAlign="Middle">
                              </CellStyle>
                              <FooterCellStyle HorizontalAlign="Right" VerticalAlign="Middle">
                              </FooterCellStyle>
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataComboBoxColumn Caption="Type of Test" FieldName="TypeOfTest" ReadOnly="True" VisibleIndex="1">
                              <PropertiesComboBox DataSourceID="dsProjectRequestTypeList" TextField="Name" ValueField="ID">
                              </PropertiesComboBox>
                          </dx:GridViewDataComboBoxColumn>
                      </Columns>
                        <SettingsPager Visible="False">
                        </SettingsPager>
                      <Settings ShowFooter="True" />
                      <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
                    </dx:ASPxGridView>                      
           </asp:TableCell>
       </asp:TableRow>
    </asp:Table>
 
         
    </div>


    <asp:SqlDataSource ID="dsReportYears" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="OHSN_Web_GetReportYearsForDOTDrugAndAlcoholMIS_Select" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="EmployerID" SessionField="WorkingEmployerID" Type="Int64" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dsDOTAgencyList" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="OHSN_Web_GetReportTypesForDOTDrugAndAlcoholMIS_Select" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="EmployerID" SessionField="WorkingEmployerID" Type="Int64" />
            <asp:ControlParameter ControlID="cbxCalendarYear" Name="ReportYear" PropertyName="Text" Type="Int64" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dsDOTDrugandAlcoholMIS" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="OHSN_Web_DOTDrugAndAlcoholMIS_Select" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="EmployerID" SessionField="WorkingEmployerID" Type="Int64" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dsDOTDrugandAlcoholMISDrugTestData" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="OHSN_Web_DOTDrugAndAlcoholMISDrugTestingData_Select" SelectCommandType="StoredProcedure" UpdateCommand="OHSN_Web_DOTDrugAndAlcoholMISDrugTestingData_Update" UpdateCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="DOTReportID" SessionField="DOTReportID" Type="Int64" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="ReportID"   DbType="Int64" />
            <asp:Parameter Name="TypeOfTestTID"   DbType="Int64" />
            <asp:Parameter Name="TotalNoOfTestResults"   DbType="String" />
            <asp:Parameter Name="VerifiedNegativeResults"   DbType="String" />
            <asp:Parameter Name="VerifiedPostiveMoreThanOneDrug"   DbType="String" />
            <asp:Parameter Name="PositiveForMarijuana"   DbType="String" />
            <asp:Parameter Name="PositiveForCocaine"   DbType="String" />
            <asp:Parameter Name="PositiveForPCP"   DbType="String" />
            <asp:Parameter Name="PositiveForOpiates"   DbType="String" />
            <asp:Parameter Name="PositiveForAmphetamines"   DbType="String" />
            <asp:Parameter Name="RefusalResultsAdulterated"   DbType="String" />
            <asp:Parameter Name="RefusalResultsSustituted"   DbType="String" />
            <asp:Parameter Name="RefusalResultsShyBladderNoMedExplaination"   DbType="String" />
            <asp:Parameter Name="RefusalResultsOther"   DbType="String" />
            <asp:Parameter Name="CancelledResults"   DbType="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dsDOTDrugandAlcoholMISAlcoholTestData" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="OHSN_Web_DOTDrugAndAlcoholMISAlcoholTestingData_Select" SelectCommandType="StoredProcedure" UpdateCommand="OHSN_Web_DOTDrugAndAlcoholMISAlcoholTestingData_Update" UpdateCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="DOTReportID" SessionField="DOTReportID" Type="Int64" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="ReportID"   DbType="Int64" />
            <asp:Parameter Name="TypeOfTestTID"   DbType="Int64" />
            <asp:Parameter Name="TotalNoOfTestResults"   DbType="String" />
            <asp:Parameter Name="ResultsBelow02"   DbType="String" />
            <asp:Parameter Name="Results02orGreater "   DbType="String" />
            <asp:Parameter Name="NoOfConfirmationTests"   DbType="String" />
            <asp:Parameter Name="ConfirmationTests02thru039"   DbType="String" />
            <asp:Parameter Name="ConfirmationTests04orGreater"   DbType="String" />
            <asp:Parameter Name="RefusalResultsShyLungNoMedExplaination"   DbType="String" />
            <asp:Parameter Name="RefusalResultsOther"   DbType="String" />
            <asp:Parameter Name="CancelledResults"   DbType="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dsProjectRequestTypeList" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="ohsn_pm_TypeProjectRequestTypeInfoList_Select" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

    </asp:Content>
