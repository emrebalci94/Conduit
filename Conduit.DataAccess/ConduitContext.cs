using Conduit.Domain;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;

namespace Conduit.Data
{
    public class ConduitContext : DbContext
    {
        public ConduitContext(DbContextOptions<ConduitContext> options):base(options)
        {

        }

        public DbSet<Article> Articles { get; set; }
        public DbSet<Comment> Comments { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<Tag> Tags { get; set; }
        public DbSet<ArticleTag> ArticleTags { get; set; }
        public DbSet<ArticleFavorite> ArticleFavorites { get; set; }
        public DbSet<FollowedPeople> FollowedPeoples { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ArticleFavorite>((Action<Microsoft.EntityFrameworkCore.Metadata.Builders.EntityTypeBuilder<ArticleFavorite>>)((Microsoft.EntityFrameworkCore.Metadata.Builders.EntityTypeBuilder<ArticleFavorite> entity) =>
            {
                entity.HasKey(e => (new { e.ArticleId, e.UserId }));

                entity.HasIndex(e => e.UserId);

                entity.HasOne(d => d.Article)
                    .WithMany((System.Linq.Expressions.Expression<Func<Article, IEnumerable<ArticleFavorite>>>)(p => (IEnumerable<ArticleFavorite>)p.ArticleFavorites))
                    .HasForeignKey(d => d.ArticleId);

                entity.HasOne(d => d.User)
                    .WithMany((System.Linq.Expressions.Expression<Func<User, IEnumerable<ArticleFavorite>>>)(p => (IEnumerable<ArticleFavorite>)p.ArticleFavorites))
                    .HasForeignKey(d => d.UserId);
            }));

            modelBuilder.Entity<Article>(entity =>
            {
                entity.HasKey(e => e.Id);

                entity.HasIndex(e => e.AuthorUserId);

                entity.HasOne(d => d.AuthorUser)
                    .WithMany(p => p.Articles)
                    .HasForeignKey(d => d.AuthorUserId);
            });

            modelBuilder.Entity<ArticleTag>(entity =>
            {
                entity.HasKey(e => new { e.ArticleId, e.TagId });

                entity.HasIndex(e => e.TagId);

                entity.HasOne(d => d.Article)
                    .WithMany(p => p.ArticleTags)
                    .HasForeignKey(d => d.ArticleId);

                entity.HasOne(d => d.Tag)
                    .WithMany(p => p.ArticleTags)
                    .HasForeignKey(d => d.TagId);
            });

            modelBuilder.Entity<Comment>((Action<Microsoft.EntityFrameworkCore.Metadata.Builders.EntityTypeBuilder<Comment>>)((Microsoft.EntityFrameworkCore.Metadata.Builders.EntityTypeBuilder<Comment> entity) =>
            {
                entity.HasKey(e => e.Id);

                entity.HasIndex(e => e.ArticleId);

                entity.HasIndex(e => e.AuthorUserId);

                entity.HasOne(d => d.Article)
                    .WithMany((System.Linq.Expressions.Expression<Func<Article, IEnumerable<Comment>>>)(p => (IEnumerable<Comment>)p.Comments))
                    .HasForeignKey(d => d.ArticleId);

                entity.HasOne(d => d.AuthorUser)
                    .WithMany((System.Linq.Expressions.Expression<Func<User, IEnumerable<Comment>>>)(p => (IEnumerable<Comment>)p.Comments))
                    .HasForeignKey(d => d.AuthorUserId);
            }));

            modelBuilder.Entity<FollowedPeople>(entity =>
            {
                entity.HasKey(e => new { e.ObserverId, e.TargetId });

                entity.HasIndex(e => e.TargetId);

                entity.HasOne(d => d.Observer)
                    .WithMany(p => p.FollowedPeoples)
                    .HasForeignKey(d => d.ObserverId);

            });

            modelBuilder.Entity<Article>(entity =>
            {
                entity.HasKey(e => e.Id);
            });

            modelBuilder.Entity<Tag>(entity =>
            {
                entity.HasKey(e => e.TagId);

                entity.Property(e => e.TagId).ValueGeneratedNever();
            });
        }
    }
}
