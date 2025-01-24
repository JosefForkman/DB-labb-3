﻿using DB_labb_3.controlors;
using DB_labb_3.utils;

namespace Program
{
    class Program
    {
        static void Main(string[] args)
        {
            var menu = new Menu(new string[] { "Visa alla elever", "visa en spesifik klass", "Lägg till personal", "Avsluta" });
            var studentController = new StudentController();
            bool isRunning = true;
            while (isRunning)
            {
                int selectedOption = menu.show();

                switch (selectedOption)
                {
                    case 0:
                        studentController.Show();
                        break;
                    case 1:
                        Console.WriteLine("Option 2 selected");
                        break;
                    case 2:
                        Console.WriteLine("Option 3 selected");
                        break;
                    case 3:
                        isRunning = false;
                        break;
                }
            }
        }
    }
}