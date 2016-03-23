<%@ Page Title="" Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeBehind="DeleteUser.aspx.cs" Inherits="CustomerPortal.Account.DeleteUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
     <asp:Table  runat="server" ID="Table1"  HorizontalAlign="Center">
         <asp:TableRow><asp:TableCell><dx:ASPxLabel ID="ASPxLabel3" runat="server" Font-Size="X-Large" Text="Delete user"></dx:ASPxLabel></asp:TableCell></asp:TableRow>
     </asp:Table> 

        <asp:Table  runat="server" ID="Table3"  HorizontalAlign="Center" Width="100%">
          <asp:TableRow HorizontalAlign="Center">
             <asp:TableCell></asp:TableCell>
             <asp:TableCell><dx:ASPxButton ID="btnOk" runat="server" Text="Ok" OnClick="btnOk_Click"></dx:ASPxButton></asp:TableCell>
             <asp:TableCell></asp:TableCell>
         </asp:TableRow>
     </asp:Table>  
</asp:Content>
