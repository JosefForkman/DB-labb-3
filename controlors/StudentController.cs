using DB_labb_3.Data;
using DB_labb_3.Interface;
using DB_labb_3.utils;

namespace DB_labb_3.controlors;

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
        var db = Db.Connect();
        var students = db.Students.ToList();

        if (students.Count == 0)
        {
            Console.WriteLine($"{TextColor.Red}No students found{TextColor.Normal}");
            return;
        }

        var menu = new Menu(new string[] { "Förnamn A-Ö", "Förnamn Ö-A", "Efternamn A-Ö", "Efternamn Ö-A" });

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
            Console.WriteLine($"{student.FirstName} {student.LastName}");
        }

        Console.ReadKey();
    }

    public void Update()
    {
        throw new NotImplementedException();
    }
}
