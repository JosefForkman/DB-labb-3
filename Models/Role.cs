﻿using System;
using System.Collections.Generic;

namespace DB_labb_3.Models;

public partial class Role
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<RoleGrope> RoleGropes { get; set; } = new List<RoleGrope>();
}
