using System.Data;
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
    /// <param name="commandType"></param>
    /// <returns></returns>
    public static List<T> Query<T>(string query, Func<SqlDataReader, T> map, CommandType commandType = CommandType.Text)
    {
        var list = new List<T>();
        using var connection = new SqlConnection(ConnectionString);
        connection.Open();

        using var command = new SqlCommand(query, connection);
        command.CommandType = commandType;
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
    /// <typeparam name="T"></typeparam>
    /// <param name="query"></param>
    /// <param name="map"></param>
    /// <param name="parameters"></param>
    /// <param name="commandType"></param>
    /// <returns></returns>
    public static List<T> Query<T>(string query, Func<SqlDataReader, T> map, SqlParameter[] parameters, CommandType commandType = CommandType.Text)
    {
        var list = new List<T>();
        using var connection = new SqlConnection(ConnectionString);
        connection.Open();

        using var command = new SqlCommand(query, connection);
        command.CommandType = commandType;
        command.Parameters.AddRange(parameters);

        using var reader = command.ExecuteReader();

        while (reader.Read())
        {
            if (reader.HasRows)
            {
                list.Add(map(reader));
            }
        }

        connection.Close();
        return list;
    }

    /// <summary>
    /// Execute a query.
    /// </summary>
    /// <param name="query"></param>
    /// <param name="parameters"></param>
    /// <param name="commandType"></param>
    /// <returns>The last inserted id and if id does not exist returns -1</returns>
    public static int Query(string query, SqlParameter[] parameters, CommandType commandType = CommandType.Text)
    {
        using var connection = new SqlConnection(ConnectionString);
        connection.Open();

        // Execute the query
        using (var command = new SqlCommand(query, connection))
        {
            command.CommandType = commandType;
            command.Parameters.AddRange(parameters);

            // Execute the query
            command.ExecuteNonQuery();
        }

        // Get the last inserted id
        using (var command = new SqlCommand("SELECT @@identity", connection))
        {
            // Execute the query
            var idResult = command.ExecuteScalar();

            // Check if the result is null
            if (idResult == DBNull.Value || idResult == null)
            {
                return -1;
            }

            // Return the id
            return Convert.ToInt32(idResult); ;
        }
    }
}
