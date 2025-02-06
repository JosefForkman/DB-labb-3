using System;
using System.Collections.Generic;

namespace DB_labb_3.Models;

public partial class Employee
{
    public int Id { get; set; }

    public string? FirstName { get; set; }

    public string? LastName { get; set; }

    public decimal? Salary { get; set; }

    public DateOnly? StartDate { get; set; }

    public virtual ICollection<Class> Classes { get; set; } = new List<Class>();

    public virtual ICollection<Grade> Grades { get; set; } = new List<Grade>();

    public virtual ICollection<RoleGrope> RoleGropes { get; set; } = new List<RoleGrope>();
}
