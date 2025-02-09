using DB_labb_3.Interface;
using DB_labb_3.Models;
using Microsoft.Data.SqlClient;

namespace DB_labb_3.Maper;

public class EmployeeMap : IMap<Employee>
{
    public Employee Map(SqlDataReader record)
    {
        return new Employee
        {
            Id = (int)record["id"],
            FirstName = (string)record["first_name"],
            LastName = (string)record["last_name"],
            Salary = (decimal?)record["salary"]
        };
    }
}
