using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

/// <summary>
/// Summary description for HospitalService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class HospitalService : System.Web.Services.WebService {

    DataClassesDataContext ctx;

    public HospitalService () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
        ctx = new DataClassesDataContext();
    }

    [WebMethod]
    public SerializableHospital[] GetAllHospitals(int startIndex, int pageSize, string hospitalName)
    {
        // convert null string to empty string
        var name = hospitalName == null ? "" : hospitalName;

        // select from database
        var result = ctx.Hospitals.Where(h => h.Name.Contains(name)).Skip(startIndex).Take(pageSize).ToArray();

        // put it in the doctor array
        SerializableHospital[] hospitalList = new SerializableHospital[result.Length];
        for (int i = 0; i < hospitalList.Length; i++)
        {
            hospitalList[i] = new SerializableHospital();
            hospitalList[i].ID = result[i].ID;
            hospitalList[i].Name = result[i].Name;
            hospitalList[i].LicenseNumber = result[i].LicenseNumber;
            hospitalList[i].Address = result[i].Address;
        }

        // return the value
        return hospitalList;
    }

    [WebMethod]
    public int GetTotalHospitalsCount()
    {
        var result = ctx.Hospitals.Count();
        return result;
    }
    
}
