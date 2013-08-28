using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

/// <summary>
/// Summary description for DoctorService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class DoctorService : System.Web.Services.WebService {

    DataClassesDataContext ctx;

    public DoctorService () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
        ctx = new DataClassesDataContext();
    }

    [WebMethod]
    public SerializableDoctor[] GetAllDoctors(int startIndex, int pageSize, string doctorName)
    {
        // convert null string to empty string
        var name = doctorName == null ? "" : doctorName;

        // select from database
        var result = ctx.Doctors.Where(d => d.Name.Contains(name)).Skip(startIndex).Take(pageSize).ToArray();

        // put it in the doctor array
        SerializableDoctor[] doctorList = new SerializableDoctor[result.Length];
        for (int i = 0; i < doctorList.Length; i++)
        {
            doctorList[i] = new SerializableDoctor();
            doctorList[i].ID = result[i].ID;
            doctorList[i].Name = result[i].Name;
            doctorList[i].Gender = result[i].Gender;
            doctorList[i].DateOfBirth = result[i].DateOfBirth;
            doctorList[i].LicenseNumber = result[i].LicenseNumber;
            doctorList[i].Address = result[i].Address;
        }

        // return the value
        return doctorList;
    }

    [WebMethod]
    public int GetITotalDoctorsCount()
    {
        var result = ctx.Doctors.Count();
        return result;
    }
    
}
