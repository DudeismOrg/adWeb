﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LogicUniversityStore.View.Store.Reports
{
    public partial class DisplaySupplierReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SupplierReport srpt = new SupplierReport();
            CrystalReportViewer1.ReportSource = srpt;
            CrystalReportViewer1.Zoom(90);
        }
    }
}