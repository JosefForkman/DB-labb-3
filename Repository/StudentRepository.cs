using DB_labb_3.adapters;
using DB_labb_3.Interface;
using DB_labb_3.Maper;
using DB_labb_3.Models;
using Microsoft.Data.SqlClient;

namespace DB_labb_3.Repository;

public class StudentRepository : IRepository<Student>
{
    public Student Create(Student entity)
    {
        var query = "INSERT INTO Student (first_name, last_name, PersonalCodeNumber) VALUES (@first_name, @last_name, @PersonalCodeNumber)";
        var parameters = new SqlParameter[]
        {
            new SqlParameter( "@first_name", entity.FirstName ),
            new SqlParameter( "@last_name", entity.LastName ),
            new SqlParameter( "@PersonalCodeNumber", entity.PersonalCodeNumber ),
        };

        Ado.Query(query, parameters);

        return entity;
    }

    public List<Student> Get()
    {
        var query = "SELECT * FROM Student";
        var map = new StudentMap().Map;

        return Ado.Query(query, map);
    }
}
