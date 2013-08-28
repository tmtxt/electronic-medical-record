using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SerializableHospital
/// </summary>
[Serializable]
public class SerializableHospital
{
	public SerializableHospital()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public long ID { get; set; }

    public string Name { get; set; }

    public string LicenseNumber { get; set; }

    public string Address { get; set; }
}