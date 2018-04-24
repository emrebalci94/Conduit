using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using System;
using System.Collections.Generic;

namespace Conduit.Data.Migrations
{
    public partial class InitialCreate2 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_ArticleFavorites_Persons_PersonId",
                table: "ArticleFavorites");

            migrationBuilder.DropForeignKey(
                name: "FK_Articles_Persons_AuthorPersonId",
                table: "Articles");

            migrationBuilder.DropForeignKey(
                name: "FK_Comments_Persons_AuthorPersonId",
                table: "Comments");

            migrationBuilder.DropForeignKey(
                name: "FK_FollowedPeoples_Persons_ObserverId",
                table: "FollowedPeoples");

            //migrationBuilder.DropForeignKey(
            //    name: "FK_FollowedPeoples_Persons_TargetId",
            //    table: "FollowedPeoples");

            migrationBuilder.DropTable(
                name: "Persons");

            migrationBuilder.RenameColumn(
                name: "AuthorPersonId",
                table: "Comments",
                newName: "AuthorUserId");

            migrationBuilder.RenameIndex(
                name: "IX_Comments_AuthorPersonId",
                table: "Comments",
                newName: "IX_Comments_AuthorUserId");

            migrationBuilder.RenameColumn(
                name: "AuthorPersonId",
                table: "Articles",
                newName: "AuthorUserId");

            migrationBuilder.RenameIndex(
                name: "IX_Articles_AuthorPersonId",
                table: "Articles",
                newName: "IX_Articles_AuthorUserId");

            migrationBuilder.RenameColumn(
                name: "PersonId",
                table: "ArticleFavorites",
                newName: "UserId");

            migrationBuilder.RenameIndex(
                name: "IX_ArticleFavorites_PersonId",
                table: "ArticleFavorites",
                newName: "IX_ArticleFavorites_UserId");

            migrationBuilder.CreateTable(
                name: "Users",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    Bio = table.Column<string>(nullable: true),
                    Email = table.Column<string>(nullable: true),
                    FirstName = table.Column<string>(nullable: true),
                    Hash = table.Column<byte[]>(nullable: true),
                    Image = table.Column<string>(nullable: true),
                    LastName = table.Column<string>(nullable: true),
                    Salt = table.Column<byte[]>(nullable: true),
                    UserName = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Users", x => x.Id);
                });

            migrationBuilder.AddForeignKey(
                name: "FK_ArticleFavorites_Users_UserId",
                table: "ArticleFavorites",
                column: "UserId",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Articles_Users_AuthorUserId",
                table: "Articles",
                column: "AuthorUserId",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Comments_Users_AuthorUserId",
                table: "Comments",
                column: "AuthorUserId",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_FollowedPeoples_Users_ObserverId",
                table: "FollowedPeoples",
                column: "ObserverId",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            //migrationBuilder.AddForeignKey(
            //    name: "FK_FollowedPeoples_Users_TargetId",
            //    table: "FollowedPeoples",
            //    column: "TargetId",
            //    principalTable: "Users",
            //    principalColumn: "Id",
            //    onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_ArticleFavorites_Users_UserId",
                table: "ArticleFavorites");

            migrationBuilder.DropForeignKey(
                name: "FK_Articles_Users_AuthorUserId",
                table: "Articles");

            migrationBuilder.DropForeignKey(
                name: "FK_Comments_Users_AuthorUserId",
                table: "Comments");

            migrationBuilder.DropForeignKey(
                name: "FK_FollowedPeoples_Users_ObserverId",
                table: "FollowedPeoples");

            //migrationBuilder.DropForeignKey(
            //    name: "FK_FollowedPeoples_Users_TargetId",
            //    table: "FollowedPeoples");

            migrationBuilder.DropTable(
                name: "Users");

            migrationBuilder.RenameColumn(
                name: "AuthorUserId",
                table: "Comments",
                newName: "AuthorPersonId");

            migrationBuilder.RenameIndex(
                name: "IX_Comments_AuthorUserId",
                table: "Comments",
                newName: "IX_Comments_AuthorPersonId");

            migrationBuilder.RenameColumn(
                name: "AuthorUserId",
                table: "Articles",
                newName: "AuthorPersonId");

            migrationBuilder.RenameIndex(
                name: "IX_Articles_AuthorUserId",
                table: "Articles",
                newName: "IX_Articles_AuthorPersonId");

            migrationBuilder.RenameColumn(
                name: "UserId",
                table: "ArticleFavorites",
                newName: "PersonId");

            migrationBuilder.RenameIndex(
                name: "IX_ArticleFavorites_UserId",
                table: "ArticleFavorites",
                newName: "IX_ArticleFavorites_PersonId");

            migrationBuilder.CreateTable(
                name: "Persons",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    Bio = table.Column<string>(nullable: true),
                    Email = table.Column<string>(nullable: true),
                    FirstName = table.Column<string>(nullable: true),
                    Hash = table.Column<byte[]>(nullable: true),
                    Image = table.Column<string>(nullable: true),
                    LastName = table.Column<string>(nullable: true),
                    Salt = table.Column<byte[]>(nullable: true),
                    UserName = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Persons", x => x.Id);
                });

            migrationBuilder.AddForeignKey(
                name: "FK_ArticleFavorites_Persons_PersonId",
                table: "ArticleFavorites",
                column: "PersonId",
                principalTable: "Persons",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Articles_Persons_AuthorPersonId",
                table: "Articles",
                column: "AuthorPersonId",
                principalTable: "Persons",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Comments_Persons_AuthorPersonId",
                table: "Comments",
                column: "AuthorPersonId",
                principalTable: "Persons",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_FollowedPeoples_Persons_ObserverId",
                table: "FollowedPeoples",
                column: "ObserverId",
                principalTable: "Persons",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            //migrationBuilder.AddForeignKey(
            //    name: "FK_FollowedPeoples_Persons_TargetId",
            //    table: "FollowedPeoples",
            //    column: "TargetId",
            //    principalTable: "Persons",
            //    principalColumn: "Id",
            //    onDelete: ReferentialAction.Cascade);
        }
    }
}
