using DB_labb_3.Interface;
using DB_labb_3.Models;
using Microsoft.Data.SqlClient;

namespace DB_labb_3.Maper;

public class ClassMap : IMap<Class> 
{
    public Class Map(SqlDataReader record)
    {
        return new Class
        {
            Id = (int)record["id"],
            Name = (string)record["name"],
            StartDate = (DateTime)record["start_date"],
            EndDate = (DateTime)record["end_date"],
        };
    }
}
