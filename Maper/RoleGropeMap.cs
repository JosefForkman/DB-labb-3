using DB_labb_3.Interface;
using DB_labb_3.Models;
using Microsoft.Data.SqlClient;

namespace DB_labb_3.Maper;

public class RoleGropeMap : IMap<RoleGrope>
{
    public RoleGrope Map(SqlDataReader record)
    {
        return new RoleGrope
        {
            Id = (int)record["id"],
            EmployeeId = (int)record["employee_id"],
            RoleId = (int)record["role_id"],
        };
    }
}
