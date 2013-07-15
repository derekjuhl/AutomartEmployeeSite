using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



public partial class _Default : System.Web.UI.Page
{

    /*********************************************
     * This class is the default web form
     * when a customer drives up to automart
     * the employee enters their license plate number
     * if they have services on record it will retrieve
     * their name, vehicle information, dates, times
     * and locations of their services and the last
     * service performed. If they are not listed
     * the employee will be prompted to register the vehicle
     * before proceeding
     * *********************************************/
    //initalize the automart entities object
     AutomartEntities autoEntities = new AutomartEntities();

     protected void Page_Load(object sender, EventArgs e)
     {
        
     }

    protected void btnGetVehicle_Click(object sender, EventArgs e)
    {
        //call the GetVehicle method
        GetVehicle();
    }

    private void GetVehicle()
    {

        //call the stored procedure through the entities object
        //pass it the required parameters
        //store the stored proc results in a variable
        var veh = autoEntities.usp_GetVehicleandCustomerInfo(txtLicense.Text);

        //we will need the Vehicle ID
        //this variable is to store it
        int ID = 0;

        //we bind the query to the query list
        DataList1.DataSource = veh.ToList();
        DataList1.DataBind();

        //I call the stored proc again to get the vehicleID
        //you can only iterate through a result set once per var
        var vehID = autoEntities.usp_GetVehicleandCustomerInfo(txtLicense.Text);
        foreach (var v in vehID)
        {
            ID = v.VehicleID;
            //having got the vehicleID I store it
            //in a session variable
            //so it can be accessed from any page
            Session["VehicleID"]=ID;
        }

       
        //if there is no VehicleID then the employee
        //is directed to register the vehicle
        if (ID == 0)
        {
            lblResult.Text = "Vehicle Not found Please Register.";
            return;
        }

        //if all is well call the GetVehicleServices method
       
       GetVehicleServices(ID);

    }

    private void GetVehicleServices(int vehicleID)
    {
        //variable to store the vehicleserviceID
        int ID = 0;
        //call the stored proc
        var serv = autoEntities.usp_Services(vehicleID);
        //bind it to the datalist control
        DataList2.DataSource = serv.ToList();
        DataList2.DataBind();

        //call it again to iterate through and get
        //the vehicleServiceID
        var servID = autoEntities.usp_Services(vehicleID);
        foreach (var s in servID)
        {
            ID = s.VehicleServiceID;
        }

    //call the next method
        GetVehicleServicesDetail(ID);

    }

    private void GetVehicleServicesDetail(int vehicleServiceID)
    {

        //call the stored proc through the entities and
        //assign the bind the results to the Grid view
        var det = autoEntities.usp_ServiceDetails(vehicleServiceID);

        GridView1.DataSource = det.ToList();
        GridView1.DataBind();
    }
    protected void btnRegisterVehicl_Click(object sender, EventArgs e)
    {
        //If the employee needs to register the vehicle
        //redirect to that page
        Response.Redirect("Default2.aspx");
    }
    protected void btnNewService_Click(object sender, EventArgs e)
    {
        //if all is well go to record today's service
        Response.Redirect("Default3.aspx");
    }
}