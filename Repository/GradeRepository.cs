using DB_labb_3.adapters;
using DB_labb_3.Interface;
using DB_labb_3.Maper;
using DB_labb_3.Models;
using Microsoft.Data.SqlClient;

namespace DB_labb_3.Repository;

public class GradeRepository : IRepository<Grade>
{
    public Grade Create(Grade entity)
    {
        throw new NotImplementedException();
    }

    public List<Grade> Get()
    {
        throw new NotImplementedException();
    }

    public List<Grade> Get(string columnName, int id)
    {
        var SQL = $"SELECT * FROM Grade WHERE {columnName} = {id}";
        var Parameters = new SqlParameter[]
        {
            new SqlParameter("@id", id)
        };
        var Map = new GradeMap().Map;

        return Ado.Query(SQL, Map, Parameters);
    }
}
