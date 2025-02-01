using DB_labb_3.adapters;
using DB_labb_3.Interface;
using DB_labb_3.Maper;
using DB_labb_3.Models;

namespace DB_labb_3.Repository;

public class StudentRepository : IRepository<Student>
{
    public List<Student> GetAll()
    {
        var query = "SELECT * FROM Student";
        var map = new StudentMap().Map;

        return Ado.Query(query, map);
    }
}
