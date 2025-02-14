using System.Data;
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
        var SQL = "setStudentGrades";
        var Parameters = new SqlParameter[]
        {
            new SqlParameter("@level", entity.Level),
            new SqlParameter("@student_id", entity.StudentId),
            new SqlParameter("@employee_id", entity.EmployeeId),
            new SqlParameter("@subject_id", entity.SubjectId),
        };
        var GradeId = Ado.Query(SQL, Parameters, CommandType.StoredProcedure);

        if (GradeId == -1)
        {
            return new Grade();
        }
        
        var grade = Get("id", GradeId).First();

        return grade;
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
