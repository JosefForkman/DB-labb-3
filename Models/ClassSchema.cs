using System;
using System.Collections.Generic;

namespace DB_labb_3.Models;

public partial class ClassSchema
{
    public int Id { get; set; }

    public DateTime StartDate { get; set; }

    public DateTime EndDate { get; set; }

    public int SubjectId { get; set; }

    public int ClassId { get; set; }

    public virtual Class Class { get; set; } = null!;

    public virtual Subject Subject { get; set; } = null!;
}
