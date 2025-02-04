using System;
using Microsoft.Data.SqlClient;

namespace DB_labb_3.Interface;

public interface IMap<T>
{
    /// <summary>
    /// Map a SqlDataReader to a object.
    /// </summary>
    /// <param name="record"></param>
    /// <returns></returns>
    T Map(SqlDataReader record);
}
