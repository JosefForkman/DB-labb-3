using DB_labb_3.adapters;
using DB_labb_3.Interface;
using DB_labb_3.Maper;
using DB_labb_3.Models;

namespace DB_labb_3.Repository;

public class RoleRepository : IRepository<Role>
{
    public Role Create(Role entity)
    {
        throw new NotImplementedException();
    }

    public List<Role> Get()
    {
        var query = "SELECT * FROM Role";
        var map = new RoleMap().Map;
        return Ado.Query(query, map);
    }

    public List<Role> Get(string columnName, int id)
    {
        var query = $"SELECT * FROM Role WHERE {columnName} = {id}";
        var map = new RoleMap().Map;
        return Ado.Query(query, map);
    }
}
