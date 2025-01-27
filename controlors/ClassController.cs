using DB_labb_3.Data;
using DB_labb_3.Interface;
using DB_labb_3.utils;

namespace DB_labb_3.controlors;

public class ClassController : IController
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
        // var db = Db.Connect();
        using var db = new SkolaJosefContext();
        var classes = db.Classes.Select(c => c.Name).ToList();

        if (classes.Count == 0)
        {
            Console.WriteLine($"{TextColor.Red}No classes found{TextColor.Normal}");
            return;
        }

        var menu = new Menu(classes.ToArray());

        var index = menu.show() + 1;

        var students = db.Students.Where(studen => studen.ClassId == index).ToList();
        db.Dispose();

        foreach (var student in students)
        {
            Console.WriteLine($"{student.FirstName} {student.LastName}");
        }

        Console.ReadKey();

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
