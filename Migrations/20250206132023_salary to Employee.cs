using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DB_labb_3.Migrations
{
    /// <inheritdoc />
    public partial class salarytoEmployee : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<decimal>(
                name: "salary",
                table: "employee",
                type: "decimal(10,2)",
                nullable: true,
                defaultValue: 0m);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "salary",
                table: "employee");
        }
    }
}
