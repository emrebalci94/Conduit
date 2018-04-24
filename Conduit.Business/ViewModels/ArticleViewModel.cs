using Conduit.Common.Dto;
using Conduit.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Conduit.Business.ViewModels
{
    public class ArticleViewModel
    {
        public int Id { get; set; }
        public int? AuthorUserId { get; set; }
        public string Body { get; set; }
        public DateTime CreatedAt { get; set; }
        public string Description { get; set; }
        public string Slug { get; set; }
        public string Title { get; set; }
        public DateTime UpdatedAt { get; set; }

        public UserDto AuthorUser { get; set; }
        public List<string> Tags { get; set; }
        public List<int> LikedUserIds { get; set; }
    }
}
