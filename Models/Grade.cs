using System;
using System.Collections.Generic;

namespace DB_labb_3.Models;

public partial class Grade
{
    public int Id { get; set; }

    public string Level { get; set; } = null!;

    public DateTime CreatedAt { get; set; }

    public DateTime UpdatedAt { get; set; }

    public int SubjectId { get; set; }

    public int EmployeeId { get; set; }

    public int StudentId { get; set; }

    public virtual Employee Employee { get; set; } = null!;

    public virtual Student Student { get; set; } = null!;

    public virtual Subject Subject { get; set; } = null!;
}
