using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DrugOperations
/// </summary>
public class DrugOperations
{
	public DrugOperations()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static void DeleteDependencies(long id)
    {
        var ctx = new DataClassesDataContext();

        // drug's denpendency is prescription detail
        var prescriptionDetails = from p in ctx.PrescriptionDetails
                                  where p.DrugID == id
                                  select p;

        // delete all their dependencies
        foreach (var prescriptionDetail in prescriptionDetails)
        {
            PrescriptionDetailOperations.DeleteDependencies(prescriptionDetail.ID);
        }

        // delete all those prescription details
        ctx.PrescriptionDetails.DeleteAllOnSubmit(prescriptionDetails);
        ctx.SubmitChanges();
    }
}