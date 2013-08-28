using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DoctorOperations
/// </summary>
public class DoctorOperations
{
	public DoctorOperations()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static void DeleteDependencies(long id)
    {
        var ctx = new DataClassesDataContext();

        // doctor's dependencies are visit and lab order

        // delete all visits
        var visits = from v in ctx.Visits
                     where v.DoctorID == id
                     select v;
        foreach (var visit in visits)
        {
            VisitOperations.DeleteDependencies(visit.ID);
        }
        ctx.Visits.DeleteAllOnSubmit(visits);

        // delete all lab orders
        var labOrders = from l in ctx.LabOrders
                        where l.DoctorID == id
                        select l;
        foreach (var labOrder in labOrders)
        {
            LabOrderOperations.DeleteDependencies(labOrder.ID);
        }
        ctx.LabOrders.DeleteAllOnSubmit(labOrders);

        // submit changes
        ctx.SubmitChanges();
    }
}