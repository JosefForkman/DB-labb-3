using System.Reflection;
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

        int lastInsertedID = Ado.Query(query, parameters);

        var employee = Get().First(employee => employee.Id == lastInsertedID);

        return employee;
    }

    public List<Employee> Get()
    {
        var query = "SELECT * FROM Employee";
        var map = new EmployeeMap().Map;

        return Ado.Query(query, map);
    }

    public List<Employee> Get(PropertyInfo columnName, int id)
    {
        throw new NotImplementedException();
    }
}