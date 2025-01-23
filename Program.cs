using DB_labb_3.utils;

namespace Program
{
    class Program
    {
        static void Main(string[] args)
        {
            // Console.WriteLine($"{BgColor.BrightRed}Hello World red!{BgColor.Normal}");
            // Console.WriteLine($"{BgColor.BrightGreen}Hello World Green!{BgColor.Normal}");
            // Console.WriteLine($"{BgColor.BrightYellow}Hello World Yello!{BgColor.Normal}");
            // Console.WriteLine($"{BgColor.BrightBlue}Hello World Blue!{BgColor.Normal}");
            // Console.WriteLine($"{BgColor.BrightMagenta}Hello World Magenta!{BgColor.Normal}");
            // Console.WriteLine($"{BgColor.BrightCyan}Hello World Cyan!{BgColor.Normal}");
            // Console.WriteLine($"{BgColor.BrightWhite}Hello World White!{BgColor.Normal}");
            // Console.WriteLine($"{BgColor.BrightBlack}Hello World Black!{BgColor.Normal}");

            var menu = new Menu(new string[] { "Visa alla elever", "visa en spesifik klass", "Lägg till personal" });

            int selectedOption = menu.show();

            switch (selectedOption)
            {
                case 0:
                    Console.WriteLine("Option 1 selected");
                    break;
                case 1:
                    Console.WriteLine("Option 2 selected");
                    break;
                case 2:
                    Console.WriteLine("Option 3 selected");
                    break;
            }
        }
    }
}