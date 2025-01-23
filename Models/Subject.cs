using System;
using System.Collections.Generic;

namespace DB_labb_3.Models;

public partial class Subject
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string? Discription { get; set; }

    public virtual ICollection<ClassSchema> ClassSchemas { get; set; } = new List<ClassSchema>();

    public virtual ICollection<Grade> Grades { get; set; } = new List<Grade>();
}
