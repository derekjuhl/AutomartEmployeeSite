using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

public partial class Default3 : System.Web.UI.Page
{
    /***********************************
     * This class initializes the service and then
     * allows the employee to add serice details
     * as needed
     * **********************************/
    AutomartEntities ae = new AutomartEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        //If there is no session variable redirect them back
        //to the main page
        if (Session["VehicleID"] == null)
        {
            Response.Redirect("Default2.aspx");
        }
    }

    protected void btnBegin_Click(object sender, EventArgs e)
    {
        //this starts the vehicleService
        //It writes to the Employee.VehicleService table
        //I just hard coded the location
        //we get the vehicleID from the session
        int vehID = (int)Session["VehicleID"];
        int LocationID = 1;
        ae.usp_AddVehicleService(vehID, LocationID);

     }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        //This writes the individual service detail
        //It can be run as many times as services performed
        //We get the autoserviceID from the RadioButtonList selected value
        int serviceID = int.Parse(RadioButtonList1.SelectedValue.ToString());
        //sets up the xml comment
        string note = "<Comments xmlns='http://www.automart.com/comments'> <comment>" + txtNotes.Text + "</comment></Comments>";

        //I did this as a literal because I couldn't make the parse work
        decimal percent = .05m;
        //run the stored proc
       ae.usp_AddServiceDetails(serviceID,percent,note);

        //get ready for the next entry
        txtDiscount.Text = "";
        txtNotes.Text = "";
    
    }
    protected void btnEnd_Click(object sender, EventArgs e)
    {
        //this is probably not necessary but it gives a completion
        //to the work flow
        Session["VehicleID"] = null;
        Response.Redirect("Default.aspx");
    }
}