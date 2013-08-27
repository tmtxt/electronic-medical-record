using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DoctorData
/// </summary>
public class DoctorData
{
	public DoctorData()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    [DataObjectMethod(DataObjectMethodType.Select)]
    public static IEnumerable<DoctorServiceReference.SerializableDoctor> GetAllDoctors(int startIndex, int pageSize, string sortBy)
    {
        // declare the web service
        var service = new DoctorServiceReference.DoctorServiceSoapClient();

        // select the data from database, sort by date by default
        DoctorServiceReference.SerializableDoctor[] doctorList = service.GetAllDoctors(startIndex, pageSize);

        return doctorList;

    }

    public static int GetTotalDoctorsCount()
    {
        // declare the web service
        var service = new DoctorServiceReference.DoctorServiceSoapClient();

        // get the item count
        var result = service.GetITotalDoctorsCount();

        return result;
    }
}