using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for VisitsData
/// </summary>
public class VisitsData
{
    // the total number of visits
    private static int totalVisits = 0;

    // the select criteria
    private static string searchPatientID;
    private static string searchDoctorID;
    private static string searchHospitalID;
    private static string searchStartTime;
    private static string searchEndTime;

	public VisitsData()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    [DataObjectMethod(DataObjectMethodType.Select)]
    public static IEnumerable<Visit> GetAllVisits(int startIndex, int pageSize, string sortBy)
    {
        // sort by ID by default
        if (string.IsNullOrEmpty(sortBy))
            sortBy = "ID";

        // select the data from database
        var ctx = new DataClassesDataContext();
        var result = ctx.Visits;

        // count the number of visits
        totalVisits = ctx.Visits.Count();
        
        return result;

    }

    public static int GetTotalVisitsCount()
    {
        return totalVisits;
    }
}