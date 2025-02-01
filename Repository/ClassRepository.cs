using DB_labb_3.adapters;
using DB_labb_3.Interface;
using DB_labb_3.Maper;
using DB_labb_3.Models;

namespace DB_labb_3.Repository;

public class ClassRepository : IRepository<Class>
{
    public List<Class> GetAll()
    {
        var query = "SELECT * FROM Class";
        var map = new ClassMap().Map;

        return Ado.Query(query, map);
    }
}
