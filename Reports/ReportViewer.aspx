﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeBehind="ReportViewer.aspx.cs" Inherits="CustomerPortal.Reports.ReportViewer" %>
<%@ Register assembly="DevExpress.XtraReports.v14.2.Web, Version=14.2.12.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraReports.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.XtraReports.v14.2.Web, Version=14.2.12.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraReports.Web.DocumentViewer.Ribbon" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">

    <%-- Toolbar --%>
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
                    <dx:RibbonGroup Text="Print">
                        <Items>
                                <dx:DocumentViewerPrintReportRibbonCommand>
                                </dx:DocumentViewerPrintReportRibbonCommand>
                                <dx:DocumentViewerPrintPageRibbonCommand>
                                </dx:DocumentViewerPrintPageRibbonCommand>                            
                        </Items>
                    </dx:RibbonGroup>
                    <dx:RibbonGroup Text="">
                        <Items>
                                <dx:DocumentViewerFirstPageRibbonCommand>
                                </dx:DocumentViewerFirstPageRibbonCommand>
                                <dx:DocumentViewerPreviousPageRibbonCommand>
                                </dx:DocumentViewerPreviousPageRibbonCommand>
                                <dx:DocumentViewerNextPageRibbonCommand>
                                </dx:DocumentViewerNextPageRibbonCommand>
                                <dx:DocumentViewerLastPageRibbonCommand>
                                </dx:DocumentViewerLastPageRibbonCommand>
                        </Items>
                    </dx:RibbonGroup>
                    <dx:RibbonGroup>
                        <Items>
                                <dx:DocumentViewerSaveToDiskDropDownRibbonCommand>
                                    <Items>
                                        <dx:RibbonPdfFormatCommand>
                                        </dx:RibbonPdfFormatCommand>
                                        <dx:RibbonRtfFormatCommand>
                                        </dx:RibbonRtfFormatCommand>
                                    </Items>
                                </dx:DocumentViewerSaveToDiskDropDownRibbonCommand>
                                <dx:DocumentViewerSaveToWindowDropDownRibbonCommand>
                                    <Items>
                                        <dx:RibbonPdfFormatCommand>
                                        </dx:RibbonPdfFormatCommand>
                                        <dx:RibbonRtfFormatCommand>
                                        </dx:RibbonRtfFormatCommand>
                                    </Items>
                                </dx:DocumentViewerSaveToWindowDropDownRibbonCommand>
                        </Items>
                    </dx:RibbonGroup>
                </Groups>
            </dx:RibbonTab>
        </Tabs>
    </dx:ASPxRibbon>


    <dx:ASPxDocumentViewer ID="DocumentViewer" runat="server" ToolbarMode="ExternalRibbon" AssociatedRibbonID="mainToolbar" ClientInstanceName="DocumentViewer">
        <SettingsReportViewer ShouldDisposeReport="False" />
        <SettingsDocumentMap AllowSelectNode="False" EnableAnimation="False" EnableHotTrack="False" />
        <SettingsSplitter DocumentMapCollapsed="True" SidePanePosition="Left" ToolbarCollapsed="True" />
        <SettingsParametersPanelCaption ShowColon="True" />
        <ToolbarItems>
            <dx:ReportToolbarSeparator />
            <dx:ReportToolbarButton ItemKind="PrintReport" />
            <dx:ReportToolbarSeparator />
            <dx:ReportToolbarButton Enabled="False" ItemKind="FirstPage" />
            <dx:ReportToolbarButton Enabled="False" ItemKind="PreviousPage" />
            <dx:ReportToolbarLabel ItemKind="PageLabel" />
            <dx:ReportToolbarComboBox ItemKind="PageNumber" Width="65px">
            </dx:ReportToolbarComboBox>
            <dx:ReportToolbarLabel />
            <dx:ReportToolbarTextBox IsReadOnly="True" ItemKind="PageCount" />
            <dx:ReportToolbarButton ItemKind="NextPage" />
            <dx:ReportToolbarButton ItemKind="LastPage" />
            <dx:ReportToolbarSeparator />
            <dx:ReportToolbarButton ItemKind="SaveToWindow" />
            <dx:ReportToolbarComboBox ItemKind="SaveFormat" Width="70px">
                <Elements>
                    <dx:ListElement Value="pdf" />
                    <dx:ListElement Value="rtf" />
                </Elements>
            </dx:ReportToolbarComboBox>
        </ToolbarItems>
    </dx:ASPxDocumentViewer>
        <br />
    <br />
    <br />
</asp:Content>