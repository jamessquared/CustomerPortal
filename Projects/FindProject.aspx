<%@ Page Title="" Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeBehind="FindProject.aspx.cs" Inherits="CustomerPortal.Projects.FindProject" %>
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
                            <dx:RibbonButtonItem Name="btnFind" Size="Large" Text="Find">
                                <LargeImage Url="~/Images/General/Find.png">
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
         <asp:TableRow><asp:TableCell><dx:ASPxLabel ID="ASPxLabel22" runat="server" Font-Size="X-Large" Text="Find Project"></dx:ASPxLabel></asp:TableCell></asp:TableRow>
     </asp:Table> 
    <br />
    
    
   <%--Date Range--%>
    <asp:Table runat="server" Width="100">
        <asp:TableRow>
            <asp:TableCell  HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel20" runat="server" Text="From:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell HorizontalAlign="Left"><dx:ASPxDateEdit ID="dedFrom" runat="server"></dx:ASPxDateEdit></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
        <asp:TableRow>
            <asp:TableCell  HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="To:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell HorizontalAlign="Left"><dx:ASPxDateEdit ID="dedTo" runat="server"></dx:ASPxDateEdit></asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <br />
    <%--Grid View--%>
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="dsFindProjects" KeyFieldName="ProjectID">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="ProjectID" ReadOnly="True" Visible="False" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Patient" ReadOnly="True" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Status" ReadOnly="True" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="RequestType" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="Requested" VisibleIndex="5">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="ContactedOn" ReadOnly="True" Visible="False" VisibleIndex="6">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="RequestedBy" ReadOnly="True" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="Scheduled" ReadOnly="True" Visible="False" VisibleIndex="8">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="ResultsReported" ReadOnly="True" Visible="False" VisibleIndex="9">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="Result" VisibleIndex="10">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="Completed" VisibleIndex="11">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="URL" ReadOnly="True" Visible="False" VisibleIndex="12">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataHyperLinkColumn Caption="ID" FieldName="URL" Name="url" VisibleIndex="0">
                <PropertiesHyperLinkEdit TextField="ProjectID">
                </PropertiesHyperLinkEdit>
            </dx:GridViewDataHyperLinkColumn>
        </Columns>
        <Settings ShowFilterRow="True" />
        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
    </dx:ASPxGridView>
    <br />
    <br />


     <%--Data Source--%>
    <asp:SqlDataSource ID="dsFindProjects" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="ohsn_Web_Project_Find" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="FromDate" SessionField="FromDate" DbType="Date" />
                <asp:SessionParameter Name="ToDate" SessionField="ToDate" DbType="Date" />
                <asp:SessionParameter DefaultValue="" Name="EmployerID" SessionField="WorkingEmployerID" Type="Int64" />
            </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
