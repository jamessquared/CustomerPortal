namespace CustomerPortal.Content
{
    using DevExpress.Web;
    using DevExpress.XtraScheduler;
    using DevExpress.Web.ASPxScheduler;
    using System;

    public partial class ClientCalendar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ContactID"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }
            // Set Login Header
            CustomerPortal.RootMaster siteMasterPage = (CustomerPortal.RootMaster)this.Master;
            if (siteMasterPage != null)
            {
                siteMasterPage.SetLoginLabels();
            }

            if (!IsPostBack)
            {
                Session["CalendarView"] = DevExpress.XtraScheduler.SchedulerViewType.Month;
                var now = DateTime.Now;
                calendar.Start = new DateTime(now.Year, now.Month, 1);
            }

            dsCalendar.DataBind();
        }

        protected void mainToolbar_CommandExecuted(object source, DevExpress.Web.RibbonCommandExecutedEventArgs e)
        {
            switch (e.Item.Name)
            {
                case "btnBack":
                    {
                        Response.Redirect("~/Default.aspx");
                        break;
                    }

                case "cbxView":
                    {
                        switch (((RibbonComboBoxItem)e.Item).Value.ToString())
                        {
                            case "Month" :
                                {
                                    calendar.ActiveViewType = DevExpress.XtraScheduler.SchedulerViewType.Month;
                                    Session["CalendarView"] = DevExpress.XtraScheduler.SchedulerViewType.Month;
                                    break;
                                }

                            case "WorkWeek":
                                {
                                    calendar.ActiveViewType = DevExpress.XtraScheduler.SchedulerViewType.WorkWeek;
                                    Session["CalendarView"] = DevExpress.XtraScheduler.SchedulerViewType.WorkWeek;
                                    break;
                                }

                            case "Week":
                                {
                                    calendar.ActiveViewType = DevExpress.XtraScheduler.SchedulerViewType.Week;
                                    Session["CalendarView"] = DevExpress.XtraScheduler.SchedulerViewType.Week;
                                    break;
                                }

                            case "Day":
                                {
                                    calendar.ActiveViewType = DevExpress.XtraScheduler.SchedulerViewType.Day;
                                    Session["CalendarView"] = DevExpress.XtraScheduler.SchedulerViewType.Day;
                                    break;
                                }
                        }

                      break;
                    }

                case "btnPrevious":
                    {
                        switch (Session["CalendarView"].ToString())
                        {
                            case "Month":
                                {
                                    calendar.Start = calendar.Start.AddDays(-30);
                                    break;
                                }

                            case "WorkWeek":
                                {
                                    calendar.Start = calendar.Start.AddDays(-7);
                                    break;
                                }

                            case "Day":
                                {
                                    
                                    if (calendar.Start.AddDays(-1).DayOfWeek == DayOfWeek.Sunday) 
                                    {
                                        calendar.Start = calendar.Start.AddDays(-2);
                                    }
                                    else
                                    {
                                        calendar.Start = calendar.Start.AddDays(-1);
                                    }

                                    break;
                                }
                        }

                        break;
                    }

                case "btnToday":
                    {
                        calendar.Start = DateTime.Now.Date;
                        break;
                    }

                case "btnNext":
                    {
                        switch (Session["CalendarView"].ToString())
                        {
                            case "Month":
                                {
                                    calendar.Start = calendar.Start.AddDays(30);
                                    break;
                                }

                            case "WorkWeek":
                                {
                                    calendar.Start = calendar.Start.AddDays(7);
                                    break;
                                }

                            case "Day":
                                {
                                    if (calendar.Start.AddDays(1).DayOfWeek == DayOfWeek.Saturday)
                                    {
                                        calendar.Start = calendar.Start.AddDays(2);
                                    }
                                    else
                                    {
                                        calendar.Start = calendar.Start.AddDays(1);
                                    }

                                    calendar.Start = calendar.Start.AddDays(1);
                                    break;
                                }
                        }
                        break;
                    }
            }
        }

        protected void calendar_InitAppointmentImages(object sender, AppointmentImagesEventArgs e)
        {
            if (string.IsNullOrEmpty(e.Appointment.CustomFields[0].ToString()) == false)
            {
                var scheduler = new DevExpress.Web.ASPxScheduler.Drawing.AppointmentImageInfo();
                
                switch (e.Appointment.CustomFields[0].ToString())
                {
                    case "Post Accident":
                        {
                            scheduler.ImageProperties = new ImageProperties("~/Images/Request Type/PostAccident.png");
                            scheduler.ImageProperties.ToolTip = "Post Accident";
                            break;
                        }

                    case "Pre-Employment":
                        {
                            scheduler.ImageProperties = new ImageProperties("~/Images/Request Type/PreEmployment.png");
                            scheduler.ImageProperties.ToolTip = "Pre-Employment";
                            break;
                        }

                    case "Random":
                    {
                        scheduler.ImageProperties = new ImageProperties("~/Images/Request Type/Random.png");
                        scheduler.ImageProperties.ToolTip = "Random";
                        break;
                    }

                    case "Reasonable Suspicion":
                    {
                        scheduler.ImageProperties = new ImageProperties("~/Images/Request Type/ReasonableSuspicion.png");
                        scheduler.ImageProperties.ToolTip = "Reasonable Suspicion";
                        break;
                    }

                    case "Return to Duty":
                    {
                        scheduler.ImageProperties.ToolTip = "Return to Duty";
                        scheduler.ImageProperties = new ImageProperties("~/Images/Request Type/ReturntoDuty.png");
                        break;
                    }

                    case "Follow Up":
                    {
                        scheduler.ImageProperties.ToolTip = "Follow-up";
                        scheduler.ImageProperties = new ImageProperties("~/Images/Request Type/FollowUp.png");
                        break;
                    }
                    default:
                    {
                        break;
                    }                       
                }
                

                e.ImageInfoList.Add(scheduler);
            }
        }

        protected void calendar_ActiveViewChanged(object sender, EventArgs e)
        {
             

            //switch (((ASPxScheduler)sender).ActiveViewType)
            //{
            //    case DevExpress.XtraScheduler.SchedulerViewType.Month:
            //        {
            //            ((RibbonComboBoxItem)mainToolbar.Tabs[0].Groups[0].Items[1]).Value = "Month";
            //            Session["CalendarView"] = DevExpress.XtraScheduler.SchedulerViewType.Month;
            //            break;
            //        }

            //    case DevExpress.XtraScheduler.SchedulerViewType.Week:
            //        {
            //            ((RibbonComboBoxItem)mainToolbar.Tabs[0].Groups[0].Items[1]).Value = "Week";
            //            mainToolbar_CommandExecuted(((RibbonComboBoxItem)mainToolbar.Tabs[0].Groups[0].Items[1]), null);

            //            //((RibbonComboBoxItem)mainToolbar.Tabs[0].Groups[0].Items[1]).Items[1].Selected = true;
            //            //Session["CalendarView"] = DevExpress.XtraScheduler.SchedulerViewType.Week;

            //            break;
            //        }

            //    case DevExpress.XtraScheduler.SchedulerViewType.WorkWeek:
            //        {
            //            ((RibbonComboBoxItem)mainToolbar.Tabs[0].Groups[0].Items[1]).Value = "WorkWeek";
            //            mainToolbar_CommandExecuted(((RibbonComboBoxItem)mainToolbar.Tabs[0].Groups[0].Items[1]), null);

            //            //((RibbonComboBoxItem)mainToolbar.Tabs[0].Groups[0].Items[1]).Items[2].Selected = true;
            //            //((RibbonComboBoxItem)mainToolbar.Tabs[0].Groups[0].Items[1]).Text = "Work Week";
            //            //Session["CalendarView"] = DevExpress.XtraScheduler.SchedulerViewType.WorkWeek;

            //            break;
            //        }

            //    case DevExpress.XtraScheduler.SchedulerViewType.Day:
            //        {
            //            ((RibbonComboBoxItem)mainToolbar.Tabs[0].Groups[0].Items[1]).Items[3].Selected = true;
            //            ((RibbonComboBoxItem)mainToolbar.Tabs[0].Groups[0].Items[1]).Text = "Day";
            //            Session["CalendarView"] = DevExpress.XtraScheduler.SchedulerViewType.Day;

            //            break;
            //        }
            //}
        }
    }
}