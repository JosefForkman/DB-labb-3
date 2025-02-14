using System;
using DB_labb_3.adapters;
using DB_labb_3.Interface;
using DB_labb_3.Maper;
using DB_labb_3.Models;
using Microsoft.Data.SqlClient;

namespace DB_labb_3.Repository;

public class SubjectRepository : IRepository<Subject>
{
    public Subject Create(Subject entity)
    {
        throw new NotImplementedException();
    }

    public List<Subject> Get()
    {
        var query = "SELECT * FROM Subject";
        var map = new SubjectMap().Map;

        return Ado.Query(query, map);
    }

    public List<Subject> Get(string columnName, int id)
    {
        var query = $"SELECT * FROM Subject WHERE {columnName} = @id";
        var parameters = new SqlParameter[]
        {
            new SqlParameter("@id", id)
        };
        var map = new SubjectMap().Map;

        return Ado.Query(query, map, parameters);
    }
}
