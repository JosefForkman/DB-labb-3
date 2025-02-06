using DB_labb_3.Data;
using DB_labb_3.Interface;
using DB_labb_3.Utils;
using Microsoft.EntityFrameworkCore;

namespace DB_labb_3.Controlors;

public class StudentController : IController
{

    public void Create()
    {
        throw new NotImplementedException();
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
        // var db = Db.Connect();
        using var db = new SkolaJosefContext();
        var students = db.Students
            .Include(student => student.Class)
            .ToList();

        if (students.Count == 0)
        {
            Console.WriteLine($"{TextColor.Red}Hittade inga studenter{TextColor.Normal}");
            Console.ReadKey();
            return;
        }

        var menu = new Menu(["Förnamn A-Ö", "Förnamn Ö-A", "Efternamn A-Ö", "Efternamn Ö-A"]);

        Console.WriteLine("Hur vill du sortera eleverna?");
        int selectedOption = menu.show();

        switch (selectedOption)
        {
            case 0:
                students = students.OrderBy(s => s.FirstName).ToList();
                break;
            case 1:
                students = students.OrderByDescending(s => s.FirstName).ToList();
                break;
            case 2:
                students = students.OrderBy(s => s.LastName).ToList();
                break;
            case 3:
                students = students.OrderByDescending(s => s.LastName).ToList();
                break;
        }



        foreach (var student in students)
        {
            Console.WriteLine($"{student.FirstName} {student.LastName} går i klass {student.Class?.Name ?? "förnuvarande ingen klass"}");
        }

        Console.ReadKey();
    }

    public void Update()
    {
        throw new NotImplementedException();
    }
}
