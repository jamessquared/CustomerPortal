
<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeBehind="Default.aspx.cs" Inherits="CustomerPortal._Default" %>

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



<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
        <script type="text/javascript">

    </script>
        <div>
          <asp:Table  runat="server" ID="tblMetricsTop"  HorizontalAlign="Center" Width="100%">
                 <asp:TableRow HorizontalAlign="Center">
                     <asp:TableCell ><dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="90-Day performance" Font-Size="X-Large"></dx:ASPxLabel></asp:TableCell>
                         <asp:TableCell ></asp:TableCell>
                         <asp:TableCell ><dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="90-Day Projects by User" Font-Size="X-Large"></dx:ASPxLabel></asp:TableCell>
                 </asp:TableRow>
                <asp:TableRow><asp:TableCell><br /></asp:TableCell></asp:TableRow>
                <%-- Performance Meter --%>
                <asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell >
                            <dx:ASPxGaugeControl runat="server" Width="600px" Height="200px" BackColor="White" ID="gaugeControl" ClientInstanceName="gaugeControl" SaveStateOnCallbacks="False" Value="0"  >
                                  <ClientSideEvents   />
                                        <Gauges>
                                            <dx:CircularGauge Bounds="0, 0, 200, 200" Name="gagContactedWithin1hr">
                                                <scales>
                                                    <dx:ArcScaleComponent AcceptOrder="1" AppearanceMajorTickmark-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMajorTickmark-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMinorTickmark-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMinorTickmark-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceTickmarkText-Font="Tahoma, 12pt" AppearanceTickmarkText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" Center="125, 165" EndAngle="0" MajorTickmark-FormatString="{0:F0}" MajorTickmark-ShapeOffset="-5" MajorTickmark-ShapeScale="0.6, 0.8" MajorTickmark-ShapeType="Circular_Style11_4" MajorTickmark-TextOffset="-17" MajorTickmark-TextOrientation="LeftToRight" MaxValue="100" MinorTickCount="4" MinorTickmark-ShapeOffset="-2.5" MinorTickmark-ShapeScale="0.6, 1" MinorTickmark-ShapeType="Circular_Style11_3" Name="scale2" RadiusX="107" RadiusY="107" StartAngle="-180" ZOrder="-1">
                                                    </dx:ArcScaleComponent>
                                                </scales>
                                                <backgroundlayers>
                                                    <dx:ArcScaleBackgroundLayerComponent AcceptOrder="-999" ArcScale="" Name="cGauge1_BackgroundLayer1" ScaleCenterPos="0.5, 0.815" ScaleID="scale2" Shader="&lt;ShaderObject Type=&quot;Opacity&quot; Data=&quot;Opacity[0]&quot;/&gt;" ShapeType="CircularHalf_Style11" Size="250, 154" ZOrder="999" />
                                                </backgroundlayers>
                                                <needles>
                                                    <dx:ArcScaleNeedleComponent AcceptOrder="51" ArcScale="" EndOffset="5" Name="cGauge1_Needle1" ScaleID="scale2" ShapeType="CircularFull_Style11" StartOffset="-9.5" Value="0" ZOrder="-51" />
                                                </needles>
                                                <labels>
                                                    <dx:LabelComponent AcceptOrder="1001" AppearanceText-Font="Arial, 11.25pt, style=Bold" AppearanceText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" Name="cGauge1_Label1" Position="125, 200" Size="225, 100" Text="Contacted with 1 hr" ZOrder="-1001" />
                                                    <dx:LabelComponent AcceptOrder="1001" AppearanceText-Font="Arial, 11.25pt, style=Bold" AppearanceText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" Name="gagContactedWithin1hr_Label2" Text="Percentage" ZOrder="-1001" />
                                                </labels>
                                            </dx:CircularGauge>
                                            <dx:CircularGauge Bounds="200, 0, 200, 200" Name="gagScheduledWithin24hrs">
                                                <scales>
                                                    <dx:ArcScaleComponent AcceptOrder="1" AppearanceMajorTickmark-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMajorTickmark-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMinorTickmark-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMinorTickmark-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceTickmarkText-Font="Tahoma, 12pt" AppearanceTickmarkText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" Center="125, 165" EndAngle="0" MajorTickmark-FormatString="{0:F0}" MajorTickmark-ShapeOffset="-5" MajorTickmark-ShapeScale="0.6, 0.8" MajorTickmark-ShapeType="Circular_Style11_4" MajorTickmark-TextOffset="-17" MajorTickmark-TextOrientation="LeftToRight" MaxValue="100" MinorTickCount="4" MinorTickmark-ShapeOffset="-2.5" MinorTickmark-ShapeScale="0.6, 1" MinorTickmark-ShapeType="Circular_Style11_3" Name="scale2Copy0" RadiusX="107" RadiusY="107" StartAngle="-180" ZOrder="-1">
                                                    </dx:ArcScaleComponent>
                                                </scales>
                                                <backgroundlayers>
                                                    <dx:ArcScaleBackgroundLayerComponent AcceptOrder="-999" ArcScale="" Name="cGauge1_BackgroundLayer1Copy0" ScaleCenterPos="0.5, 0.815" ScaleID="scale2Copy0" Shader="&lt;ShaderObject Type=&quot;Opacity&quot; Data=&quot;Opacity[0]&quot;/&gt;" ShapeType="CircularHalf_Style11" Size="250, 154" ZOrder="999" />
                                                </backgroundlayers>
                                                <needles>
                                                    <dx:ArcScaleNeedleComponent AcceptOrder="51" ArcScale="" EndOffset="5" Name="cGauge1_Needle1Copy0" ScaleID="scale2Copy0" ShapeType="CircularFull_Style11" StartOffset="-9.5" ZOrder="-51" />
                                                </needles>
                                                <labels>
                                                    <dx:LabelComponent AcceptOrder="1001" AppearanceText-Font="Arial, 11.25pt, style=Bold" AppearanceText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" Name="gagScheduledWithin24hrs_Label1" Position="125, 200" Size="225, 100" Text="Scheduled within 24 hrs" ZOrder="-1001" />
                                                    <dx:LabelComponent AcceptOrder="1001" AppearanceText-Font="Arial, 11.25pt, style=Bold" AppearanceText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" Name="gagScheduledWithin24hrs_Label2" Text="Percentage" ZOrder="-1001" />
                                                </labels>
                                            </dx:CircularGauge>
                                            <dx:CircularGauge Bounds="400, 0, 200, 200" Name="gagResultsWithin48hrs">
                                                <scales>
                                                    <dx:ArcScaleComponent AcceptOrder="1" AppearanceMajorTickmark-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMajorTickmark-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMinorTickmark-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMinorTickmark-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceTickmarkText-Font="Tahoma, 12pt" AppearanceTickmarkText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" Center="125, 165" EndAngle="0" MajorTickmark-FormatString="{0:F0}" MajorTickmark-ShapeOffset="-5" MajorTickmark-ShapeScale="0.6, 0.8" MajorTickmark-ShapeType="Circular_Style11_4" MajorTickmark-TextOffset="-17" MajorTickmark-TextOrientation="LeftToRight" MaxValue="100" MinorTickCount="4" MinorTickmark-ShapeOffset="-2.5" MinorTickmark-ShapeScale="0.6, 1" MinorTickmark-ShapeType="Circular_Style11_3" Name="scale2Copy1" RadiusX="107" RadiusY="107" StartAngle="-180" ZOrder="-1">
                                                    </dx:ArcScaleComponent>
                                                </scales>
                                                <backgroundlayers>
                                                    <dx:ArcScaleBackgroundLayerComponent AcceptOrder="-999" ArcScale="" Name="cGauge1_BackgroundLayer1Copy1" ScaleCenterPos="0.5, 0.815" ScaleID="scale2Copy1" Shader="&lt;ShaderObject Type=&quot;Opacity&quot; Data=&quot;Opacity[0]&quot;/&gt;" ShapeType="CircularHalf_Style11" Size="250, 154" ZOrder="999" />
                                                </backgroundlayers>
                                                <needles>
                                                    <dx:ArcScaleNeedleComponent AcceptOrder="51" ArcScale="" EndOffset="5" Name="cGauge1_Needle1Copy1" ScaleID="scale2Copy1" ShapeType="CircularFull_Style11" StartOffset="-9.5" ZOrder="-51" />
                                                </needles>
                                                <labels>
                                                    <dx:LabelComponent AcceptOrder="1001" AppearanceText-Font="Arial, 11.25pt, style=Bold" AppearanceText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" Name="gagResultsWithin48hrs_Label1" Position="125, 200" Size="225, 100" Text="Results within 48 hrs" ZOrder="-1001" />
                                                    <dx:LabelComponent AcceptOrder="1001" AppearanceText-Font="Arial, 11.25pt, style=Bold" AppearanceText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" Name="gagResultsWithin48hrs_Label2" Text="Percentage" ZOrder="-1001" />
                                                </labels>
                                            </dx:CircularGauge>
                                  </Gauges>
                                 <LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                            </dx:ASPxGaugeControl>
                    </asp:TableCell>
                    <asp:TableCell></asp:TableCell>
                     <%-- Project Types by User --%>
                    <asp:TableCell> 
                            <dxchartsui:WebChartControl ID="chrtUserByType" runat="server" CrosshairEnabled="True" Height="200px"  DataSourceID="dsProjectsByUser" Width="600px" AutoLayout="True">
                                <diagramserializable>
                                    <cc1:XYDiagram>
                                        <axisx visibleinpanesserializable="-1">
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
            
          <asp:Table  runat="server" ID="tblMetricsBottom"  HorizontalAlign="Center" Width="100%">
              <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Center"><dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="90-Day Project Activity" Font-Size="X-Large" ></dx:ASPxLabel></asp:TableCell>
                    <asp:TableCell></asp:TableCell>
                    <asp:TableCell HorizontalAlign="Center"><dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="90-Day Project Results" Font-Size="X-Large" ></dx:ASPxLabel></asp:TableCell>
              </asp:TableRow>
              <asp:TableRow><asp:TableCell><br /></asp:TableCell></asp:TableRow>
               <%-- Performance Meter --%>
              <asp:TableRow>
                <asp:TableCell HorizontalAlign="Center">
                       <dxchartsui:WebChartControl ID="chrtDailyProjectActivity" runat="server" CrosshairEnabled="True" Height="200px"  DataSourceID="dsDailyProjectsKPI" Width="600px" AutoLayout="True">
                               <diagramserializable>
                                                     <cc1:XYDiagram>
                                                         <axisx visibleinpanesserializable="-1">
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
                                                     <cc1:Series ArgumentDataMember="Date" ArgumentScaleType="DateTime" Name="Cancelled" ValueDataMembersSerializable="Cancelled">
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
                <asp:TableCell></asp:TableCell>
                <asp:TableCell HorizontalAlign="Center">
                    <dxchartsui:WebChartControl ID="chrtProjectResults" runat="server" CrosshairEnabled="True" DataSourceID="dsResultsAnalysis" Height="200px" Width="600px">
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
                                        <cc1:PieSeriesLabel TextPattern="{A}">
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

        <%-- Open Projectsl--%>
          <asp:Table  runat="server" ID="tblActivity"  HorizontalAlign="Center" Width="100%">
              <asp:TableRow HorizontalAlign="Center"><asp:TableCell><dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Active Projects" Font-Size="X-Large"></dx:ASPxLabel></asp:TableCell></asp:TableRow>
              <asp:TableRow><asp:TableCell></asp:TableCell></asp:TableRow>
              <asp:TableRow  HorizontalAlign="Center">
                   <asp:TableCell>
                          <dx:ASPxGridView ID="gvOpenProjects" runat="server" AutoGenerateColumns="False" DataSourceID="dsOpenProjects" KeyFieldName="ProjectID">
                               <Columns>
                                                    <dx:GridViewDataTextColumn FieldName="ProjectID" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Visible="False">
                                                        <EditFormSettings Visible="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Request Type" ShowInCustomizationForm="True" VisibleIndex="2">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="LastName" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="FirstName" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="MI" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="5">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Status" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="6">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataDateColumn FieldName="Requested" ShowInCustomizationForm="True" VisibleIndex="7">
                                                    </dx:GridViewDataDateColumn>
                                                    <dx:GridViewDataDateColumn FieldName="ScheduleByDeadline" ShowInCustomizationForm="True" VisibleIndex="8">
                                                    </dx:GridViewDataDateColumn>
                                                    <dx:GridViewDataTextColumn FieldName="URL" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="9">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataHyperLinkColumn Caption="ID" FieldName="URL" ShowInCustomizationForm="True" VisibleIndex="0">
                                                        <PropertiesHyperLinkEdit TextField="ProjectID">
                                                        </PropertiesHyperLinkEdit>
                                                    </dx:GridViewDataHyperLinkColumn>
                                                </Columns>
                               <SettingsPager Visible="False">
                               </SettingsPager>
                               <Settings ShowFilterRow="True" />
                               <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                          </dx:ASPxGridView>
                   </asp:TableCell>
              </asp:TableRow>
           </asp:Table>
            <br />         
        </div>

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

</asp:Content>

