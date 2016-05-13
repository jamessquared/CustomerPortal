<%@ Page Title="" Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeBehind="FindProject.aspx.cs" Inherits="CustomerPortal.Projects.FindProject" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
            <%-- Form Date Range --%>
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

        <%-- Left Margin --%>
     <asp:Table  runat="server" ID="Table1"  HorizontalAlign="Center">
         <asp:TableRow><asp:TableCell><dx:ASPxLabel ID="ASPxLabel22" runat="server" Font-Size="X-Large" Text="Find Project"></dx:ASPxLabel></asp:TableCell></asp:TableRow>
     </asp:Table> 
    <br />
    
        <%-- Left Column --%>
        <asp:Table runat="server" id="Table3" Width="100%" >
        <%-- Form Date Range --%>
        <asp:TableRow Width="100%">
            <%-- Left Margin --%>
            <asp:TableCell  Width="10%"></asp:TableCell>
            <%-- Left Column --%>
             <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel20" runat="server" Text="From:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxDateEdit ID="dedFrom" runat="server" AutoPostBack="true"></dx:ASPxDateEdit></asp:TableCell>
            <%-- Center Margin --%>
            <asp:TableCell ></asp:TableCell>
            <asp:TableCell ></asp:TableCell>
            <%-- Right Column --%>
            <asp:TableCell HorizontalAlign="Right"></asp:TableCell>
            <asp:TableCell ></asp:TableCell>
            <%-- Right Margin --%>
            <asp:TableCell Width="10%"></asp:TableCell>
        </asp:TableRow>
        <%-- Spacer Row --%>
        <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
        <%-- To Date Range --%>
        <asp:TableRow Width="100%">
            <%-- Left Margin --%>
            <asp:TableCell  Width="10%"></asp:TableCell>
            <%-- Left Column --%>
            <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="To:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell ><dx:ASPxDateEdit ID="dedTo" runat="server" AutoPostBack="true"></dx:ASPxDateEdit></asp:TableCell>
            <%-- Center Margin --%>
            <asp:TableCell ></asp:TableCell>
            <asp:TableCell ></asp:TableCell>
            <%-- Right Column --%>
            <asp:TableCell HorizontalAlign="Right"></asp:TableCell>
            <asp:TableCell ></asp:TableCell>
            <%-- Right Margin --%>
            <asp:TableCell Width="10%"></asp:TableCell>
        </asp:TableRow>        
    </asp:Table>

        <%-- Center Margin --%>
        <asp:Table runat="server" id="Table2" Width="100%" >
         <asp:TableRow ><asp:TableCell></asp:TableCell><asp:TableCell><dx:ASPxLabel ID="ASPxLabel24" runat="server" Font-Size="Large" Text="Projects"> </dx:ASPxLabel></asp:TableCell></asp:TableRow>
         <asp:TableRow><asp:TableCell></asp:TableCell></asp:TableRow>
        <%-- Project --%>
        <asp:TableRow >
            <asp:TableCell  Width="10%"></asp:TableCell>
            <asp:TableCell>
                     <dx:ASPxGridView ID="gvProject" runat="server" AutoGenerateColumns="False" DataSourceID="dsFindProjects" KeyFieldName="ProjectID">
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="ProjectID" ReadOnly="True" Visible="False" VisibleIndex="1">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Patient" ReadOnly="True" VisibleIndex="2" Caption="Patient Name">
                            <EditCellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                            </EditCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Status" ReadOnly="True" VisibleIndex="3" Caption="Status">
                            <EditCellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                            </EditCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="RequestType" VisibleIndex="4" Caption="Type">
                            <EditCellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                            </EditCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="Requested" VisibleIndex="5" Caption="Requested On">
                            <EditCellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                            </EditCellStyle>
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataDateColumn FieldName="ContactedOn" ReadOnly="True" Visible="False" VisibleIndex="6">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn FieldName="RequestedBy" ReadOnly="True" VisibleIndex="7" Caption="Requested By">
                            <EditCellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                            </EditCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="Scheduled" ReadOnly="True" Visible="False" VisibleIndex="8">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataDateColumn FieldName="ResultsReported" ReadOnly="True" Visible="False" VisibleIndex="9">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn FieldName="Result" VisibleIndex="10" Caption="Results">
                            <EditCellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                            </EditCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="Completed" VisibleIndex="11" Caption="Completed On">
                            <EditCellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                            </EditCellStyle>
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
            </asp:TableCell>
            <asp:TableCell  Width="10%"></asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <br />
    <br />
    
     <%-- Right Column --%>
    <asp:SqlDataSource ID="dsFindProjects" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="ohsn_Web_Project_Find" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="FromDate" SessionField="FromDate" DbType="Date" />
                <asp:SessionParameter Name="ToDate" SessionField="ToDate" DbType="Date" />
                <asp:SessionParameter DefaultValue="" Name="EmployerID" SessionField="WorkingEmployerID" Type="Int64" />
            </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
