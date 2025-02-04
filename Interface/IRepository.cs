namespace DB_labb_3.Interface;

public interface IRepository<T>
{
    /// <summary>
    /// Get all data from the database
    /// </summary>
    /// <returns></returns>
    List<T> Get();

    /// <summary>
    /// Create a new entity in the database
    /// </summary>
    /// <param name="entity"></param>
    /// <returns></returns>
    T Create(T entity);
}
