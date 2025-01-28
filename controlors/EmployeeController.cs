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
        var body = rolls.Select(r => r.Name).ToList();
        var menu = new SelectOneOrMore(["Roller"], body);
        // var menu = new Menu(rolls.Select(r => r.Name).ToArray());

        var selectedOption = menu.Show(3);




        var inserted = db.Employees.Add(newEmployee);
        
        // db.SaveChanges();

        foreach (var option in selectedOption)
        {
            db.RoleGropes.Add(new RoleGrope
            {
                Employee = newEmployee,
                Role = rolls[option]
            });
        }
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
        using var db = new SkolaJosefContext();
        var employees = db.Employees.ToList();
        db.Dispose();

        if (employees.Count == 0)
        {
            Console.WriteLine("Inga anställda hittades");
            return;
        }

        Console.WriteLine("Anställda");
        foreach (var employee in employees)
        {
            Console.WriteLine($"{employee.FirstName} {employee.LastName}");
        }

        Console.ReadKey();
    }

    public void Update()
    {
        throw new NotImplementedException();
    }
}


