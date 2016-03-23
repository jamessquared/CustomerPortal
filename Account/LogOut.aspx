<%@ Page Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeBehind="LogOut.aspx.cs" Inherits="CustomerPortal.Account.LogOut" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
  <div>
    <br />
     <asp:Table  runat="server" ID="Table1"  HorizontalAlign="Center">
         <asp:TableRow>
             <asp:TableCell><dx:ASPxLabel ID="ASPxLabel3" runat="server" Font-Size="X-Large" Text="Log out"></dx:ASPxLabel></asp:TableCell>
         </asp:TableRow>
     </asp:Table> 
        <br />
        <br />
     <asp:Table  runat="server" ID="Table2"  HorizontalAlign="Left">
         <asp:TableRow>
             <asp:TableCell></asp:TableCell>
             <asp:TableCell><dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Do you wish to log out of the Customer Portal?"></dx:ASPxLabel></asp:TableCell>
         </asp:TableRow>
         <asp:TableRow>
             <asp:TableCell></asp:TableCell>
             <asp:TableCell><dx:ASPxButton ID="ASPxButton1" runat="server" OnClick="ASPxButton1_Click" Text="Yes" ></dx:ASPxButton></asp:TableCell>
             <asp:TableCell><dx:ASPxButton ID="ASPxButton2" runat="server" OnClick="ASPxButton2_Click" Text="No" ></dx:ASPxButton></asp:TableCell>
             <asp:TableCell></asp:TableCell>
         </asp:TableRow>
     </asp:Table> 

        <br />    
    </div>

</asp:Content>
