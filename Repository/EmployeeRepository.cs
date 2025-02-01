using DB_labb_3.adapters;
using DB_labb_3.Interface;
using DB_labb_3.Maper;
using DB_labb_3.Models;

namespace DB_labb_3.Repository;

public class EmployeeRepository : IRepository<Employee>
{
    public List<Employee> GetAll()
    {
        var query = "SELECT * FROM Employee";
        var map = new EmployeeMap().Map;

        return Ado.Query(query, map);
    }
}