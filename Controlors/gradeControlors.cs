using DB_labb_3.Enums;
using DB_labb_3.Factory;
using DB_labb_3.Interface;
using DB_labb_3.Models;
using DB_labb_3.Utils;

namespace DB_labb_3.Controlors;

public class gradeControlors : IController
{
    public void Create()
    {
        var employeeFactory = DbFactory.GetRepository<Employee>(DBTable.Employee)!;
        var subjectFactory = DbFactory.GetRepository<Subject>(DBTable.Subject)!;
        var roleGropeFactory = DbFactory.GetRepository<RoleGrope>(DBTable.RoleGroup)!;
        var roleFactory = DbFactory.GetRepository<Role>(DBTable.Role)!;
        var gradeFactory = DbFactory.GetRepository<Grade>(DBTable.Grade)!;

        var student = Helpers.GetStudentFromClass();

        if (!Validation.ObjNotNull(student, "Eleven finns inte"))
        {
            Console.ReadKey();
            return;
        }

        var subjects = subjectFactory.Get();
        var subjectNames = subjects.Select(subject => subject.Name).ToList();

        var subjectMenu = new SelectOneOrMore(["Ämnen"], subjectNames);
        var chosenSubjectOption = subjectMenu.Show()[0];

        var roles = roleFactory.Get().Where(role => role.Name == subjects[chosenSubjectOption].Name).ToArray()[0];
        var employeeIds = roleGropeFactory.Get("role_id", roles.Id).Select(roleGrope => roleGrope.EmployeeId).ToArray();
        var employees = employeeFactory.Get().Where(employee => employeeIds.Contains(employee.Id)).ToList();

        var employeeNames = employees.Select(employee => $"{employee.FirstName} {employee.LastName}").ToList();

        var employeeMenu = new SelectOneOrMore(["Lärare"], employeeNames);
        var selectedEmployee = employeeMenu.Show()[0];

        var grade = Validation.MakeSureNotEmpty("Ange betyg", "Betyg");

        var studentGrade = new Grade
        {
            StudentId = student!.Id,
            SubjectId = subjects[chosenSubjectOption].Id,
            EmployeeId = employees[selectedEmployee].Id,
            Level = grade
        };

        bool isSure = Validation.MakeSureNotEmpty("Är du säker på att du vill sätta betyget? (ja/nej)", "Svar").Equals("ja", StringComparison.CurrentCultureIgnoreCase);

        if (!isSure)
        {
            Console.WriteLine($"{TextColor.Green}Betyget är inte satt för eleven{TextColor.Normal}");
            Console.ReadKey();
            return;
        }

        gradeFactory.Create(studentGrade);

        Console.WriteLine($"{TextColor.Green}Betyg tillagt till {student.FirstName} {student.LastName}{TextColor.Normal}");
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
