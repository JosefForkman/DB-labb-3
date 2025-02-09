using DB_labb_3.Enums;
using DB_labb_3.Factory;
using DB_labb_3.Interface;
using DB_labb_3.Models;
using DB_labb_3.Utils;

namespace DB_labb_3.Controlors;

public class RoleGropeControlor : IController
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
        throw new NotImplementedException();
    }

    public void ShowDepartmentsSalary()
    {
        var roleGropeFactory = DbFactory.GetRepository<RoleGrope>(DBTable.RoleGroup)!;
        var roleFactory = DbFactory.GetRepository<Role>(DBTable.Role)!;
        var employeesFactory = DbFactory.GetRepository<Employee>(DBTable.Employee)!;

        var roles = roleFactory.Get();
        var teacherRole = roles.Where(role => role.Name == "Lärare").FirstOrDefault()!;


        if (!Validation.ObjNotNull(teacherRole, "Lärare finns inte"))
        {
            Console.ReadLine();
            return;
        }

        var roleGroupes = roleGropeFactory.Get().Where(roleGrope => roleGrope.RoleId != teacherRole.Id).GroupBy(roleGrope => roleGrope.RoleId);

        foreach (var roleGrope in roleGroupes)
        {
            decimal totalSalary = 0;
            string roleName = string.Empty;
            
            foreach (var currentRole in roleGrope)
            {
                var employee = employeesFactory.Get("id", currentRole.EmployeeId).First();
                var role = roleFactory.Get("id", currentRole.RoleId).First();
                
                roleName = role.Name;
                totalSalary += employee.Salary ?? 0;
            }
            
            decimal averageSalary = totalSalary / roleGrope.Count();
            Console.WriteLine($"{roleName} total lön: {TextColor.Cyan}{totalSalary}{TextColor.Normal} och genomsnittlig lön: {TextColor.Cyan}{averageSalary}{TextColor.Normal}");
        }

        Console.ReadLine();
    }

    public void Update()
    {
        throw new NotImplementedException();
    }
}
