using System;

namespace DB_labb_3.utils;

/// <summary>
/// Make a menu with the given options
/// </summary>
/// <param name="options"></param>
public class Menu(string[] options)
{
    public string[] Options { get; set; } = options;
    private int _selectedOption = 0;

    /// <summary>
    /// Show the menu and return the index of selected option
    /// </summary>
    /// <returns></returns>
    public int show()
    {
        bool isSelected = false;
        Console.WriteLine("Press arrow up and down to navigate. Select with enter");
        (int Left, int Top) = Console.GetCursorPosition();
        Console.CursorVisible = false;

        while (!isSelected)
        {
            for (int i = 0; i < Options.Length; i++)
            {
                Console.SetCursorPosition(Left, Top + i);

                string option = i == _selectedOption ? $"{BgColor.BrightBlue}{TextColor.White}{Options[i]}{TextColor.Normal}{BgColor.Normal}" : Options[i];

                Console.WriteLine(option);
            }

            ConsoleKeyInfo key = Console.ReadKey();
            switch (key.Key)
            {
                case ConsoleKey.UpArrow:
                    _selectedOption = _selectedOption == 0 ? Options.Length - 1 : _selectedOption - 1;
                    break;
                case ConsoleKey.DownArrow:
                    _selectedOption = _selectedOption == Options.Length - 1 ? 0 : _selectedOption + 1;
                    break;
                case ConsoleKey.Enter:
                    isSelected = true;
                    break;
            }
        }

        Console.ResetColor();
        Console.CursorVisible = true;
        return _selectedOption;
    }
}
