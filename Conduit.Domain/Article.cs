using Conduit.Common.Entity;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;

namespace Conduit.Domain
{
    public class Article : BaseEntity
    {
        public Article()
        {
            ArticleFavorites = new HashSet<ArticleFavorite>();
            ArticleTags = new HashSet<ArticleTag>();
            Comments = new HashSet<Comment>();
        }

        public int? AuthorUserId { get; set; }
        public string Body { get; set; }
        public DateTime CreatedAt { get; set; }
        public string Description { get; set; }
        public string Slug { get; set; }
        public string Title { get; set; }
        public DateTime UpdatedAt { get; set; }

        public User AuthorUser { get; set; }
        public ICollection<ArticleFavorite> ArticleFavorites { get; set; }
        public ICollection<ArticleTag> ArticleTags { get; set; }
        public ICollection<Comment> Comments { get; set; }
    }
}
