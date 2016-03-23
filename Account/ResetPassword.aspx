<%@ Page Title="" Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs"     Inherits                 ="CustomerPortal.Account.ResetPassword" %>

<asp:Content ID="Content" ContentPlaceHolderID="Content" runat="server">
    <div>
        <br />
         <asp:Table  runat="server" ID="Table1"  HorizontalAlign="Center">
             <asp:TableRow HorizontalAlign="Center">
                 <asp:TableCell><dx:ASPxLabel ID="ASPxLabel3" runat="server" Font-Size="X-Large" Text="Lost Password"></dx:ASPxLabel></asp:TableCell>
             </asp:TableRow>
             <asp:TableRow></asp:TableRow>
                 <asp:TableRow></asp:TableRow>
                 <asp:TableRow></asp:TableRow>
             <asp:TableRow>
                 <asp:TableCell><dx:ASPxLabel ID="ASPxLabel2" runat="server" Font-Size="Medium" Text="If you have lost your password and are unable to log on.&nbsp; Enter your email address below and email containing instructions on how to reset your password will be sent."></dx:ASPxLabel></asp:TableCell>
             </asp:TableRow>
         </asp:Table> 

        <br />
        <br />

     <asp:Table  runat="server" ID="Table2" Width="100%"  >
             <asp:TableRow>
                 <asp:TableCell><dx:ASPxLabel ID="lblNoAccountFound" runat="server" Font-Size="Medium" ForeColor="Red" Text="No accounts were found for the specified email address." Visible="false"></dx:ASPxLabel></asp:TableCell>
             </asp:TableRow>
             <asp:TableRow></asp:TableRow>
                 <asp:TableRow></asp:TableRow>
                 <asp:TableRow></asp:TableRow>
             <asp:TableRow>
                 <asp:TableCell><dx:ASPxTextBox ID="txtEmail" runat="server" Caption="Emal:" Width="50%"></dx:ASPxTextBox></asp:TableCell>
             </asp:TableRow>
         </asp:Table>

        
        <br />
        <br />

         <asp:Table  runat="server" ID="Table3"  HorizontalAlign="Center">
             <asp:TableRow>
                 <asp:TableCell></asp:TableCell>
                 <asp:TableCell><dx:ASPxButton ID="ASPxButton2" runat="server"  Text="Get Password" HorizontalAlign="Center" OnClick="btnPasswordemail_Click"></dx:ASPxButton></asp:TableCell>
                 <asp:TableCell></asp:TableCell>
             </asp:TableRow>
         </asp:Table> 

    
        <asp:SqlDataSource ID="dsGetPassword" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="OHSN_Web_GetLostUserPassword" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtEmail" Name="emailAddress" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

