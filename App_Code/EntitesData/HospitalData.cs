using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for HospitalData
/// </summary>
public class HospitalData
{
    // criteria for searching
    public static string SearchHospitalName { get; set; }

	public HospitalData()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    [DataObjectMethod(DataObjectMethodType.Select)]
    public static IEnumerable<HospitalServiceReference.SerializableHospital>
        GetAllHospitals(int startIndex, int pageSize, string sortBy)
    {
        // declare the web service
        var service = new HospitalServiceReference.HospitalServiceSoapClient();

        // select the data from database, sort by date by default
        HospitalServiceReference.SerializableHospital[] hospitalList =
            service.GetAllHospitals(startIndex, pageSize, SearchHospitalName);

        return hospitalList;

    }

    public static int GetTotalHospitalsCount()
    {
        // declare the web service
        var service = new HospitalServiceReference.HospitalServiceSoapClient();

        // get the item count
        var result = service.GetTotalHospitalsCount();

        return result;
    }
}