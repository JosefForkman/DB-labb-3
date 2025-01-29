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

        string firstName = Validation.MakeSureNotEmpty("Förnamn: ", "Förnamn");
        string lastName = Validation.MakeSureNotEmpty("Efternamn: ", "Efternamn");

        var employeeExist = db.Employees.Where(employee => employee.FirstName == firstName && employee.LastName == lastName).FirstOrDefault();


        if (!Validation.CheckIfNull(employeeExist, "Anställd finns inte"))
        {
            Console.ReadKey();
            return;
        }

        var newEmployee = new Employee
        {
            FirstName = firstName,
            LastName = lastName,
        };

        var rolls = db.Roles.ToList();

        bool rollIsEmpty = !Validation.ObjNotEmty(rolls, "Inga roller hittades");

        if (rollIsEmpty)
        {
            Console.ReadKey();
            return;
        }

        var body = rolls.Select(roll => roll.Name).ToList();
        var menu = new SelectOneOrMore(["Roller"], body);

        var selectedOption = menu.Show(3);

        db.Employees.Add(newEmployee);

        db.SaveChanges();

        foreach (var option in selectedOption)
        {
            db.RoleGropes.Add(new RoleGrope
            {
                Employee = newEmployee,
                Role = rolls[option + 1] // +1 because menu retern 0 based index
            });
        }
        db.SaveChanges();

        Console.WriteLine($"{TextColor.Green}Anställd tillagd{TextColor.Normal}");

        Console.ReadKey();

    }

    public void Destroy()
    {
        using var db = new SkolaJosefContext();
        string firstName = Validation.MakeSureNotEmpty("Förnamn: ", "Förnamn");
        string lastName = Validation.MakeSureNotEmpty("Efternamn: ", "Efternamn");

        var employee = db.Employees.Where(employee => employee.FirstName == firstName && employee.LastName == lastName).FirstOrDefault();

        if (!Validation.CheckIfNull(employee, "Anställd hittades inte"))
        {
            Console.ReadKey();
            return;
        }

        bool isSure = Validation.MakeSureNotEmpty("Är du säker på att du vill ta bort anställd? (ja/nej)", "Svar") == "ja";

        if (!isSure)
        {
            Console.ReadKey();
            return;
        }

        var roleGropes = db.RoleGropes.Where(rg => rg.EmployeeId == employee.Id);
        db.RoleGropes.RemoveRange(roleGropes);
        db.Employees.Remove(employee);
        db.SaveChanges();
    }

    public void Index()
    {
        throw new NotImplementedException();
    }

    public void Show()
    {
        using var db = new SkolaJosefContext();
        var employees = db.Employees.ToList();

        if (employees.Count == 0)
        {
            Console.WriteLine("Inga anställda hittades");
            Console.ReadKey();
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


