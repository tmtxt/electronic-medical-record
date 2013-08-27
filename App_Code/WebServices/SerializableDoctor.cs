using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SerializableDoctor
/// </summary>
[Serializable]
public class SerializableDoctor
{
    public long ID { get; set; }

    public string Name { get; set; }

    public string Gender { get; set; }

    public long DateOfBirth { get; set; }

    public string LicenseNumber { get; set; }

    public string Address { get; set; }

	public SerializableDoctor()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}