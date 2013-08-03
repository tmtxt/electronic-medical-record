using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for LabOrderOperations
/// </summary>
public class LabOrderOperations
{
	public LabOrderOperations()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static void DeleteDependencies(long id)
    {
        var ctx = new DataClassesDataContext();

        // LabOrder's dependency is LabOrderDetail
        var labOrderDetails = from l in ctx.LabOrderDetails
                              where l.LabOrderID == id
                              select l;
        foreach (var labOrderDetail in labOrderDetails)
        {
            LabOrderDetailOperations.DeleteDependencies(labOrderDetail.ID);
        }
        ctx.LabOrderDetails.DeleteAllOnSubmit(labOrderDetails);

        // submit changes
        ctx.SubmitChanges();
    }
}