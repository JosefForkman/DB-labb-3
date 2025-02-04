using System;

namespace DB_labb_3.Utils;

public static class Helpers
{

    public static string Ask(string question)
    {
        Console.WriteLine(question);
        return Console.ReadLine() ?? "";
    }
}
