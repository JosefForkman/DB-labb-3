using System.Reflection;

namespace DB_labb_3.Interface;

public interface IRepository<T>
{
    /// <summary>
    /// Get all data from the database
    /// </summary>
    /// <returns></returns>
    List<T> Get();

    /// <summary>
    /// Get data from the database by id
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    List<T> Get(PropertyInfo columnName, int id);

    /// <summary>
    /// Create a new entity in the database
    /// </summary>
    /// <param name="entity"></param>
    /// <returns></returns>
    T Create(T entity);
}
