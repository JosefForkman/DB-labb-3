using Microsoft.Data.SqlClient;

namespace DB_labb_3.adapters;

public class Ado
{
    public static string ConnectionString { get; set; } = "Data Source=db; Database=SkolaJosef; User id = sa; Password = P@ssw0rd; Trust Server Certificate=True;";

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

        return list;
    }
}
