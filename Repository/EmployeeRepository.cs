using DB_labb_3.adapters;
using DB_labb_3.Interface;
using DB_labb_3.Maper;
using DB_labb_3.Models;
using Microsoft.Data.SqlClient;

namespace DB_labb_3.Repository;

public class EmployeeRepository : IRepository<Employee>
{
    public Employee Create(Employee entity)
    {
        var query = "INSERT INTO Employee (first_name, last_name) VALUES (@first_name, @last_name)";
        var parameters = new SqlParameter[]
        {
            new SqlParameter( "@first_name", entity.FirstName ),
            new SqlParameter( "@last_name", entity.LastName ),
        };

        Ado.Query(query, parameters);

        return entity;
    }

    public List<Employee> Get()
    {
        var query = "SELECT * FROM Employee";
        var map = new EmployeeMap().Map;

        return Ado.Query(query, map);
    }
}