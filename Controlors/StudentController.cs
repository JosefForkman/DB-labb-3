using System.Data;
using DB_labb_3.adapters;
using DB_labb_3.Data;
using DB_labb_3.Enums;
using DB_labb_3.Factory;
using DB_labb_3.Interface;
using DB_labb_3.Maper;
using DB_labb_3.Models;
using DB_labb_3.Utils;
using Microsoft.Data.SqlClient;
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
        var student = Helpers.GetStudentFromClass();

        if (!Validation.ObjNotNull(student, "Eleven finns inte"))
        {
            Console.ReadKey();
            return;
        }

        var query = $"getStudentInfo";

        var parameters = new SqlParameter[]
        {
            new SqlParameter("@StudentID", student!.Id)
        };

        var map = new StudentMap().StoreProcedureMap;

        var studentInfo = Ado.Query(query, map, parameters, CommandType.StoredProcedure).First();

        Console.Clear();
        Console.WriteLine($"{studentInfo.StudentName} går i klass {studentInfo.ClassName} och har {studentInfo.TeacherName} som lärare.");
        Console.WriteLine($"Klassen startade {studentInfo.Start.ToShortDateString()} och slutar {studentInfo.End.ToShortDateString()}");

        Console.ReadKey();
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
    public void ShowGrades()
    {
        var employeeFactory = DbFactory.GetRepository<Employee>(DBTable.Employee)!;
        var gradeFactory = DbFactory.GetRepository<Grade>(DBTable.Grade)!;
        var subjectFactory = DbFactory.GetRepository<Subject>(DBTable.Subject)!;

        var student = Helpers.GetStudentFromClass();

        if (!Validation.ObjNotNull(student, "Eleven finns inte"))
        {
            Console.ReadKey();
            return;
        }

        var grades = gradeFactory.Get("student_id", student!.Id).OrderByDescending(grade => grade.CreatedAt).ToList();

        if (!Validation.ObjNotEmty(grades, "Inga betyg hittades"))
        {
            Console.ReadKey();
            return;
        }

        Console.Clear();
        Console.WriteLine($"{student.FirstName} {student.LastName} har följande betyg:");
        foreach (var grade in grades)
        {
            var subject = subjectFactory.Get("id", grade.SubjectId).First();
            var employee = employeeFactory.Get("id", grade.EmployeeId).First();
            Console.WriteLine($"- {grade.Level} i {subject.Name} av {employee.FirstName} {employee.LastName} den {grade.CreatedAt.ToShortDateString()}");
        }

        Console.ReadKey();
    }
    public void Update()
    {
        throw new NotImplementedException();
    }
}
