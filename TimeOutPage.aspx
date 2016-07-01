<%@ Page Title="" Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeBehind="TimeOutPage.aspx.cs" Inherits="CustomerPortal.TimeOutPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
     <asp:Table  runat="server" ID="Table1"  HorizontalAlign="Center">
         <asp:TableRow><asp:TableCell><dx:ASPxLabel ID="ASPxLabel3" runat="server" Font-Size="X-Large" Text="Session Expired!"></dx:ASPxLabel></asp:TableCell></asp:TableRow>
         <asp:TableRow><asp:TableCell><dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Your session has expired due to inactivity.  Please log back into the Custom Portal."></dx:ASPxLabel></asp:TableCell></asp:TableRow>
     </asp:Table> 
    <br />
    <br />
    <asp:Table  runat="server" ID="Table2"  HorizontalAlign="Center">
        <asp:TableRow>
                <asp:TableCell></asp:TableCell>
                <asp:TableCell><dx:ASPxButton ID="btnOk" runat="server" OnClick="btnOk_Click" Text="Ok"></dx:ASPxButton></asp:TableCell>
                <asp:TableCell></asp:TableCell>
        </asp:TableRow>

    </asp:Table>
</asp:Content>
