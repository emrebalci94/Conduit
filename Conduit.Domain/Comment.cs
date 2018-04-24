using Conduit.Common.Entity;
using Newtonsoft.Json;
using System;

namespace Conduit.Domain
{
    public class Comment:BaseEntity
    {
        public int? ArticleId { get; set; }
        public int? AuthorUserId { get; set; }
        public string Body { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }

        public Article Article { get; set; }
        public User AuthorUser { get; set; }
    }
}