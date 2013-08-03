using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for PrescriptionOperations
/// </summary>
public class PrescriptionOperations
{
	public PrescriptionOperations()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static void DeleteDependencies(long id)
    {
        var ctx = new DataClassesDataContext();

        // Prescription's dependency is PrescriptionDetail
        var prescriptionDetails = from p in ctx.PrescriptionDetails
                                  where p.PrescriptionID == id
                                  select p;
        foreach (var prescriptionDetail in prescriptionDetails)
        {
            PrescriptionDetailOperations.DeleteDependencies(prescriptionDetail.ID);
        }
        ctx.PrescriptionDetails.DeleteAllOnSubmit(prescriptionDetails);

        // submit all changes
        ctx.SubmitChanges();
    }
}