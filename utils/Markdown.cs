using System.Text.RegularExpressions;
using DB_labb_3.enums;

namespace DB_labb_3.utils;

/// <summary>
/// This is a helper static class to generate markdown code.
/// </summary>
public class Markdown
{
    /// <summary>
    /// This creates a markdown for a table and console out the result
    /// </summary>
    /// <param name="columnHeaders"></param>
    /// <param name="body"></param>
    public static void Table(string[] columnHeaders, List<string> body)
    {
        // Regex pattern to match ASCII color codes
        var asciiColorCodePattern = @"\x1b\[\d+(;\d+)?m";

        // Remove ASCII codes from the body
        var sanitizedBody = body.Select(item => Regex.Replace(item, asciiColorCodePattern, "")).ToList();

        // Find max column and row widths
        int maxColumnWidth = columnHeaders.OrderByDescending(item => item.Length).First().Length;
        int maxRowWidth = sanitizedBody.OrderByDescending(item => item.Length).First().Length;
        int maxCellWidth = maxColumnWidth < maxRowWidth ? maxRowWidth : maxColumnWidth;

        // Table header
        for (int i = 0; i < columnHeaders.Length; i++)
        {
            var header = columnHeaders[i];
            int amountToAddSpace = maxCellWidth - header.Length;

            Console.Write("|");
            Console.Write(header);

            // Add remending space on a table cell
            Spacer(amountToAddSpace);

            // Add the last separator to the end
            if (columnHeaders.Length - 1 == i)
            {
                Console.Write("|");
            }
        }

        Console.WriteLine();

        for (int i = 0; i < columnHeaders.Length; i++)
        {
            int amountToAddDivider = maxCellWidth < 3 ? 3 : maxCellWidth;

            Console.Write("|");

            // console out the heder separator
            Spacer(amountToAddDivider, "-");

            // Add the last separator to the end
            if (columnHeaders.Length - 1 == i)
            {
                Console.Write("|");
            }
        }

        Console.WriteLine();

        // Table body
        for (int i = 0; i < body.Count; i++)
        {
            Console.Write("|");
            var currentBody = body[i];
            var currentSanitizedBody = sanitizedBody[i];
            Console.Write(currentBody);
            int amountToAddSpace = maxCellWidth - currentSanitizedBody.Length;

            // Add remending space on a table cell
            Spacer(amountToAddSpace);

            // Add the last separator to the end and add a new row by checking how many item it´s in heder 
            if (((i + 1) % columnHeaders.Length) == 0)
            {
                Console.WriteLine("|");
            }
        }
    }

    /// <summary>
    /// Writhe out a Markdown hedder.
    /// </summary>
    /// <param name="headerLevel"></param>
    /// <param name="message"></param>
    public static void Header(HeaderLevel headerLevel = HeaderLevel.Header1, string message = "")
    {
        string header = "";
        for (int i = 0; i < ((int)headerLevel); i++)
        {
            header += "#";
        }
        Paragraph($"{header} {message}");
    }

    public static void Paragraph(string message)
    {
        Console.WriteLine(message);
    }

    /// <summary>
    /// Add a space withe given amount 
    /// </summary>
    /// <param name="amountToAddSpace"></param>
    /// <param name="spacerValue"></param>
    private static void Spacer(int amountToAddSpace, string spacerValue = " ")
    {
        for (int j = 0; j < amountToAddSpace; j++)
        {
            Console.Write(spacerValue);
        }
    }
}
