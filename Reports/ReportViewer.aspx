<%@ Page Title="" Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeBehind="ReportViewer.aspx.cs" Inherits="CustomerPortal.Reports.ReportViewer" %>

<%@ Register assembly="DevExpress.XtraReports.v14.2.Web, Version=14.2.12.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraReports.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.XtraReports.v14.2.Web, Version=14.2.12.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraReports.Web.DocumentViewer.Ribbon" tagprefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">


    <%-- Toolbar --%>
   <div runat="server" style="overflow:auto; max-height:700px" >
        <dx:ASPxDocumentViewer ID="rptDocViewer" runat="server" ClientInstanceName="clientDocViewer">
            <SettingsReportViewer EnableReportMargins="True" />
            <SettingsDocumentMap AllowSelectNode="False" EnableAnimation="False" EnableHotTrack="False" />
            <SettingsSplitter SidePanePosition="Left" />
            <SettingsToolbar>
                <CaptionSettings HorizontalAlign="Center" Position="Bottom" VerticalAlign="Middle" />
            </SettingsToolbar>
            <SettingsParametersPanelCaption HorizontalAlign="Center" Position="Left" ShowColon="True" VerticalAlign="Middle" />
            <ToolbarItems>
                <dx:ReportToolbarButton ImageUrl="~/Images/Reports/Back Small.png" Name="btnBack" ToolTip="Returns to the main screen." />
                <dx:ReportToolbarButton ItemKind="PrintReport" ToolTip="Prints the current report." />
                <dx:ReportToolbarSeparator />
                <dx:ReportToolbarButton Enabled="False" ItemKind="FirstPage" ToolTip="Goes to the first page of the report." />
                <dx:ReportToolbarButton Enabled="False" ItemKind="PreviousPage" ToolTip="Goes back 1 page in the report." />
                <dx:ReportToolbarLabel ItemKind="PageLabel" />
                <dx:ReportToolbarComboBox ItemKind="PageNumber" Width="65px">
                </dx:ReportToolbarComboBox>
                <dx:ReportToolbarLabel ItemKind="OfLabel" />
                <dx:ReportToolbarTextBox IsReadOnly="True" ItemKind="PageCount" />
                <dx:ReportToolbarButton ItemKind="NextPage" ToolTip="Goes to the next page of the report." />
                <dx:ReportToolbarButton ItemKind="LastPage" ToolTip="Goes to the last page of the report." />
                <dx:ReportToolbarSeparator />
                <dx:ReportToolbarButton ItemKind="SaveToDisk" ToolTip="Allows the report to be saved in PDF format on the local computer." />
            </ToolbarItems>
            <ClientSideEvents ToolbarItemClick="function(s, e) {
                   if(e.item.name == &quot;btnBack&quot;)
                   {
	                document.location.href=&quot;../Default.aspx&quot;;
                   }
                }" />
        </dx:ASPxDocumentViewer>
    </div>
</asp:Content>
