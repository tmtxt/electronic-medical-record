using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for VisitOperations
/// </summary>
public class VisitOperations
{
	public VisitOperations()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    /// <summary>
    /// Delete all the dependencies of this visit
    /// </summary>
    /// <param name="id">ID of the Visit</param>
    public static void DeleteDependencies(long id)
    {
        var ctx = new DataClassesDataContext();

        // Visit's dependencies are Prescription and LabOrder

        // delete all LabOrder
        var labOrders = from l in ctx.LabOrders
                        where l.VisitID == id
                        select l;
        foreach (var labOrder in labOrders)
        {
            LabOrderOperations.DeleteDependencies(labOrder.ID);
        }
        ctx.LabOrders.DeleteAllOnSubmit(labOrders);

        //delete all Prescription
        var prescriptions = from p in ctx.Prescriptions
                            where p.VisitID == id
                            select p;
        foreach (var prescription in prescriptions)
        {
            PrescriptionOperations.DeleteDependencies(prescription.ID);
        }
        ctx.Prescriptions.DeleteAllOnSubmit(prescriptions);

        //submit all changes
        ctx.SubmitChanges();
    }
}