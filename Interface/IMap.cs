using System;
using Microsoft.Data.SqlClient;

namespace DB_labb_3.Interface;

public interface IMap<T>
{
    T Map(SqlDataReader record);
}
