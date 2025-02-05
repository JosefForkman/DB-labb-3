using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DB_labb_3.Migrations
{
    /// <inheritdoc />
    public partial class InitialCreate : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "employee",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    first_name = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: true),
                    last_name = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__employee__3213E83F96E0A02F", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "role",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    name = table.Column<string>(type: "varchar(80)", unicode: false, maxLength: 80, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__role__3213E83FB1A3DF13", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "subject",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    name = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: false),
                    discription = table.Column<string>(type: "varchar(800)", unicode: false, maxLength: 800, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__subject__3213E83FEE79BB45", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "class",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    name = table.Column<string>(type: "varchar(50)", unicode: false, maxLength: 50, nullable: false),
                    start_date = table.Column<DateTime>(type: "datetime", nullable: false, defaultValueSql: "(getdate())"),
                    end_date = table.Column<DateTime>(type: "datetime", nullable: false, defaultValueSql: "(getdate())"),
                    mentor_id = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__class__3213E83F40C65ACA", x => x.id);
                    table.ForeignKey(
                        name: "FK__class__mentor_id__2F10007B",
                        column: x => x.mentor_id,
                        principalTable: "employee",
                        principalColumn: "id");
                });

            migrationBuilder.CreateTable(
                name: "role_grope",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    employee_id = table.Column<int>(type: "int", nullable: false),
                    role_id = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__role_gro__3213E83FB6BE31D0", x => x.id);
                    table.ForeignKey(
                        name: "FK__role_grop__emplo__286302EC",
                        column: x => x.employee_id,
                        principalTable: "employee",
                        principalColumn: "id");
                    table.ForeignKey(
                        name: "FK__role_grop__role___29572725",
                        column: x => x.role_id,
                        principalTable: "role",
                        principalColumn: "id");
                });

            migrationBuilder.CreateTable(
                name: "class_schema",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    start_date = table.Column<DateTime>(type: "datetime", nullable: false, defaultValueSql: "(getdate())"),
                    end_date = table.Column<DateTime>(type: "datetime", nullable: false, defaultValueSql: "(getdate())"),
                    subject_id = table.Column<int>(type: "int", nullable: false),
                    class_id = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__class_sc__3213E83FEB2ACFDB", x => x.id);
                    table.ForeignKey(
                        name: "FK__class_sch__class__412EB0B6",
                        column: x => x.class_id,
                        principalTable: "class",
                        principalColumn: "id");
                    table.ForeignKey(
                        name: "FK__class_sch__subje__403A8C7D",
                        column: x => x.subject_id,
                        principalTable: "subject",
                        principalColumn: "id");
                });

            migrationBuilder.CreateTable(
                name: "student",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    first_name = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: true),
                    last_name = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: true),
                    personal_code_number = table.Column<string>(type: "varchar(14)", unicode: false, maxLength: 14, nullable: true),
                    class_id = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__student__3213E83F3B851BDB", x => x.id);
                    table.ForeignKey(
                        name: "FK__student__class_i__31EC6D26",
                        column: x => x.class_id,
                        principalTable: "class",
                        principalColumn: "id");
                });

            migrationBuilder.CreateTable(
                name: "grade",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    level = table.Column<string>(type: "varchar(3)", unicode: false, maxLength: 3, nullable: false),
                    created_at = table.Column<DateTime>(type: "datetime", nullable: false, defaultValueSql: "(getdate())"),
                    updated_at = table.Column<DateTime>(type: "datetime", nullable: false, defaultValueSql: "(getdate())"),
                    subject_id = table.Column<int>(type: "int", nullable: false),
                    employee_id = table.Column<int>(type: "int", nullable: false),
                    student_id = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__grade__3213E83F2E3E999E", x => x.id);
                    table.ForeignKey(
                        name: "FK__grade__employee___3A81B327",
                        column: x => x.employee_id,
                        principalTable: "employee",
                        principalColumn: "id");
                    table.ForeignKey(
                        name: "FK__grade__student_i__3B75D760",
                        column: x => x.student_id,
                        principalTable: "student",
                        principalColumn: "id");
                    table.ForeignKey(
                        name: "FK__grade__subject_i__398D8EEE",
                        column: x => x.subject_id,
                        principalTable: "subject",
                        principalColumn: "id");
                });

            migrationBuilder.CreateIndex(
                name: "IX_class_mentor_id",
                table: "class",
                column: "mentor_id");

            migrationBuilder.CreateIndex(
                name: "UQ__class__72E12F1B12AA3B38",
                table: "class",
                column: "name",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_class_schema_class_id",
                table: "class_schema",
                column: "class_id");

            migrationBuilder.CreateIndex(
                name: "IX_class_schema_subject_id",
                table: "class_schema",
                column: "subject_id");

            migrationBuilder.CreateIndex(
                name: "IX_grade_employee_id",
                table: "grade",
                column: "employee_id");

            migrationBuilder.CreateIndex(
                name: "IX_grade_student_id",
                table: "grade",
                column: "student_id");

            migrationBuilder.CreateIndex(
                name: "IX_grade_subject_id",
                table: "grade",
                column: "subject_id");

            migrationBuilder.CreateIndex(
                name: "UQ__role__72E12F1B3AB05169",
                table: "role",
                column: "name",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_role_grope_employee_id",
                table: "role_grope",
                column: "employee_id");

            migrationBuilder.CreateIndex(
                name: "IX_role_grope_role_id",
                table: "role_grope",
                column: "role_id");

            migrationBuilder.CreateIndex(
                name: "IX_student_class_id",
                table: "student",
                column: "class_id");

            migrationBuilder.CreateIndex(
                name: "UQ__subject__72E12F1BB5F75BF6",
                table: "subject",
                column: "name",
                unique: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "class_schema");

            migrationBuilder.DropTable(
                name: "grade");

            migrationBuilder.DropTable(
                name: "role_grope");

            migrationBuilder.DropTable(
                name: "student");

            migrationBuilder.DropTable(
                name: "subject");

            migrationBuilder.DropTable(
                name: "role");

            migrationBuilder.DropTable(
                name: "class");

            migrationBuilder.DropTable(
                name: "employee");
        }
    }
}
