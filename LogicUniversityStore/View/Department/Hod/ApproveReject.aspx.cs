﻿using LogicUniversityStore.Controller;
using LogicUniversityStore.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LogicUniversityStore.View.Department.Hod
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        public ApproveRejectReqController reqController = new ApproveRejectReqController();
        protected void Page_Load(object sender, EventArgs e)
        {
           if(!IsPostBack)
            {
                LUUser user = (LUUser)Session["User"];
                int depId = user.DepartmentID.Value;
                gvRequestedRequisition.DataSource = reqController.getRequestedRequisitionHod(depId);
                gvRequestedRequisition.DataBind();               
            }
        }       
        protected void gvRequestedRequisition_SelectedIndexChanged(object sender, EventArgs e)
        {
            int reqId=Convert.ToInt32(gvRequestedRequisition.SelectedRow.Cells[1].Text);         
            Response.Redirect("ApproveRejectRequisitionItems.aspx?id="+reqId+"");
        }        
    }
}