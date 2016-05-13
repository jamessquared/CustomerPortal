<%@ Page Title="" Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeBehind="NewCompanyContact.aspx.cs" Inherits="CustomerPortal.Account.NewCompanyContact" %>
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
         <asp:TableRow><asp:TableCell><dx:ASPxLabel ID="ASPxLabel3" runat="server" Font-Size="X-Large" Text="New Contact"></dx:ASPxLabel></asp:TableCell></asp:TableRow>
     </asp:Table> 
  <br />
  
    <%--Contact Table--%>
    <asp:Table  runat="server" ID="tblConact"  Width="100%">
        <%-- Name --%>
        <asp:TableRow >
            <%-- Left Margin --%>
            <asp:TableCell></asp:TableCell>
            <%-- Left Column --%>
            <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Last Name:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxTextBox ID="txtbxLastName" runat="server" Width="75%"></dx:ASPxTextBox></asp:TableCell>
             <%-- Center Margin --%>
             <asp:TableCell></asp:TableCell>
             <%-- Right Column --%>
             <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="First Name:"></dx:ASPxLabel></asp:TableCell>
             <asp:TableCell><dx:ASPxTextBox ID="txtbxFirstName" runat="server" Width="75%"></dx:ASPxTextBox></asp:TableCell>
            <%-- Right Margin --%>                
            <asp:TableCell></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
        <%-- Work Phone --%>
        <asp:TableRow>
            <%-- Left Margin --%>
            <asp:TableCell></asp:TableCell>
            <%-- Left Column --%>
            <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Work Phone:"  ></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxTextBox ID="txtbxWorkPhone" runat="server" Width="170px"  ><MaskSettings Mask="(999) 000-0000" IncludeLiterals="None" /></dx:ASPxTextBox></asp:TableCell>
            <%-- Center Margin --%>
            <asp:TableCell></asp:TableCell>
            <%-- Right Column --%>
             <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="Ext:"  ></dx:ASPxLabel></asp:TableCell>
             <asp:TableCell><dx:ASPxTextBox ID="txtbxExt" runat="server" Width="170px"  ></dx:ASPxTextBox></asp:TableCell>
            <%-- Right Margin --%>
            <asp:TableCell></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
        <%-- Fax/Cell Phone --%>
        <asp:TableRow >
            <%-- Left Margin --%>
            <asp:TableCell></asp:TableCell>
            <%-- Left Column --%>
             <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel12" runat="server" Text="Fax:" ></dx:ASPxLabel></asp:TableCell>
             <asp:TableCell><dx:ASPxTextBox ID="txtbxFax" runat="server" Width="170px"  ><MaskSettings Mask="(999) 000-0000" IncludeLiterals="None" /></dx:ASPxTextBox></asp:TableCell>
             <%-- Center Margin --%>
            <asp:TableCell></asp:TableCell>
             <%-- Right Column --%>
               <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel13" runat="server" Text="Cell:"  ></dx:ASPxLabel></asp:TableCell>
                <asp:TableCell><dx:ASPxTextBox ID="txtbxCell" runat="server" Width="170px" ><MaskSettings Mask="(999) 000-0000" IncludeLiterals="None" /></dx:ASPxTextBox></asp:TableCell>
            <%-- Right Margin --%>                
                <asp:TableCell></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
        <%-- Email --%>
        <asp:TableRow >
            <%-- Left Margin --%>
            <asp:TableCell></asp:TableCell>
            <%-- Left Column --%>
            <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Email:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxTextBox ID="txtbxEmail" runat="server" Width="170px" ></dx:ASPxTextBox></asp:TableCell>
             <%-- Center Margin --%>
            <asp:TableCell></asp:TableCell>
             <%-- Right Column --%>
             <asp:TableCell></asp:TableCell>
             <asp:TableCell></asp:TableCell>
             <%-- Right Margin --%>           
             <asp:TableCell></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
        <%-- Job --%>
        <asp:TableRow >
            <%-- Left Margin --%>
            <asp:TableCell></asp:TableCell>
            <%-- Left Column --%>
            <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel16" runat="server" Text="Job Category:"></dx:ASPxLabel></asp:TableCell>
            <asp:TableCell><dx:ASPxComboBox ID="cbxJobCategory" runat="server" ValueType="System.String" DataSourceID="dsJobCategory" TextField="Name" ValueField="ID" ></dx:ASPxComboBox></asp:TableCell>
             <%-- Center Margin --%>
             <asp:TableCell></asp:TableCell>
             <%-- Right Column --%>
             <asp:TableCell HorizontalAlign="Right"><dx:ASPxLabel ID="ASPxLabel17" runat="server" Text="Job Title:"></dx:ASPxLabel></asp:TableCell>
             <asp:TableCell><dx:ASPxTextBox ID="txtbxJobTitle" runat="server" Width="170px" ></dx:ASPxTextBox></asp:TableCell>
            <%-- Right Margin --%>                
            <asp:TableCell></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow><asp:TableCell> &nbsp;&nbsp;&nbsp;</asp:TableCell></asp:TableRow>
    </asp:Table>  
    <br />
    <br />

    <%-- Data Source --%>
    <asp:SqlDataSource ID="dsContactInfo" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="OHSN_Web_AddUser_GetCompanyContactInfo" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="ContactID" SessionField="WorkingContactID" Type="Int64" />
        </SelectParameters>
    </asp:SqlDataSource>

     <asp:SqlDataSource ID="dsJobCategory" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="ohsn_Web_GetJobCategorList"></asp:SqlDataSource>
    
    </asp:Content>
