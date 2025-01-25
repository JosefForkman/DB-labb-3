using System;

namespace DB_labb_3.Data;

/// <summary>
/// Singleton class for connecting to the database
/// </summary>
public sealed class Db
{
    private static readonly SkolaJosefContext _Instance = new SkolaJosefContext();

    private Db()
    {
        // This is a singleton class
    }

    /// <summary>
    /// Connect to the database
    /// </summary>
    /// <returns>EF context to DB</returns>
    public static SkolaJosefContext Connect()
    {
        return _Instance;
    }
}
