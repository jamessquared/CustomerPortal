<%@ Page Title="" Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeBehind="DOTDrugandAlcoholMISManagement.aspx.cs" Inherits="CustomerPortal.Reports.DOTDrugandAlcoholMISManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">

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
                            <dx:RibbonButtonItem Name="btnAdd" Size="Large" Text="New">
                                <LargeImage Url="~/Images/General/Add.png">
                                </LargeImage>
                            </dx:RibbonButtonItem>
                            <dx:RibbonButtonItem Name="btnEdit" Size="Large" Text="Edit" Visible="false">
                                <LargeImage Url="~/Images/General/Edit.png">
                                </LargeImage>
                            </dx:RibbonButtonItem>
                        </Items>
                    </dx:RibbonGroup>
                </Groups>
            </dx:RibbonTab>
        </Tabs>
    </dx:ASPxRibbon>

     <%-- Form Title --%>
     <asp:Table  runat="server" ID="Table1"  HorizontalAlign="Center" Width="100%">
         <asp:TableRow HorizontalAlign="Center"><asp:TableCell><dx:ASPxLabel ID="ASPxLabel3" runat="server" Font-Size="X-Large" Text="D.O.T. Drug & Alcohol Testing MIS Data Report Management"></dx:ASPxLabel></asp:TableCell></asp:TableRow>
     </asp:Table> 
    <br />
    <br />
     <asp:Table  runat="server" ID="tblMISReports"  Width="100%"  HorizontalAlign="Center">
         <asp:TableRow ><asp:TableCell></asp:TableCell></asp:TableRow>
         <asp:TableRow><asp:TableCell></asp:TableCell></asp:TableRow>
        <%--Report Grid--%>
             <asp:TableRow HorizontalAlign="Center" Width="100%">
                    <asp:TableCell>

                    </asp:TableCell>
         </asp:TableRow>
         <asp:TableRow><asp:TableCell></asp:TableCell></asp:TableRow>
     </asp:Table>  
    <br />
                                
                             <dx:ASPxGridView ID="gvDOTDrugandAlcoholMISReport" runat="server" AutoGenerateColumns="False" DataSourceID="dsDOTReportList"              KeyFieldName="ID"             Width="95%" EnableCallBacks="False" OnSelectionChanged="gvDOTDrugandAlcoholMISReport_SelectionChanged" ClientInstanceName="gvClientDOTDrugandAlcoholMISReport" >
                                <Columns>
                                    <dx:GridViewCommandColumn VisibleIndex="0" SelectAllCheckboxMode="Page" ShowSelectCheckbox="True">
                                    </dx:GridViewCommandColumn>
                                    <dx:GridViewDataTextColumn Caption="Report Year" FieldName="ReportYear" Name="reportYear" VisibleIndex="1">
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Reporting To" FieldName="ReportFor" Name="reportingTo" VisibleIndex="2">
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="ReportForTID" Name="reportingToTID" ReadOnly="True" Visible="False" VisibleIndex="3">
                                        <EditFormSettings Visible="False" />
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Certifying Official" FieldName="CertifyingOfficial" Name="certifyingOfficial" VisibleIndex="4">
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Certifying Official Telephone" FieldName="CertifyingOfficialTelephone" Name="certifyingOfficialTelephone" VisibleIndex="5">
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" Visible="False" VisibleIndex="6">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                    <SettingsBehavior AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" ProcessFocusedRowChangedOnServer="True" ProcessSelectionChangedOnServer="True" SelectionStoringMode="PerformanceOptimized" />
                                    <Settings ShowFilterRow="True" />
                                    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                            </dx:ASPxGridView>

    <asp:SqlDataSource ID="dsDOTReportList" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="OHSN_Web_DOTDrugAndAlcoholMISList_Select" SelectCommandType="StoredProcedure" >
        <SelectParameters>
            <asp:SessionParameter Name="EmployerID" SessionField="WorkingEmployerID" Type="Int64" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
