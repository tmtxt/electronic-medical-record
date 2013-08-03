using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for MedicalServiceGroupOperations
/// </summary>
public class MedicalServiceGroupOperations
{
	public MedicalServiceGroupOperations()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static void DeleteDependencies(long id)
    {
        var ctx = new DataClassesDataContext();

        // medical service group's dependencies are medical service
        var medicalServices = from m in ctx.MedicalServices
                              where m.MedicalServiceGroupID == id
                              select m;
        foreach (var medicalService in medicalServices)
        {
            MedicalServiceOperations.DeleteDependencies(medicalService.ID);
        }
        ctx.MedicalServices.DeleteAllOnSubmit(medicalServices);

        // submit changes
        ctx.SubmitChanges();
    }
}