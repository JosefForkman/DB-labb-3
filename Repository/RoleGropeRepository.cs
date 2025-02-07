using System.Reflection;
using DB_labb_3.adapters;
using DB_labb_3.Interface;
using DB_labb_3.Maper;
using DB_labb_3.Models;
using Microsoft.Data.SqlClient;

namespace DB_labb_3.Repository;

public class RoleGropeRepository : IRepository<RoleGrope>
{
    public RoleGrope Create(RoleGrope entity)
    {
        var query = "INSERT INTO RoleGrope (employee_id, role_id) VALUES (@employee_id, @role_id);";
        var parameters = new SqlParameter[]
        {
            new SqlParameter("@employee_id", entity.EmployeeId),
            new SqlParameter("@role_id", entity.RoleId)
        };
        entity.Id = Ado.Query(query, parameters);
        return entity;
    }

    public List<RoleGrope> Get()
    {
        var query = "SELECT * FROM RoleGrope";
        var map = new RoleGropeMap().Map;
        return Ado.Query(query, map);
    }

    public List<RoleGrope> Get(string columnName, int id)
    {
        var query = $"SELECT * FROM role_grope WHERE {columnName} = @id";
        var map = new RoleGropeMap().Map;
        var parameters = new SqlParameter[]
        {
            new SqlParameter("@id", id)
        };

        return Ado.Query(query, map, parameters);
    }
}
