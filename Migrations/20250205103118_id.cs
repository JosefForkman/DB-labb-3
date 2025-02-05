using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DB_labb_3.Migrations
{
    /// <inheritdoc />
    public partial class id : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropPrimaryKey(
                name: "PK__role_gro__3213E83FB6BE31D0",
                table: "role_grope");

            migrationBuilder.AddPrimaryKey(
                name: "PK__role_gro__3213E83FC465BE71",
                table: "role_grope",
                column: "id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropPrimaryKey(
                name: "PK__role_gro__3213E83FC465BE71",
                table: "role_grope");

            migrationBuilder.AddPrimaryKey(
                name: "PK__role_gro__3213E83FB6BE31D0",
                table: "role_grope",
                column: "id");
        }
    }
}
