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

        int employeeId = Ado.Query(query, parameters);

        if (employeeId == -1)
        {
            return new Employee();
        }

        var employee = Get().First(employee => employee.Id == employeeId);

        return employee;
    }

    public List<Employee> Get()
    {
        var query = "SELECT * FROM Employee";
        var map = new EmployeeMap().Map;

        return Ado.Query(query, map);
    }

    public List<Employee> Get(string columnName, int id)
    {
        var query = $"SELECT * FROM Employee WHERE {columnName} = @id";
        var parameters = new SqlParameter[]
        {
            new SqlParameter("@id", id)
        };
        var map = new EmployeeMap().Map;

        return Ado.Query(query, map, parameters);
    }
}