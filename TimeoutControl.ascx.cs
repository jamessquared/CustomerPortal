﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CustomerPortal
{
    public partial class TimeoutControl : System.Web.UI.UserControl
    {
        public string TimeOutUrl = "~/Default.aspx";

        public int PopupShowDelay
        {
            get { return 60000 * (Session.Timeout - 1); }
        }

        protected string QuotedTimeOutUrl
        {
            get { return '"' + ResolveClientUrl(TimeOutUrl).Replace("\"", "\\\"") + '"'; }
        }
    }
}