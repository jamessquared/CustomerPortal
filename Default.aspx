
<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeBehind="Default.aspx.cs" Inherits="CustomerPortal._Default" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<%@ Register Assembly="DevExpress.XtraReports.v14.2.Web, Version=14.2.12.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>

<%@ MasterType VirtualPath="~/Main.master" %>


<%@ Register Assembly="DevExpress.XtraCharts.v14.2.Web, Version=14.2.12.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>
<%@ Register assembly="DevExpress.XtraCharts.v14.2, Version=14.2.12.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>

<%@ Register Assembly="DevExpress.Web.ASPxGauges.v14.2, Version=14.2.12.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGauges" TagPrefix="dx"  %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v14.2, Version=14.2.12.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.Circular" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v14.2, Version=14.2.12.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v14.2, Version=14.2.12.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.Linear" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v14.2, Version=14.2.12.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.State" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v14.2, Version=14.2.12.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.Digital" tagprefix="dx" %>

<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server" >
    <script type="text/javascript" >
    </script>

        <div id="mainDiv" style="height:625px; width:100%; overflow-y:auto; overflow-x:auto;"  >

        <asp:Table  runat="server" ID="tblMetricsTop"  HorizontalAlign="Center" Width="100%" Height="8%" >
                     <asp:TableRow HorizontalAlign="Center">
                         <asp:TableCell ><dx:ASPxLabel ID="lblPerformance" runat="server" Text="0-Day performance" Font-Size="X-Large"></dx:ASPxLabel></asp:TableCell>
                             <asp:TableCell ></asp:TableCell>
                             <asp:TableCell ><dx:ASPxLabel ID="lblProjectResults" runat="server" Text="0-Day Project Results" Font-Size="X-Large"></dx:ASPxLabel></asp:TableCell>
                     </asp:TableRow>
                    <%-- Performance Meter --%>
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell >
                                  <asp:Table  runat="server" ID="Table1"  HorizontalAlign="Center" Width="100%" >
                                      <%-- Contact within 1 hour --%>
                                      <asp:TableRow>
                                          <asp:TableCell>
                                               <dx:ASPxGaugeControl runat="server"  BackColor="Transparent" ID="gagContactwithin1hr" Width="60px" Height="60px"  Value="0">
                                                       <Gauges>
                                                           <dx:StateIndicatorGauge Bounds="0, 0, 60, 60" Name="gagindicatorWithin1hr">
                                                               <indicators>
                                                                   <dx:StateIndicatorComponent ID="indicatorWithin1hr" AcceptOrder="0" Center="124, 124" Name="stateIndicatorComponent1"  Size="125, 125"  StateIndex="0">
                                                                       <states>
                                                                           <dx:IndicatorStateWeb Name="State1" ShapeType="ElectricLight1" />
                                                                           <dx:IndicatorStateWeb Name="State2" ShapeType="ElectricLight2" />
                                                                           <dx:IndicatorStateWeb Name="State3" ShapeType="ElectricLight3" />
                                                                           <dx:IndicatorStateWeb Name="State4" ShapeType="ElectricLight4" />
                                                                       </states>
                                                                   </dx:StateIndicatorComponent>
                                                               </indicators>
                                                           </dx:StateIndicatorGauge>
                                                       </Gauges>
                                                        <LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                                                </dx:ASPxGaugeControl>
                                          </asp:TableCell>
                                          <asp:TableCell><dx:ASPxLabel ID="lblContactWithin1hr" runat="server" Font-Size="Large" Text="Contacted within 1 hour"></dx:ASPxLabel></asp:TableCell>
                                      </asp:TableRow>
                                      <%-- Schedule within 24 hours --%>
                                      <asp:TableRow>
                                          <asp:TableCell>
                                               <dx:ASPxGaugeControl runat="server" BackColor="Transparent" ID="gagSchedulewithin24hrs" Width="60px" Height="60px" Value="0">
                                                       <Gauges>
                                                           <dx:StateIndicatorGauge Bounds="0, 0, 60, 60" Name="Gauge0">
                                                               <indicators>
                                                                   <dx:StateIndicatorComponent ID="indicatorWithin24hrs" AcceptOrder="0" Center="124, 124" Name="stateIndicatorComponent1" Size="125, 125" StateIndex="0">
                                                                       <states>
                                                                           <dx:IndicatorStateWeb Name="State1" ShapeType="ElectricLight1" />
                                                                           <dx:IndicatorStateWeb Name="State2" ShapeType="ElectricLight2" />
                                                                           <dx:IndicatorStateWeb Name="State3" ShapeType="ElectricLight3" />
                                                                           <dx:IndicatorStateWeb Name="State4" ShapeType="ElectricLight4" />
                                                                       </states>
                                                                   </dx:StateIndicatorComponent>
                                                               </indicators>
                                                           </dx:StateIndicatorGauge>
                                                       </Gauges>
                                                        <LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                                                </dx:ASPxGaugeControl>
                                          </asp:TableCell>
                                          <asp:TableCell><dx:ASPxLabel ID="lbScheduledWithin24hrs" runat="server" Font-Size="Large" Text="Contacted within 1 hour"></dx:ASPxLabel></asp:TableCell>
                                      </asp:TableRow>
                                      <%-- Results within 48 hours --%>
                                      <asp:TableRow>
                                          <asp:TableCell>
                                               <dx:ASPxGaugeControl runat="server" BackColor="Transparent" ID="gagResultsWithin48hrs" Width="60px" Height="60px" Value="0">
                                                       <Gauges>
                                                           <dx:StateIndicatorGauge Bounds="0, 0, 75, 75" Name="Gauge0">
                                                               <indicators>
                                                                   <dx:StateIndicatorComponent ID="indicatorWithin48hrs" AcceptOrder="0" Center="124, 124" Name="stateIndicatorComponent1" Size="125, 125" StateIndex="0">
                                                                       <states>
                                                                           <dx:IndicatorStateWeb Name="State1" ShapeType="ElectricLight1" />
                                                                           <dx:IndicatorStateWeb Name="State2" ShapeType="ElectricLight2" />
                                                                           <dx:IndicatorStateWeb Name="State3" ShapeType="ElectricLight3" />
                                                                           <dx:IndicatorStateWeb Name="State4" ShapeType="ElectricLight4" />
                                                                       </states>
                                                                   </dx:StateIndicatorComponent>
                                                               </indicators>
                                                           </dx:StateIndicatorGauge>
                                                       </Gauges>
                                                        <LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                                                </dx:ASPxGaugeControl>
                                          </asp:TableCell>
                                          <asp:TableCell><dx:ASPxLabel ID="lblResultsWithin48hrs" runat="server" Font-Size="Large" Text="Contacted within 1 hour"></dx:ASPxLabel></asp:TableCell>
                                      </asp:TableRow>
                                  </asp:Table>

                        </asp:TableCell>
                        <asp:TableCell></asp:TableCell>
                         <%-- Project Results --%>
                        <asp:TableCell> 
                                 <dxchartsui:WebChartControl ID="chrtProjectResults" runat="server" CrosshairEnabled="True" DataSourceID="dsResultsAnalysis" ClientInstanceName="projectResults" AutoLayout="True" Height="200px" Width="600px" >
                                    <diagramserializable>
                                        <cc1:SimpleDiagram EqualPieSize="False">
                                        </cc1:SimpleDiagram>
                                    </diagramserializable>
                                    <seriesserializable>
                                        <cc1:Series ArgumentDataMember="Result" ArgumentScaleType="Qualitative" Name="Results" ValueDataMembersSerializable="Total">
                                            <viewserializable>
                                                <cc1:PieSeriesView>
                                                </cc1:PieSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PieSeriesLabel TextPattern="{A}  {VP:0.00%}">
                                                </cc1:PieSeriesLabel>
                                            </labelserializable>
                                        </cc1:Series>
                                    </seriesserializable>
                                    <seriestemplate>
                                        <viewserializable>
                                            <cc1:PieSeriesView>
                                            </cc1:PieSeriesView>
                                        </viewserializable>
                                    </seriestemplate>
                                </dxchartsui:WebChartControl>
                        </asp:TableCell>
                    </asp:TableRow>
               </asp:Table>
        <br />

        <asp:Table  runat="server" ID="tblMetricsBottom"  HorizontalAlign="Center" Width="100%"  Height="8%">
                  <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Center"><dx:ASPxLabel ID="lblProjectActivity" runat="server" Text="0-Day Project Activity" Font-Size="X-Large" ></dx:ASPxLabel></asp:TableCell>
                  </asp:TableRow>
                  <asp:TableRow Visible="false">
                        <asp:TableCell HorizontalAlign="Center"><dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="0-Day Project Types by User" Font-Size="X-Large" ></dx:ASPxLabel></asp:TableCell>
                  </asp:TableRow>
                   <%-- Daily Activity --%>
                  <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Center">
                        <dxchartsui:WebChartControl ID="chrtDailyProjectActivity" runat="server" CrosshairEnabled="True"  DataSourceID="dsDailyProjectsKPI" Height="150" Width="1000" >
                                   <diagramserializable>
                                                         <cc1:XYDiagram>
                                                             <axisx visibleinpanesserializable="-1" title-text="">
                                                                 <autoscalebreaks maxcount="120" />
                                                                 <visualrange auto="true" autosidemargins="False" sidemarginsvalue="0.5" />
                                                                 <wholerange auto="true" />
                                                                 <datetimescaleoptions aggregatefunction="None" autogrid="False">
                                                                 </datetimescaleoptions>
                                                             </axisx>
                                                             <axisy visibleinpanesserializable="-1">
                                                             </axisy>
                                                         </cc1:XYDiagram>
                                                     </diagramserializable>
                                                     <legend font="Arial, 10pt, style=Bold"></legend>
                                                     <seriesserializable>
                                                         <cc1:Series Name="Opened" ArgumentDataMember="Date" LabelsVisibility="False" ArgumentScaleType="DateTime" ValueDataMembersSerializable="Opened">
                                                             <viewserializable>
                                                                 <cc1:LineSeriesView>
                                                                 </cc1:LineSeriesView>
                                                             </viewserializable>
                                                         </cc1:Series>
                                                         <cc1:Series ArgumentDataMember="Date" ArgumentScaleType="DateTime" Name="Closed" ValueDataMembersSerializable="Completed">
                                                             <viewserializable>
                                                                 <cc1:LineSeriesView>
                                                                 </cc1:LineSeriesView>
                                                             </viewserializable>
                                                         </cc1:Series>
                                                     </seriesserializable>
                                   <seriestemplate argumentscaletype="Qualitative">
                                       <viewserializable>
                                           <cc1:LineSeriesView>
                                           </cc1:LineSeriesView>
                                       </viewserializable>
                                   </seriestemplate>
                            </dxchartsui:WebChartControl>  
                    </asp:TableCell>
                  </asp:TableRow>
                   <%-- Project Types by User --%>
                  <asp:TableRow Visible="false">
                    <asp:TableCell HorizontalAlign="Center" >
                                <dxchartsui:WebChartControl ID="chrtUserByType" runat="server" CrosshairEnabled="True" Height="200px"  DataSourceID="dsProjectsByUser" Width="600px" AutoLayout="True">
                                    <diagramserializable>
                                        <cc1:XYDiagram>
                                            <axisx visibleinpanesserializable="-1" title-text="">
                                                                 <autoscalebreaks maxcount="120" />
                                                                 <visualrange auto="true" autosidemargins="False" sidemarginsvalue="0.5" />
                                                                 <wholerange auto="true" />
                                                                 <datetimescaleoptions aggregatefunction="None" autogrid="False">
                                                                 </datetimescaleoptions>
                                                             </axisx>
                                            <axisy visibleinpanesserializable="-1">
                                            </axisy>
                                        </cc1:XYDiagram>
                                    </diagramserializable>
                                    <seriesserializable>
                                        <cc1:Series ArgumentDataMember="AuthorizingContact" ArgumentScaleType="Qualitative" Name="Pre-Employment" ValueDataMembersSerializable="NoOfPreEmployment">
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel TextPattern="{A}">
                                                </cc1:SideBySideBarSeriesLabel>
                                            </labelserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="AuthorizingContact" ArgumentScaleType="Qualitative" Name="Random" ValueDataMembersSerializable="NoOfRandom">
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="AuthorizingContact" ArgumentScaleType="Qualitative" Name="Return to Duty" ValueDataMembersSerializable="NoOfReturnToDuty">
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="AuthorizingContact" ArgumentScaleType="Qualitative" Name="Post Accident" ValueDataMembersSerializable="NoOfPostAccident">
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="AuthorizingContact" ArgumentScaleType="Qualitative" Name="Reasonable Suspicion" ValueDataMembersSerializable="NoOfReasonableSuspicion">
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="AuthorizingContact" ArgumentScaleType="Qualitative" Name="Follow-up" ValueDataMembersSerializable="NoOfFollowUP">
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="AuthorizingContact" ArgumentScaleType="Qualitative" Name="Other" ValueDataMembersSerializable="NoOfOther">
                                        </cc1:Series>
                                    </seriesserializable>
                                </dxchartsui:WebChartControl>
                    </asp:TableCell>
                  </asp:TableRow>
               </asp:Table>

         <br />

        <%-- Open Projectsl--%>
          <asp:Table  runat="server" ID="tblActivity"  HorizontalAlign="Center" Width="100%" Height="15%">
              <asp:TableRow HorizontalAlign="Center"><asp:TableCell><dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Current Active Projects" Font-Size="X-Large"></dx:ASPxLabel></asp:TableCell></asp:TableRow>
              <asp:TableRow  HorizontalAlign="Center">
                   <asp:TableCell>
                          <dx:ASPxGridView ID="gvOpenProjects" runat="server" AutoGenerateColumns="False" DataSourceID="dsOpenProjects" KeyFieldName="ProjectID">
                               <Columns>
                                   <dx:GridViewDataTextColumn FieldName="ProjectID" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Visible="False"><EditFormSettings Visible="False" /></dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="Request Type" ShowInCustomizationForm="True" VisibleIndex="2"></dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="LastName" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3"></dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="FirstName" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4"></dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="MI" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="5"></dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="Status" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="6"></dx:GridViewDataTextColumn>
                                   <dx:GridViewDataDateColumn FieldName="Requested" ShowInCustomizationForm="True" VisibleIndex="7"></dx:GridViewDataDateColumn>
                                   <dx:GridViewDataDateColumn FieldName="ScheduleByDeadline" ShowInCustomizationForm="True" VisibleIndex="8"></dx:GridViewDataDateColumn>
                                    <dx:GridViewDataTextColumn FieldName="URL" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="9"></dx:GridViewDataTextColumn>
                                    <dx:GridViewDataHyperLinkColumn Caption="ID" FieldName="URL" ShowInCustomizationForm="True" VisibleIndex="0"><PropertiesHyperLinkEdit TextField="ProjectID"></PropertiesHyperLinkEdit></dx:GridViewDataHyperLinkColumn>
                                  </Columns>
                               <SettingsPager Visible="False">
                               </SettingsPager>
                               <Settings ShowFilterRow="True" />
                               <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                          </dx:ASPxGridView>
                   </asp:TableCell>
              </asp:TableRow>
           </asp:Table>

                        
        <%-- Performance Meter --%>
        <asp:SqlDataSource ID="dsPerformanceMetrics" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="ohsn_Web_GetPerformanceMetrics" SelectCommandType="StoredProcedure" OnDataBinding="dsPerformanceMetrics_DataBinding" EnableCaching="True" ProviderName="System.Data.SqlClient">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="EmployerID" SessionField="WorkingEmployerID" Type="Int64" />
                <asp:SessionParameter DefaultValue="90" Name="DaysToDisplay" SessionField="KPIDaysToDisplay" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        <asp:SqlDataSource ID="dsProjectsByUser" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="OHSN_Web_GetMetricProjectsByUser" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="EmployerID" SessionField="WorkingEmployerID" Type="Int64" />
                <asp:SessionParameter DefaultValue="90" Name="DaysToDisplay" SessionField="KPIDaysToDisplay" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="dsDailyProjectsKPI" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="OHSN_Web_GetDailyProjectKPIs" SelectCommandType="StoredProcedure" EnableCaching="True" ProviderName="System.Data.SqlClient" >
            <SelectParameters>
                 <asp:SessionParameter Name="EmployerID" DefaultValue="0" SessionField="WorkingEmployerID" Type="String" />
                 <asp:SessionParameter DefaultValue="90" Name="DaysToDisplay" SessionField="KPIDaysToDisplay" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="dsResultsAnalysis" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="OHSN_Web_GetResultsMetrics" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="EmployerID" SessionField="WorkingEmployerID" Type="Int64" />
                <asp:SessionParameter DefaultValue="90" Name="DaysToDisplay" SessionField="KPIDaysToDisplay" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>


        <asp:SqlDataSource ID="dsOpenProjects" runat="server"  ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="OHSN_Web_MainPageOpenProjects" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="EmployerID" SessionField="WorkingEmployerID" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
                
 </div>

</asp:Content>

