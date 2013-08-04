using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ICDOperations
/// </summary>
public class ICDOperations
{
	public ICDOperations()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static void DeleteDependencies(long id)
    {
        var ctx = new DataClassesDataContext();

        // ICD's dependencies are Visits
        // select all Visits associated with this ICD
        var visits = from v in ctx.Visits
                     where v.ICDID == id
                     select v;

        // delete all those visits' dependencies
        foreach (var visit in visits)
        {
            VisitOperations.DeleteDependencies(visit.ID);
        }

        // delete all those visits
        ctx.Visits.DeleteAllOnSubmit(visits);
        ctx.SubmitChanges();

    }
}