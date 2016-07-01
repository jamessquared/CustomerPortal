﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Root.master" CodeBehind="ClientCalendar.aspx.cs" Inherits="CustomerPortal.Content.ClientCalendar" %>

<%@ Register assembly="DevExpress.Web.ASPxScheduler.v14.2, Version=14.2.12.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxScheduler" tagprefix="dxwschs" %>
<%@ Register assembly="DevExpress.XtraScheduler.v14.2.Core, Version=14.2.12.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraScheduler" tagprefix="cc1" %>


<asp:Content ID="content" ContentPlaceHolderID="content" runat="server" >

    <%-- Main Menu --%>
    <dx:ASPxRibbon ID="mainToolbar" runat="server" ClientInstanceName="MainToolbar" ShowGroupLabels="False" ShowFileTab="False"  ShowTabs="False" OnCommandExecuted="mainToolbar_CommandExecuted">
        <Styles>
                <Item Width="100px"></Item>
                <GroupExpandButton Width="100px"></GroupExpandButton>
            </Styles>
        <Tabs>
            <dx:RibbonTab Name="Main" Text="">
                <Groups>
                    <dx:RibbonGroup Text="Back">
                        <Items>
                            <dx:RibbonButtonItem Name="btnBack" Size="Large" Text="Back" ToolTip="Return to the previous page with saving any changes.">
                                <LargeImage Url="~/Images/Reports/Back.png">
                                </LargeImage>
                            </dx:RibbonButtonItem>
                            <dx:RibbonComboBoxItem BeginGroup="True" Name="cbxView" Text="View" ToolTip="Changes the format for which the calender is displayed.">
                                <Items>
                                    <dx:ListEditItem Selected="True" Text="Month" Value="Month" />
                                    <dx:ListEditItem Text="Week" Value="Week" />
                                    <dx:ListEditItem Text="Day" Value="Day" />
                                </Items>
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="250px" />
                            </dx:RibbonComboBoxItem>
                            <dx:RibbonButtonItem BeginGroup="True" Name="btnPrevious" Size="Large" Text="Previous">
                                <LargeImage Url="~/Images/General/CalendarPrevious.png">
                                </LargeImage>
                            </dx:RibbonButtonItem>
                            <dx:RibbonButtonItem Name="btnToday" Size="Large" Text="Today">
                                <LargeImage Url="~/Images/General/Today.png">
                                </LargeImage>
                            </dx:RibbonButtonItem>
                            <dx:RibbonButtonItem Name="btnNext" Size="Large" Text="Next">
                                <LargeImage Url="~/Images/General/CalendarNext.png">
                                </LargeImage>
                            </dx:RibbonButtonItem>
                        </Items>
                    </dx:RibbonGroup>
                </Groups>
            </dx:RibbonTab>
        </Tabs>
    </dx:ASPxRibbon>


    <div runat="server" style="overflow:auto; max-height:650px">

    <dxwschs:ASPxScheduler ID="calendar" runat="server" ActiveViewType="Month" AppointmentDataSourceID="dsCalendar" ClientIDMode="AutoID" ResourceDataSourceID="" Start="2016-05-29" ClientInstanceName="clientCalendar" OnInitAppointmentImages="calendar_InitAppointmentImages">
        <Storage EnableReminders="False">
            <Appointments ResourceSharing="True" AutoRetrieveId="True">
                <Mappings AllDay="AllDay" AppointmentId="UniqueID" Description="Description" End="EndDate" Label="Label" Location="Location" RecurrenceInfo="RecurrenceInfo" ReminderInfo="ReminderInfo" ResourceId="ResourceID" Start="StartDate" Status="Status" Subject="Subject" Type="Type" />
                <CustomFieldMappings>
                    <dxwschs:ASPxAppointmentCustomFieldMapping Member="CustomerField1" Name="CustomerField1" />
                </CustomFieldMappings>
            </Appointments>
            <Resources>
                <Mappings Caption="ResourceName" Color="Color" Image="Image" ResourceId="ResourceID" />
            </Resources>
        </Storage>
        <Views>

        <DayView>
            <TimeRulers>
                    <cc1:TimeRuler></cc1:TimeRuler>        
            </TimeRulers>
            <AppointmentDisplayOptions AppointmentAutoHeight="True" EndTimeVisibility="Never" ShowRecurrence="False" ShowReminder="False" />
            <DayViewStyles ScrollAreaHeight="600px">
            </DayViewStyles>
        </DayView>

            <WorkWeekView><TimeRulers>
<cc1:TimeRuler></cc1:TimeRuler>
</TimeRulers>
    <AppointmentDisplayOptions AppointmentAutoHeight="True" EndTimeVisibility="Never" ShowRecurrence="False" ShowReminder="False" />
</WorkWeekView>

            <MonthView>
                <AppointmentDisplayOptions EndTimeVisibility="Never" AppointmentAutoHeight="True" />
            </MonthView>
            <TimelineView Enabled="False">
            </TimelineView>
            <FullWeekView>
                <TimeRulers>
<cc1:TimeRuler></cc1:TimeRuler>
</TimeRulers>
            </FullWeekView>
        </Views>
        <Images>
            <Appointment>
                <DayClock Url="~/Images/Request Type/Random.png">
                </DayClock>
            </Appointment>
        </Images>
        <OptionsBehavior ShowRemindersForm="False" ShowTimeMarker="False" ShowViewNavigator="False" ShowViewSelector="False" ShowViewNavigatorGotoDateButton="False" />
        <OptionsForms AppointmentFormVisibility="None" GotoDateFormVisibility="None" RecurrentAppointmentDeleteFormVisibility="None" RecurrentAppointmentEditFormVisibility="None" />
        <OptionsView NavigationButtons-Visibility="Never" />
    </dxwschs:ASPxScheduler>

    <%--Legend per Miranda--%>
        <dx:ASPxLabel runat="server" Text="Blue Background = Completed, Light Red Background = Not Yet Completed    "></dx:ASPxLabel>
        <dx:ASPxImage runat="server" src="../Images/Request%20Type/PreEmployment.png"> </dx:ASPxImage>        
       <dx:ASPxLabel runat="server" Text=" = Pre-Employment    "></dx:ASPxLabel>
        <dx:ASPxImage runat="server" src="../Images/Request%20Type/Random.png"> </dx:ASPxImage>        
       <dx:ASPxLabel runat="server" Text=" = Random    "></dx:ASPxLabel>
        <dx:ASPxImage runat="server" src="../Images/Request%20Type/PostAccident.png"> </dx:ASPxImage>        
       <dx:ASPxLabel runat="server" Text=" = Post Accident    "></dx:ASPxLabel>
        <dx:ASPxImage runat="server" src="../Images/Request%20Type/ReasonableSuspicion.png"> </dx:ASPxImage>        
       <dx:ASPxLabel runat="server" Text=" = Resonable Suspicion    "></dx:ASPxLabel>
        <dx:ASPxImage runat="server" src="../Images/Request%20Type/ReturnToDuty.png"> </dx:ASPxImage>        
       <dx:ASPxLabel runat="server" Text=" = Return To Duty    "></dx:ASPxLabel>
        <dx:ASPxImage runat="server" src="../Images/Request%20Type/FollowUp.png"> </dx:ASPxImage>        
       <dx:ASPxLabel runat="server" Text=" = Follow Up    "></dx:ASPxLabel>
    </div>

    <asp:SqlDataSource ID="dsCalendar" runat="server" ConnectionString="<%$ ConnectionStrings:OHSN %>" SelectCommand="OHSN_Web_GetClientCalendarInfo" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="EmployerID" SessionField="WorkingEmployerID" Type="Int64" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />

 

</asp:Content>