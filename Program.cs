using DB_labb_3.Controlors;
using DB_labb_3.Interface;
using DB_labb_3.Utils;

namespace DB_labb_3
{
    class Program
    {
        static void Main(string[] args)
        {
            var menu = new Menu(["Visa alla elever", "Visa en spesifik klass", "Visa alla arbetare", "Visa antal anstälda", "Lägg till arbetare", "Ta bort arbetare", "Avsluta"]);

            var studentController = new StudentController();
            var classController = new ClassController();
            var employeeController = new EmployeeController();

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
                        classController.Index();
                        break;
                    case 2:
                        employeeController.Show();
                        break;
                    case 3:
                        employeeController.ShowCount();
                        break;
                    case 4:
                        employeeController.Create();
                        break;
                    case 5:
                        employeeController.Destroy();
                        break;
                    case 6:
                        isRunning = false;
                        break;
                }
            }
        }
    }
}