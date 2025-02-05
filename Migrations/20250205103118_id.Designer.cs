﻿// <auto-generated />
using System;
using DB_labb_3.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

#nullable disable

namespace DB_labb_3.Migrations
{
    [DbContext(typeof(SkolaJosefContext))]
    [Migration("20250205103118_id")]
    partial class id
    {
        /// <inheritdoc />
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "9.0.1")
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

            SqlServerModelBuilderExtensions.UseIdentityColumns(modelBuilder);

            modelBuilder.Entity("DB_labb_3.Models.Class", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("id");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<DateTime>("EndDate")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("datetime")
                        .HasColumnName("end_date")
                        .HasDefaultValueSql("(getdate())");

                    b.Property<int?>("MentorId")
                        .HasColumnType("int")
                        .HasColumnName("mentor_id");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasMaxLength(50)
                        .IsUnicode(false)
                        .HasColumnType("varchar(50)")
                        .HasColumnName("name");

                    b.Property<DateTime>("StartDate")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("datetime")
                        .HasColumnName("start_date")
                        .HasDefaultValueSql("(getdate())");

                    b.HasKey("Id")
                        .HasName("PK__class__3213E83F40C65ACA");

                    b.HasIndex("MentorId");

                    b.HasIndex(new[] { "Name" }, "UQ__class__72E12F1B12AA3B38")
                        .IsUnique();

                    b.ToTable("class", (string)null);
                });

            modelBuilder.Entity("DB_labb_3.Models.ClassSchema", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("id");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<int>("ClassId")
                        .HasColumnType("int")
                        .HasColumnName("class_id");

                    b.Property<DateTime>("EndDate")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("datetime")
                        .HasColumnName("end_date")
                        .HasDefaultValueSql("(getdate())");

                    b.Property<DateTime>("StartDate")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("datetime")
                        .HasColumnName("start_date")
                        .HasDefaultValueSql("(getdate())");

                    b.Property<int>("SubjectId")
                        .HasColumnType("int")
                        .HasColumnName("subject_id");

                    b.HasKey("Id")
                        .HasName("PK__class_sc__3213E83FEB2ACFDB");

                    b.HasIndex("ClassId");

                    b.HasIndex("SubjectId");

                    b.ToTable("class_schema", (string)null);
                });

            modelBuilder.Entity("DB_labb_3.Models.Employee", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("id");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<string>("FirstName")
                        .HasMaxLength(100)
                        .IsUnicode(false)
                        .HasColumnType("varchar(100)")
                        .HasColumnName("first_name");

                    b.Property<string>("LastName")
                        .HasMaxLength(100)
                        .IsUnicode(false)
                        .HasColumnType("varchar(100)")
                        .HasColumnName("last_name");

                    b.HasKey("Id")
                        .HasName("PK__employee__3213E83F96E0A02F");

                    b.ToTable("employee", (string)null);
                });

            modelBuilder.Entity("DB_labb_3.Models.Grade", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("id");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<DateTime>("CreatedAt")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("datetime")
                        .HasColumnName("created_at")
                        .HasDefaultValueSql("(getdate())");

                    b.Property<int>("EmployeeId")
                        .HasColumnType("int")
                        .HasColumnName("employee_id");

                    b.Property<string>("Level")
                        .IsRequired()
                        .HasMaxLength(3)
                        .IsUnicode(false)
                        .HasColumnType("varchar(3)")
                        .HasColumnName("level");

                    b.Property<int>("StudentId")
                        .HasColumnType("int")
                        .HasColumnName("student_id");

                    b.Property<int>("SubjectId")
                        .HasColumnType("int")
                        .HasColumnName("subject_id");

                    b.Property<DateTime>("UpdatedAt")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("datetime")
                        .HasColumnName("updated_at")
                        .HasDefaultValueSql("(getdate())");

                    b.HasKey("Id")
                        .HasName("PK__grade__3213E83F2E3E999E");

                    b.HasIndex("EmployeeId");

                    b.HasIndex("StudentId");

                    b.HasIndex("SubjectId");

                    b.ToTable("grade", (string)null);
                });

            modelBuilder.Entity("DB_labb_3.Models.Role", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("id");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasMaxLength(80)
                        .IsUnicode(false)
                        .HasColumnType("varchar(80)")
                        .HasColumnName("name");

                    b.HasKey("Id")
                        .HasName("PK__role__3213E83FB1A3DF13");

                    b.HasIndex(new[] { "Name" }, "UQ__role__72E12F1B3AB05169")
                        .IsUnique();

                    b.ToTable("role", (string)null);
                });

            modelBuilder.Entity("DB_labb_3.Models.RoleGrope", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("id");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<int>("EmployeeId")
                        .HasColumnType("int")
                        .HasColumnName("employee_id");

                    b.Property<int>("RoleId")
                        .HasColumnType("int")
                        .HasColumnName("role_id");

                    b.HasKey("Id")
                        .HasName("PK__role_gro__3213E83FC465BE71");

                    b.HasIndex("EmployeeId");

                    b.HasIndex("RoleId");

                    b.ToTable("role_grope", (string)null);
                });

            modelBuilder.Entity("DB_labb_3.Models.Student", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("id");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<int?>("ClassId")
                        .HasColumnType("int")
                        .HasColumnName("class_id");

                    b.Property<string>("FirstName")
                        .HasMaxLength(100)
                        .IsUnicode(false)
                        .HasColumnType("varchar(100)")
                        .HasColumnName("first_name");

                    b.Property<string>("LastName")
                        .HasMaxLength(100)
                        .IsUnicode(false)
                        .HasColumnType("varchar(100)")
                        .HasColumnName("last_name");

                    b.Property<string>("PersonalCodeNumber")
                        .HasMaxLength(14)
                        .IsUnicode(false)
                        .HasColumnType("varchar(14)")
                        .HasColumnName("personal_code_number");

                    b.HasKey("Id")
                        .HasName("PK__student__3213E83F3B851BDB");

                    b.HasIndex("ClassId");

                    b.ToTable("student", (string)null);
                });

            modelBuilder.Entity("DB_labb_3.Models.Subject", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasColumnName("id");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<string>("Discription")
                        .HasMaxLength(800)
                        .IsUnicode(false)
                        .HasColumnType("varchar(800)")
                        .HasColumnName("discription");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasMaxLength(255)
                        .IsUnicode(false)
                        .HasColumnType("varchar(255)")
                        .HasColumnName("name");

                    b.HasKey("Id")
                        .HasName("PK__subject__3213E83FEE79BB45");

                    b.HasIndex(new[] { "Name" }, "UQ__subject__72E12F1BB5F75BF6")
                        .IsUnique();

                    b.ToTable("subject", (string)null);
                });

            modelBuilder.Entity("DB_labb_3.Models.Class", b =>
                {
                    b.HasOne("DB_labb_3.Models.Employee", "Mentor")
                        .WithMany("Classes")
                        .HasForeignKey("MentorId")
                        .HasConstraintName("FK__class__mentor_id__2F10007B");

                    b.Navigation("Mentor");
                });

            modelBuilder.Entity("DB_labb_3.Models.ClassSchema", b =>
                {
                    b.HasOne("DB_labb_3.Models.Class", "Class")
                        .WithMany("ClassSchemas")
                        .HasForeignKey("ClassId")
                        .IsRequired()
                        .HasConstraintName("FK__class_sch__class__412EB0B6");

                    b.HasOne("DB_labb_3.Models.Subject", "Subject")
                        .WithMany("ClassSchemas")
                        .HasForeignKey("SubjectId")
                        .IsRequired()
                        .HasConstraintName("FK__class_sch__subje__403A8C7D");

                    b.Navigation("Class");

                    b.Navigation("Subject");
                });

            modelBuilder.Entity("DB_labb_3.Models.Grade", b =>
                {
                    b.HasOne("DB_labb_3.Models.Employee", "Employee")
                        .WithMany("Grades")
                        .HasForeignKey("EmployeeId")
                        .IsRequired()
                        .HasConstraintName("FK__grade__employee___3A81B327");

                    b.HasOne("DB_labb_3.Models.Student", "Student")
                        .WithMany("Grades")
                        .HasForeignKey("StudentId")
                        .IsRequired()
                        .HasConstraintName("FK__grade__student_i__3B75D760");

                    b.HasOne("DB_labb_3.Models.Subject", "Subject")
                        .WithMany("Grades")
                        .HasForeignKey("SubjectId")
                        .IsRequired()
                        .HasConstraintName("FK__grade__subject_i__398D8EEE");

                    b.Navigation("Employee");

                    b.Navigation("Student");

                    b.Navigation("Subject");
                });

            modelBuilder.Entity("DB_labb_3.Models.RoleGrope", b =>
                {
                    b.HasOne("DB_labb_3.Models.Employee", "Employee")
                        .WithMany("RoleGropes")
                        .HasForeignKey("EmployeeId")
                        .IsRequired()
                        .HasConstraintName("FK__role_grop__emplo__286302EC");

                    b.HasOne("DB_labb_3.Models.Role", "Role")
                        .WithMany("RoleGropes")
                        .HasForeignKey("RoleId")
                        .IsRequired()
                        .HasConstraintName("FK__role_grop__role___29572725");

                    b.Navigation("Employee");

                    b.Navigation("Role");
                });

            modelBuilder.Entity("DB_labb_3.Models.Student", b =>
                {
                    b.HasOne("DB_labb_3.Models.Class", "Class")
                        .WithMany("Students")
                        .HasForeignKey("ClassId")
                        .HasConstraintName("FK__student__class_i__31EC6D26");

                    b.Navigation("Class");
                });

            modelBuilder.Entity("DB_labb_3.Models.Class", b =>
                {
                    b.Navigation("ClassSchemas");

                    b.Navigation("Students");
                });

            modelBuilder.Entity("DB_labb_3.Models.Employee", b =>
                {
                    b.Navigation("Classes");

                    b.Navigation("Grades");

                    b.Navigation("RoleGropes");
                });

            modelBuilder.Entity("DB_labb_3.Models.Role", b =>
                {
                    b.Navigation("RoleGropes");
                });

            modelBuilder.Entity("DB_labb_3.Models.Student", b =>
                {
                    b.Navigation("Grades");
                });

            modelBuilder.Entity("DB_labb_3.Models.Subject", b =>
                {
                    b.Navigation("ClassSchemas");

                    b.Navigation("Grades");
                });
#pragma warning restore 612, 618
        }
    }
}
