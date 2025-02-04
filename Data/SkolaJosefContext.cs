using System;
using System.Collections.Generic;
using DB_labb_3.Models;
using Microsoft.EntityFrameworkCore;

namespace DB_labb_3.Data;

public partial class SkolaJosefContext : DbContext
{
    public SkolaJosefContext()
    {
    }

    public SkolaJosefContext(DbContextOptions<SkolaJosefContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Class> Classes { get; set; }

    public virtual DbSet<ClassSchema> ClassSchemas { get; set; }

    public virtual DbSet<Employee> Employees { get; set; }

    public virtual DbSet<Grade> Grades { get; set; }

    public virtual DbSet<Role> Roles { get; set; }

    public virtual DbSet<RoleGrope> RoleGropes { get; set; }

    public virtual DbSet<Student> Students { get; set; }

    public virtual DbSet<Subject> Subjects { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source=db; Database=SkolaJosef; User id = sa; Password = P@ssw0rd; Trust Server Certificate=True;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Class>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__class__3213E83F40C65ACA");

            entity.ToTable("class");

            entity.HasIndex(e => e.Name, "UQ__class__72E12F1B12AA3B38").IsUnique();

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.EndDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("end_date");
            entity.Property(e => e.MentorId).HasColumnName("mentor_id");
            entity.Property(e => e.Name)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("name");
            entity.Property(e => e.StartDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("start_date");

            entity.HasOne(d => d.Mentor).WithMany(p => p.Classes)
                .HasForeignKey(d => d.MentorId)
                .HasConstraintName("FK__class__mentor_id__2F10007B");
        });

        modelBuilder.Entity<ClassSchema>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__class_sc__3213E83FEB2ACFDB");

            entity.ToTable("class_schema");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.ClassId).HasColumnName("class_id");
            entity.Property(e => e.EndDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("end_date");
            entity.Property(e => e.StartDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("start_date");
            entity.Property(e => e.SubjectId).HasColumnName("subject_id");

            entity.HasOne(d => d.Class).WithMany(p => p.ClassSchemas)
                .HasForeignKey(d => d.ClassId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__class_sch__class__412EB0B6");

            entity.HasOne(d => d.Subject).WithMany(p => p.ClassSchemas)
                .HasForeignKey(d => d.SubjectId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__class_sch__subje__403A8C7D");
        });

        modelBuilder.Entity<Employee>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__employee__3213E83F96E0A02F");

            entity.ToTable("employee");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.FirstName)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("first_name");
            entity.Property(e => e.LastName)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("last_name");
        });

        modelBuilder.Entity<Grade>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__grade__3213E83F2E3E999E");

            entity.ToTable("grade");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.CreatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("created_at");
            entity.Property(e => e.EmployeeId).HasColumnName("employee_id");
            entity.Property(e => e.Level)
                .HasMaxLength(3)
                .IsUnicode(false)
                .HasColumnName("level");
            entity.Property(e => e.StudentId).HasColumnName("student_id");
            entity.Property(e => e.SubjectId).HasColumnName("subject_id");
            entity.Property(e => e.UpdatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("updated_at");

            entity.HasOne(d => d.Employee).WithMany(p => p.Grades)
                .HasForeignKey(d => d.EmployeeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__grade__employee___3A81B327");

            entity.HasOne(d => d.Student).WithMany(p => p.Grades)
                .HasForeignKey(d => d.StudentId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__grade__student_i__3B75D760");

            entity.HasOne(d => d.Subject).WithMany(p => p.Grades)
                .HasForeignKey(d => d.SubjectId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__grade__subject_i__398D8EEE");
        });

        modelBuilder.Entity<Role>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__role__3213E83FB1A3DF13");

            entity.ToTable("role");

            entity.HasIndex(e => e.Name, "UQ__role__72E12F1B3AB05169").IsUnique();

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Name)
                .HasMaxLength(80)
                .IsUnicode(false)
                .HasColumnName("name");
        });

        modelBuilder.Entity<RoleGrope>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__role_gro__3213E83FC465BE71");

            entity.ToTable("role_grope");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.EmployeeId).HasColumnName("employee_id");
            entity.Property(e => e.RoleId).HasColumnName("role_id");

            entity.HasOne(d => d.Employee).WithMany(p => p.RoleGropes)
                .HasForeignKey(d => d.EmployeeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__role_grop__emplo__286302EC");

            entity.HasOne(d => d.Role).WithMany(p => p.RoleGropes)
                .HasForeignKey(d => d.RoleId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__role_grop__role___29572725");
        });

        modelBuilder.Entity<Student>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__student__3213E83F3B851BDB");

            entity.ToTable("student");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.ClassId).HasColumnName("class_id");
            entity.Property(e => e.FirstName)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("first_name");
            entity.Property(e => e.LastName)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("last_name");
            entity.Property(e => e.PersonalCodeNumber)
                .HasMaxLength(14)
                .IsUnicode(false)
                .HasColumnName("personal_code_number");

            entity.HasOne(d => d.Class).WithMany(p => p.Students)
                .HasForeignKey(d => d.ClassId)
                .HasConstraintName("FK__student__class_i__31EC6D26");
        });

        modelBuilder.Entity<Subject>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__subject__3213E83FEE79BB45");

            entity.ToTable("subject");

            entity.HasIndex(e => e.Name, "UQ__subject__72E12F1BB5F75BF6").IsUnique();

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Discription)
                .HasMaxLength(800)
                .IsUnicode(false)
                .HasColumnName("discription");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("name");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
