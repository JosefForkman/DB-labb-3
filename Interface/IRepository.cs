namespace DB_labb_3.Interface;

public interface IRepository<T>
{
    /// <summary>
    /// Get all data from the database
    /// </summary>
    /// <returns></returns>
    List<T> GetAll();
}
