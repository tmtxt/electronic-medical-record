using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DrugGroupOperations
/// </summary>
public class DrugGroupOperations
{
	public DrugGroupOperations()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static void DeleteDependencies(long id)
    {
        var ctx = new DataClassesDataContext();

        // drug group's depency is drug
        // select all drugs belong to this deug group
        var drugs = from d in ctx.Drugs
                    where d.DrugGroupID == id
                    select d;

        // delete all their dependencies
        foreach (var drug in drugs)
        {
            DrugOperations.DeleteDependencies(drug.ID);
        }

        // delete those drugs
        ctx.Drugs.DeleteAllOnSubmit(drugs);
        ctx.SubmitChanges();

    }
}