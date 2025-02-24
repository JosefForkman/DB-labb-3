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
            CreatedAt = (DateTime)record["created_at"],
            UpdatedAt = (DateTime)record["updated_at"],
            SubjectId = (int)record["subject_Id"],
            EmployeeId = (int)record["employee_Id"],
            StudentId = (int)record["student_Id"],
        };
    }
}
