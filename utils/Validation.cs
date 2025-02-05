namespace DB_labb_3.Utils;

/// <summary>
/// Validation class for validating input from user.
/// </summary>
public static class Validation
{
    /// <summary>
    /// Make sure input is not empty
    /// </summary>
    /// <param name="message"></param>
    /// <param name="errorInputName"></param>
    /// <returns></returns>
    public static string MakeSureNotEmpty(string message, string errorInputName)
    {
        string input;
        while ((input = Helpers.Ask(message).Trim()) == "")
        {
            Console.WriteLine($"{TextColor.Red}{errorInputName} får inte vara tomt{TextColor.Normal}");
        }
        return input;
    }

    /// <summary>
    /// Make sure object is not empty
    /// </summary>
    /// <typeparam name="T"></typeparam>
    /// <param name="obj"></param>
    /// <param name="message"></param>
    /// <returns></returns>
    public static bool ObjNotEmty<T>(List<T> obj, string message)
    {
        if (obj.Count == 0)
        {
            Console.WriteLine($"{TextColor.Red}{message}{TextColor.Normal}");
            return false;
        }
        return true;
    }
}
