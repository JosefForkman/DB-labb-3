using DB_labb_3.adapters;
using DB_labb_3.Interface;
using DB_labb_3.Maper;
using DB_labb_3.Models;
using Microsoft.Data.SqlClient;

namespace DB_labb_3.Repository;

public class ClassRepository : IRepository<Class>
{
    public Class Create(Class entity)
    {
        var query = "INSERT INTO class (name, start_date, end_date, mentor_id) VALUES (@name, @start_date, @end_date, @mentor_id);";
        var parameters = new SqlParameter[]
        {
            new SqlParameter("@name", entity.Name),
            new SqlParameter("@start_date", entity.StartDate),
            new SqlParameter("@end_date", entity.EndDate),
            new SqlParameter("@mentor_id", entity.MentorId)
        };

        Ado.Query(query, parameters);
        return entity;
    }

    public List<Class> Get()
    {
        var query = "SELECT * FROM Class";
        var map = new ClassMap().Map;

        return Ado.Query(query, map);
    }
}
