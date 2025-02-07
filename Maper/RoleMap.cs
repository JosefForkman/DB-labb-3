using DB_labb_3.Interface;
using DB_labb_3.Models;
using Microsoft.Data.SqlClient;

namespace DB_labb_3.Maper;

public class RoleMap : IMap<Role>
{
    public Role Map(SqlDataReader record)
    {
        return new Role
        {
            Id = (int)record["id"],
            Name = (string)record["name"]
        };
    }
}
