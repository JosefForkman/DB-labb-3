using System;
using System.Collections.Generic;

namespace DB_labb_3.Models;

public partial class RoleGrope
{
    public int EmployeeId { get; set; }

    public int RoleId { get; set; }

    public virtual Employee Employee { get; set; } = null!;

    public virtual Role Role { get; set; } = null!;
}
