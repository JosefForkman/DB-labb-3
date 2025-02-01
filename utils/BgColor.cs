using System;

namespace DB_labb_3.Utils;
/// <summary>
/// Get the ANSI escape sequences for the given color
/// </summary>
public static class BgColor
{
    public static string Normal { get; } = "\x1b[49m";
    public static string BrightBlack { get; } = "\x1b[100m";
    public static string BrightRed { get; } = "\x1b[101m";
    public static string BrightGreen { get; } = "\x1b[102m";
    public static string BrightYellow { get; } = "\x1b[103m";
    public static string BrightBlue { get; } = "\x1b[104m";
    public static string BrightMagenta { get; } = "\x1b[105m";
    public static string BrightCyan { get; } = "\x1b[106m";
    public static string BrightWhite { get; } = "\x1b[107m";
}
