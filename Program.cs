﻿using DB_labb_3.Controlors;
using DB_labb_3.Utils;

namespace DB_labb_3
{
    class Program
    {
        static void Main(string[] args)
        {
            string[] menuOptions = [
                    "Visa alla elever",
                    "Visa information om en elev",
                    "Visa en spesifik klass",
                    "Visa alla pågående classer",
                    "Visa betyg för en elev",
                    "Visa alla arbetare",
                    "Visa antal anstälda",
                    "Lägg till arbetare",
                    "Ta bort arbetare",
                    "Visa avdelningars lön och medellön",
                    "Avsluta"
                ];
            var menu = new Menu(menuOptions);

            var studentController = new StudentController();
            var classController = new ClassController();
            var classSchemaController = new ClassSchemaController();
            var employeeController = new EmployeeController();
            var roleGropeControlor = new RoleGropeControlor();

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
                        studentController.Index();
                        break;
                    case 2:
                        classController.Index();
                        break;
                    case 3:
                        classSchemaController.Show();
                        break;
                    case 4:
                        studentController.ShowGrades();
                        break;
                    case 5:
                        employeeController.Show();
                        break;
                    case 6:
                        employeeController.ShowCount();
                        break;
                    case 7:
                        employeeController.Create();
                        break;
                    case 8:
                        employeeController.Destroy();
                        break;
                    case 9:
                        roleGropeControlor.ShowDepartmentsSalary();
                        break;
                    case 10:
                        isRunning = false;
                        break;
                }
            }
        }
    }
}