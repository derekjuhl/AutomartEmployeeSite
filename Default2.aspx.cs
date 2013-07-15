using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    /***************************************
     * This form enters a new vehicle and the person who
     * owns it.
     * **************************************/
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        RegisterVehicle();
    }

    private void RegisterVehicle()
    {
        //here again we initiate the automart entities object
        AutomartEntities ae = new AutomartEntities();

        try
        {
            
            int vID =0;
            //We call the AddNewVehicle procedure and pass its parameters
            //from the text boxes. They really should be validated
            //first
            ae.usp_AddNewVehicle(txtLastName.Text, txtFirstName.Text, txtLicense.Text, txtMake.Text, txtYear.Text);
            var lic=ae.usp_GetVehicleandCustomerInfo(txtLicense.Text);

            foreach (var l in lic)
            {
                vID = l.VehicleID;
                //Write the vehicleID to a session variable
                Session["VehicleID"]=vID;
            }

            lblResult.Text = "Saved";
        }
        catch (Exception ex)
        {
            lblResult.Text = ex.Message;
        }
    }
    protected void btnTodaysService_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default3.aspx");
    }
}