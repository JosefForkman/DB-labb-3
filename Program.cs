using DB_labb_3.controlors;
using DB_labb_3.utils;

namespace Program
{
    class Program
    {
        static void Main(string[] args)
        {
            var menu = new Menu(["Visa alla elever", "Visa en spesifik klass", "Visa alla arbetare", "Lägg till personal", "Avsluta"]);
            
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
                        employeeController.Create();
                        break;
                    case 4:
                        isRunning = false;
                        break;
                }
            }
        }
    }
}