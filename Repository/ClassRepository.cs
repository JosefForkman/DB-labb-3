using System.Reflection;
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

        var classId = Ado.Query(query, parameters);

        if (classId == -1)
        {
            return new Class();
        }
       
        var classEntity = Get().First(c => c.Id == classId);
        
        return classEntity;
    }

    public List<Class> Get()
    {
        var query = "SELECT * FROM Class";
        var map = new ClassMap().Map;

        return Ado.Query(query, map);
    }

    public List<Class> Get(string columnName, int id)
    {
        throw new NotImplementedException();
    }
}
