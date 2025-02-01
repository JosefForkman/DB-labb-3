using DB_labb_3.Interface;
using DB_labb_3.Models;
using Microsoft.Data.SqlClient;

namespace DB_labb_3.Maper;

public class StudentMap : IMap<Student>
{
    public Student Map(SqlDataReader record)
    {
        return new Student
        {
            Id = (int)record["id"],
            FirstName = (string)record["first_name"],
            LastName = (string)record["last_name"],
            PersonalCodeNumber = (string)record["personal_code_number"],
        };
    }
}
