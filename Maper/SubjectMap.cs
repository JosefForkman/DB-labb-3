using System;
using DB_labb_3.Interface;
using DB_labb_3.Models;
using Microsoft.Data.SqlClient;

namespace DB_labb_3.Maper;

public class SubjectMap : IMap<Subject>
{
    public Subject Map(SqlDataReader record)
    {
        return new Subject
        {
            Id = (int)record["Id"],
            Name = (string)record["Name"],
            Discription = (string)record["Discription"],
        };
    }
}
