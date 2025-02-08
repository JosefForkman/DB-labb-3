using DB_labb_3.Enums;
using DB_labb_3.Interface;
using DB_labb_3.Repository;

namespace DB_labb_3.Factory;

public static class DbFactory
{
    public static IRepository<T>? GetRepository<T>(DBTable table)
    {
        return table switch
        {
            DBTable.Class => new ClassRepository() as IRepository<T>,
            DBTable.Employee => new EmployeeRepository() as IRepository<T>,
            DBTable.Role => new RoleRepository() as IRepository<T>,
            DBTable.RoleGroup => new RoleGropeRepository() as IRepository<T>,
            DBTable.Student => new StudentRepository() as IRepository<T>,
            DBTable.Subject => new SubjectRepository() as IRepository<T>,
            DBTable.Grade => new GradeRepository() as IRepository<T>,
            _ => throw new NotImplementedException("Table not implemented"),
        };
    }
}
