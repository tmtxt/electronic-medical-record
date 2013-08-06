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
    private static string SearchPatientName = "";
    private static string SearchDoctorName = "";
    private static string SearchHospitalName = "";
    private static long SearchStartTime;
    private static long SearchEndTime;

	public VisitsData()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    [DataObjectMethod(DataObjectMethodType.Select)]
    public static IEnumerable<Visit> GetAllVisits(int startIndex, int pageSize, string sortBy)
    {
        // select the data from database, sort by date by default
        var ctx = new DataClassesDataContext();
        var result = ctx.Visits.Where(v => v.Patient.Name.Contains(SearchPatientName)
            && v.Doctor.Name.Contains(SearchDoctorName) && v.Hospital.Name.Contains(SearchHospitalName)
            && v.Date >= SearchStartTime && v.Date <= SearchEndTime)
            .OrderByDescending(v => v.Date)
            .Skip(startIndex)
            .Take(pageSize);

        // count the number of visits
        totalVisits = ctx.Visits.Where(v => v.Patient.Name.Contains(SearchPatientName)
            && v.Doctor.Name.Contains(SearchDoctorName) && v.Hospital.Name.Contains(SearchHospitalName)
            && v.Date >= SearchStartTime && v.Date <= SearchEndTime)
            .Count();
        
        return result;

    }

    public static void SetPatientName(string name)
    {
        SearchPatientName = name;
    }

    public static void SetDoctorName(string name)
    {
        SearchDoctorName = name;
    }

    public static void SetHospitalName(string name)
    {
        SearchHospitalName = name;
    }

    public static void SetStartDate(long date)
    {
        SearchStartTime = date;
    }

    public static void SetEndDate(long date)
    {
        SearchEndTime = date;
    }

    public static int GetTotalVisitsCount()
    {
        return totalVisits;
    }
}