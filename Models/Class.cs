using System;
using System.Collections.Generic;

namespace DB_labb_3.Models;

public partial class Class
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public DateTime StartDate { get; set; }

    public DateTime EndDate { get; set; }

    public int? MentorId { get; set; }

    public virtual ICollection<ClassSchema> ClassSchemas { get; set; } = new List<ClassSchema>();

    public virtual Employee? Mentor { get; set; }

    public virtual ICollection<Student> Students { get; set; } = new List<Student>();
}
