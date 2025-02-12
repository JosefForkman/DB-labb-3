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

    public StoreProcedure StoreProcedureMap(SqlDataReader record)
    {
        return new StoreProcedure
        {
            StudentName = (string)record["student_name"],
            TeacherName = (string)record["teacher_name"],
            ClassName = (string)record["class_name"],
            Start = (DateTime)record["start"],
            End = (DateTime)record["end"],
        };
    }
};

public class StoreProcedure
{
    public string StudentName { get; set; }
    public string TeacherName { get; set; }
    public string ClassName { get; set; }
    public DateTime Start { get; set; }
    public DateTime End { get; set; }
}



