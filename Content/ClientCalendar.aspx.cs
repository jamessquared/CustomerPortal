using DevExpress.Web;
using DevExpress.Web.ASPxScheduler;
using System;

namespace CustomerPortal.Content
{
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

                            case "Week":
                                {
                                    calendar.ActiveViewType = DevExpress.XtraScheduler.SchedulerViewType.WorkWeek;
                                    Session["CalendarView"] = DevExpress.XtraScheduler.SchedulerViewType.WorkWeek;
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
                var x = new DevExpress.Web.ASPxScheduler.Drawing.AppointmentImageInfo();
                switch (e.Appointment.CustomFields[0].ToString())
                {
                    case "Post Accident":
                        {
                            x.ImageProperties = new ImageProperties("~/Images/Request Type/PostAccident.png");
                            break;
                        }

                    case "Pre-Employment":
                        {
                            x.ImageProperties = new ImageProperties("~/Images/Request Type/PreEmployment.png");
                            break;
                        }

                    case "Random":
                    {
                        x.ImageProperties = new ImageProperties("~/Images/Request Type/Random.png");
                        break;
                    }

                    case "Reasonable Suspicion":
                    {
                        x.ImageProperties = new ImageProperties("~/Images/Request Type/ReasonableSuspicion.png");
                        break;
                    }

                    case "Return to Duty":
                    {
                        x.ImageProperties = new ImageProperties("~/Images/Request Type/ReturntoDuty.png");
                        break;
                    }

                    case "Follow Up":
                    {
                        x.ImageProperties = new ImageProperties("~/Images/Request Type/FollowUp.png");
                        break;
                    }
                    default:
                    {
                        break;
                    }                       
                }
                
                e.ImageInfoList.Add(x);
            }
        }
    }
}