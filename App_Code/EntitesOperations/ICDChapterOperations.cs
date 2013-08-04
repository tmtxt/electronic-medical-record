using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ICDChapterOperations
/// </summary>
public class ICDChapterOperations
{
	public ICDChapterOperations()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static void DeleteDependencies(long id)
    {
        var ctx = new DataClassesDataContext();

        // ICD Chapter's dependencies are ICDs
        // select all ICD
        var ICDs = from i in ctx.ICDs
                   where i.ICDChapterID == id
                   select i;

        // delete all those ICD's dependencies
        foreach (var ICD in ICDs)
        {
            ICDOperations.DeleteDependencies(ICD.ID);
        }

        // delete all those ICD
        ctx.ICDs.DeleteAllOnSubmit(ICDs);
        ctx.SubmitChanges();
    }
}