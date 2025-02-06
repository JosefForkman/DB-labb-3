using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DB_labb_3.Migrations
{
    /// <inheritdoc />
    public partial class addStartDatetoEmployee : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<DateOnly>(
                name: "start_date",
                table: "employee",
                type: "date",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "start_date",
                table: "employee");
        }
    }
}
