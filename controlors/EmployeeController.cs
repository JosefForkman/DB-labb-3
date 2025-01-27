using DB_labb_3.Data;
using DB_labb_3.Interface;
using DB_labb_3.Models;
using DB_labb_3.utils;

namespace DB_labb_3.controlors;

public class EmployeeController : IController
{
    public void Create()
    {
        // var db = Db.Connect();
        using var db = new SkolaJosefContext();
        var newEmployee = new Employee
        {
            FirstName = Helpers.Ask("Förnamn: "),
            LastName = Helpers.Ask("Efternamn: "),
        };

        var rolls = db.Roles.ToList();
        var menu = new Menu(rolls.Select(r => r.Name).ToArray());

        int selectedOption = menu.show();





        db.Employees.Add(newEmployee);
        db.SaveChanges();

        db.Dispose();

        Console.WriteLine($"{TextColor.Green}Anställd tillagd{TextColor.Normal}");

        Console.ReadKey();

    }

    public void Destroy()
    {
        throw new NotImplementedException();
    }

    public void Index()
    {
        throw new NotImplementedException();
    }

    public void Show()
    {
        throw new NotImplementedException();
    }

    public void Update()
    {
        throw new NotImplementedException();
    }
}


