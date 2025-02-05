using DB_labb_3.Data;
using DB_labb_3.Enums;
using DB_labb_3.Factory;
using DB_labb_3.Interface;
using DB_labb_3.Models;
using DB_labb_3.Utils;
using Microsoft.EntityFrameworkCore;

namespace DB_labb_3.Controlors;

public class EmployeeController : IController
{
    public void Create()
    {
        // var db = Db.Connect();
        using var db = new SkolaJosefContext();

        var firstName = Validation.MakeSureNotEmpty("Förnamn: ", "Förnamn");
        var lastName = Validation.MakeSureNotEmpty("Efternamn: ", "Efternamn");

        // var employeeExist = db.Employees.Where(employee => employee.FirstName == firstName && employee.LastName == lastName).FirstOrDefault();

        var employee = DbFactory.GetRepository<Employee>(DBTable.Employee)!;
        var employeeExist = employee?.Get().Where(employee => employee.FirstName == firstName && employee.LastName == lastName).FirstOrDefault();

        if (employeeExist != null)
        {
            Console.WriteLine($"{TextColor.Red}Anställd finns redan{TextColor.Normal}");
            Console.ReadKey();
            return;
        }

        var newEmployee = new Employee
        {
            FirstName = firstName,
            LastName = lastName,
        };

        var rolls = db.Roles.OrderBy(role => role.Id).ToList();

        bool rollIsEmpty = !Validation.ObjNotEmty(rolls, "Inga roller hittades");

        if (rollIsEmpty)
        {
            Console.ReadKey();
            return;
        }

        var body = rolls.Select(roll => roll.Name);
        var menu = new SelectOneOrMore(["Roller"], body.ToList());

        var selectedOption = menu.Show(3);

        // db.Employees.Add(newEmployee);
        newEmployee = employee!.Create(newEmployee);

        // db.SaveChanges();

        if (newEmployee == null)
        {
            Console.WriteLine($"{TextColor.Red}Anställd kunde inte skapas{TextColor.Normal}");
            Console.ReadKey();
            return;
        }

        foreach (var option in selectedOption)
        {
            var role = rolls.FirstOrDefault(role => role.Id == (option + 1)); // +1 because menu retern 0 based index
            if (role != null)
            {
                db.RoleGropes.Add(new RoleGrope
                {
                    EmployeeId = newEmployee.Id,
                    Role = role
                });
            }
        }
        db.SaveChanges();

        Console.WriteLine($"{TextColor.Green}Anställd tillagd{TextColor.Normal}");

        Console.ReadKey();

    }

    public void Destroy()
    {
        using var db = new SkolaJosefContext();
        var employees = db.Employees;

        var employeesOptions = employees.Select(employee => $"{employee.FirstName} {employee.LastName}").ToList();

        if (!Validation.ObjNotEmty(employeesOptions, "Inga anställda hittades"))
        {
            Console.ReadKey();
            return;
        }

        var menu = new SelectOneOrMore(["Anstäld"], employeesOptions.ToList());
        var selectedOption = menu.Show();
        var employee = employees.ToList()[selectedOption[0]];

        if (employee == null)
        {
            Console.WriteLine($"{TextColor.Red}Anställd hittades inte{TextColor.Normal}");
            Console.ReadKey();
            return;
        }

        bool isSure = Validation.MakeSureNotEmpty("Är du säker på att du vill ta bort anställd? (ja/nej)", "Svar") == "ja";

        if (!isSure)
        {
            Console.WriteLine($"{TextColor.Green}Anställd inte borttagen{TextColor.Normal}");
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
            Console.WriteLine($"{TextColor.Red}Inga anställda hittades{TextColor.Normal}");
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

    public void ShowCount()
    {
        using var db = new SkolaJosefContext();

        var teacherIds = db.RoleGropes
            .Include(rg => rg.Role)
            .Where(role => role.Role.Name == "Lärare")
            .Select(role => role.EmployeeId)
            .ToList();

        if (!Validation.ObjNotEmty(teacherIds, $"{TextColor.Red}Inga lärare hittades{TextColor.Normal}"))
        {
            Console.ReadKey();
            return;
        }

        var teachers = db.RoleGropes
            .Where(role => teacherIds.Contains(role.EmployeeId) && role.Role.Name != "Lärare")
            .GroupBy(role => role.Role.Name)
            .Select(role => new { Name = role.Key, Count = role.Count() })
            .ToList();

        if (!Validation.ObjNotEmty(teachers, $"{TextColor.Green}Inga lärare har ett specifikt skolämne{TextColor.Normal}"))
        {
            Console.ReadKey();
            return;
        }

        foreach (var teacher in teachers)
        {
            Console.WriteLine($"{teacher.Name}: {teacher.Count}st");
        }
        Console.ReadKey();
    }
    public void Update()
    {
        throw new NotImplementedException();
    }
}


