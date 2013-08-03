using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for PatientOperations
/// </summary>
public class PatientOperations
{
	public PatientOperations()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    /// <summary>
    /// Delete all the dependencies of this patient
    /// </summary>
    /// <param name="id">The patient ID</param>
    public static void DeleteDependencies(long id)
    {
        var ctx = new DataClassesDataContext();

        // patient only has visit dependency
        // Delete all visits belong to this patient
        // first, select all visits belong to this patients
        var visits = from v in ctx.Visits
                     where v.PatientID == id
                     select v;

        // delete all the visits dependencies first
        foreach (var visit in visits)
        {
            VisitOperations.DeleteDependencies(visit.ID);
        }
        // delete the visits
        ctx.Visits.DeleteAllOnSubmit(visits);

        // submit all the changes
        ctx.SubmitChanges();
    }
}