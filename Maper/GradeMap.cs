using System;
using DB_labb_3.Interface;
using DB_labb_3.Models;
using Microsoft.Data.SqlClient;

namespace DB_labb_3.Maper;

public class GradeMap : IMap<Grade>
{
    public Grade Map(SqlDataReader record)
    {
        return new Grade
        {
            Id = (int)record["Id"],
            Level = (string)record["Level"],
            CreatedAt = (DateTime)record["CreatedAt"],
            UpdatedAt = (DateTime)record["UpdatedAt"],
            SubjectId = (int)record["SubjectId"],
            EmployeeId = (int)record["EmployeeId"],
            StudentId = (int)record["StudentId"],
        };
    }
}
