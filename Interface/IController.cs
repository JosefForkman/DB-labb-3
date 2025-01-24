using System;

namespace DB_labb_3.Interface;

public interface IController
{
    /// <summary>
    /// Get specific data from database
    /// </summary>
    public void Index();

    /// <summary>
    /// Get all data from database
    /// </summary>
    public void Show();

    /// <summary>
    /// Create new data in database
    /// </summary>
    public void Create();
    /// <summary>
    /// Update data in database
    /// </summary>
    public void Update();
    /// <summary>
    /// Delete data in database
    /// </summary>
    public void Destroy();
}
