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
            DBTable.Employee => new EmployeeRepository() as IRepository<T>,
            DBTable.Class => new ClassRepository() as IRepository<T>,
            DBTable.Student => new StudentRepository() as IRepository<T>,
            _ => throw new ArgumentException("Invalid table"),
        };
    }
}
