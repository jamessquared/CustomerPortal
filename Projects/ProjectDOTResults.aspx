<%@ Page Title="" Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeBehind="ProjectDOTResults.aspx.cs" Inherits="CustomerPortal.Projects.ProjectDOTResults" %>

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
         <asp:TableRow><asp:TableCell><dx:ASPxLabel ID="ASPxLabel3" runat="server" Font-Size="X-Large" Text="D.O.T. MIS Results"></dx:ASPxLabel></asp:TableCell></asp:TableRow>
     </asp:Table> 
            <dx:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server" ShowCollapseButton="true" Width="440px" HeaderText="Drug Testing Data">
                <PanelCollection>
                    <dx:PanelContent runat="server">
                            <dx:ASPxCheckBox ID="ASPxCheckBox1" runat="server" CheckState="Unchecked" Text="Test was cancelled?" Font-Size="Small"></dx:ASPxCheckBox>
                           <dx:ASPxCheckBox ID="ASPxCheckBox2" runat="server" CheckState="Unchecked" Text="Blind Specimen collection?" Font-Size="Small"></dx:ASPxCheckBox>
                            <dx:ASPxCheckBox ID="ASPxCheckBox4" runat="server" CheckState="Checked" Text="2nd Collection was performed?" Font-Size="Small"></dx:ASPxCheckBox>
                            <br /> 
                            <br />
                            <asp:CheckBoxList ID="CheckBoxList1" runat="server" >
                                <asp:ListItem>Result tested Negative</asp:ListItem>
                                <asp:ListItem>Result tested positive for Marijuana</asp:ListItem>
                                <asp:ListItem>Result tested positive for Cocaine</asp:ListItem>
                                <asp:ListItem>Result tested positive for PCP</asp:ListItem>
                                <asp:ListItem >Result tested positive for Opiates</asp:ListItem>
                                <asp:ListItem>Result tested positive for Amphetamines</asp:ListItem>
                            </asp:CheckBoxList>
                            <br /> 
                            <br />
                            <dx:ASPxLabel runat="server" Text="Drug Test Refusal"></dx:ASPxLabel>
                            <asp:CheckBoxList ID="CheckBoxList2" runat="server" >
                                <asp:ListItem>Adulterated</asp:ListItem>
                                <asp:ListItem>Sustituted</asp:ListItem>
                                <asp:ListItem>"Shy Bladder" with No Medical Explaination</asp:ListItem>
                                <asp:ListItem>Other Refusal</asp:ListItem>
                            </asp:CheckBoxList>
                         </dx:PanelContent>
                    </PanelCollection>
            </dx:ASPxRoundPanel>
        <br />
        <br />
            <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" ShowCollapseButton="true" Width="440px" HeaderText="Alcohol Testing Data">
                <PanelCollection>
                    <dx:PanelContent runat="server">
                            <dx:ASPxCheckBox ID="ASPxCheckBox3" runat="server" CheckState="Unchecked" Text="Test was cancelled?" Font-Size="Small"></dx:ASPxCheckBox>
                            <br />
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server">

                            <asp:ListItem Selected="True" Value="0">Result &lt; 0.02</asp:ListItem>
                            <asp:ListItem>Result &gt;= 0.02</asp:ListItem>

                        </asp:RadioButtonList>
                           <asp:CheckBoxList ID="CheckBoxList4" runat="server" >
                                <asp:ListItem>"Shy Lung" with No Medical Explaination</asp:ListItem>
                                <asp:ListItem>Other Refusal</asp:ListItem>
                            </asp:CheckBoxList>
                         </dx:PanelContent>
                    </PanelCollection>
            </dx:ASPxRoundPanel>

</asp:Content>
