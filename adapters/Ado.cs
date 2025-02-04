using Microsoft.Data.SqlClient;

namespace DB_labb_3.adapters;

public class Ado
{
    public static string ConnectionString { get; set; } = "Data Source=db; Database=SkolaJosef; User id = sa; Password = P@ssw0rd; Trust Server Certificate=True;";

    /// <summary>
    /// Execute a query.
    /// </summary>
    /// <typeparam name="T"></typeparam>
    /// <param name="query"></param>
    /// <param name="map"></param>
    /// <returns></returns>
    public static List<T> Query<T>(string query, Func<SqlDataReader, T> map)
    {
        var list = new List<T>();
        using var connection = new SqlConnection(ConnectionString);
        connection.Open();

        using var command = new SqlCommand(query, connection);
        using var reader = command.ExecuteReader();

        while (reader.Read())
        {
            list.Add(map(reader));
        }
        connection.Close();
        return list;
    }

    /// <summary>
    /// Execute a query.
    /// </summary>
    /// <param name="query"></param>
    /// <param name="parameters"></param>
    /// <returns>The last inserted id</returns>
    public static int Query(string query, SqlParameter[] parameters)
    {
        using var connection = new SqlConnection(ConnectionString);
        connection.Open();

        using var command = new SqlCommand(query + "; SELECT SCOPE_IDENTITY()", connection);
        command.Parameters.AddRange(parameters);

        // Execute the query and get the last inserted id
        var result = command.ExecuteScalar();
        var id = Convert.ToInt32(result);

        connection.Close();
        return id;
    }
}
