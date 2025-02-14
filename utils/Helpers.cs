using System;
using DB_labb_3.Enums;
using DB_labb_3.Factory;
using DB_labb_3.Models;

namespace DB_labb_3.Utils;

public static class Helpers
{

    public static string Ask(string question)
    {
        Console.WriteLine(question);
        return Console.ReadLine() ?? "";
    }

    public static Student? GetStudentFromClass()
    {
        var classFactory = DbFactory.GetRepository<Class>(DBTable.Class)!;
        var studentFactory = DbFactory.GetRepository<Student>(DBTable.Student)!;

        var classes = classFactory.Get().Select(c => c.Name).ToList();

        if (!Validation.ObjNotEmty(classes, "Inga klasser hittades"))
        {
            Console.ReadKey();
            return null;
        }

        var menu = new SelectOneOrMore(["Klasser"], classes);

        var selectedOption = menu.Show()[0] + 1;

        var students = studentFactory.Get("class_id", selectedOption).Select(s => $"{s.FirstName} {s.LastName}").ToList();

        if (!Validation.ObjNotEmty(students, "Inga elever hittades"))
        {
            Console.ReadKey();
            return null;
        }

        var studentMenu = new SelectOneOrMore(["Elever"], students);

        var selectedStudent = studentMenu.Show()[0] + 1;

        var student = studentFactory.Get("id", selectedStudent).FirstOrDefault();

        return student;
    }
}
