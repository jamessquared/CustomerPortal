<%@ Page Title="" Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeBehind="PasswordSuccessfullyChanged.aspx.cs" Inherits="CustomerPortal.Account.PasswordSuccessfullyChanged" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
     <asp:Table  runat="server" ID="Table1"  HorizontalAlign="Center">
         <asp:TableRow><asp:TableCell><dx:ASPxLabel ID="ASPxLabel3" runat="server" Font-Size="X-Large" Text="Success!"></dx:ASPxLabel></asp:TableCell></asp:TableRow>
         <asp:TableRow><asp:TableCell><dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Your password has been successfully changed!"></dx:ASPxLabel></asp:TableCell></asp:TableRow>
     </asp:Table> 
    <br />
    <br />
    <asp:Table  runat="server" ID="Table2"  HorizontalAlign="Center">
        <asp:TableRow>
                <asp:TableCell></asp:TableCell>
                <asp:TableCell><dx:ASPxButton ID="btnOkPasswordSuccessfullyChanged" runat="server" OnClick="btnOkPasswordSuccessfullyChanged_Click" Text="Ok"></dx:ASPxButton></asp:TableCell>
                <asp:TableCell></asp:TableCell>
        </asp:TableRow>

    </asp:Table>
    
    <br />
    <br />
    
    <br />
</asp:Content>
