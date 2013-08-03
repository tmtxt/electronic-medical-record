using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for MedicalServiceOperations
/// </summary>
public class MedicalServiceOperations
{
	public MedicalServiceOperations()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static void DeleteDependencies(long id)
    {
        // medical service has dependency lab order detail
        var ctx = new DataClassesDataContext();

        var labOrderDetails = from l in ctx.LabOrderDetails
                              where l.MedicalServiceID == id
                              select l;
        foreach (var labOrderDetail in labOrderDetails)
        {
            LabOrderDetailOperations.DeleteDependencies(labOrderDetail.ID);
        }
        ctx.LabOrderDetails.DeleteAllOnSubmit(labOrderDetails);

        //submit changes
        ctx.SubmitChanges();
    }
}