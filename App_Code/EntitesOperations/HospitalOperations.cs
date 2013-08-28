using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for HospitalOperations
/// </summary>
public class HospitalOperations
{
	public HospitalOperations()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static void DeleteDependencies(long id)
    {
        var ctx = new DataClassesDataContext();

        // Hospital dependencies are Visits

        // delete all visits
        var visits = from v in ctx.Visits
                     where v.HospitalID == id
                     select v;
        foreach (var visit in visits)
        {
            VisitOperations.DeleteDependencies(visit.ID);
        }
        ctx.Visits.DeleteAllOnSubmit(visits);

        // submit changes
        ctx.SubmitChanges();
    }
}